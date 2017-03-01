																													
require 'csv'
# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (model)
# 4. Manipulating the in-memory objects that model a real-life TODO list (domain-specific model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
class Task
	attr_accessor :title, :completed

	def initialize(title)
		@title = title
	end
end

class List
	attr_accessor :file, :tasks

	def initialize(file_name)
		@file = file_name
		@tasks = nil
	end

	def tasks

		@tasks = []
    
    	CSV.foreach(@file) do |row|
     	 @tasks << row
    	end

    	return @tasks if @tasks

	end

	def add(string)

		new_task = Task.new(string)
		temp = ["N"]
		temp << new_task.title

		if @tasks
		   @tasks << temp
		else 
		    @tasks = []
		    @tasks << temp
	    end 
	end

	def delete(num)
		if @tasks
			@tasks.delete_at(num.to_i - 1)
		end
	end

	def save
		CSV.open(@file, "w") do |csv|
       		@tasks.each do |i|
         	csv << i
       	 end
     	end
	end

	def complete(num)
		if @tasks
			counter = 0
			while counter < @tasks.length
				if counter == (num.to_i - 1)
					@tasks[counter][0] = "Y"
				end
			counter +=1
			end
		end
	end

	def print_list
		if @tasks
		    counter = 0
	    	while counter < @tasks.length
	    		puts "#{counter + 1}. #{
	    		if @tasks[counter][0] == "Y"
	    			 "[X]"
	    		else 
	    			 "[ ]"
	    		end
	    		} #{@tasks[counter][1]}" 
	    		counter += 1
	    	end
    	end
	end

end


list = List.new('todo.csv')
tasks = list.tasks

case ARGV[0]
 	when 'add'
 		ARGV.shift
 		list.add(ARGV.join(' '))
 		list.save
 		list.print_list
    when 'list'
    	list.print_list
    when 'delete'
    	list.delete(ARGV[1])
    	list.save
    	list.print_list
  	when 'complete'
  		list.complete(ARGV[1])
  		list.save
  		list.print_list
end