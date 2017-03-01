# copy your fibonacci_iterative and fibonacci_recursive code from your previous challenge here
# Implement benchmarking code using the Benchmark module inside the "run" method


def fibonacci_iterative(n)
  n1 = 1
  n2 = 1
  array = []
  
  while array.length < n
      if array.length < 2
        array << n1
        array << n2
      end
      n1 = n1 + n2
      array << n1
      n2 = n1 + n2
      array << n2
  end
  array[n - 1]
end

def fibonacci_recursive(n)
  return n if n == 0
  return n if n == 1
  n = fibonacci_recursive(n - 1) + fibonacci_recursive(n-2)
end

def run
  require "benchmark"
 puts Benchmark.measure { 1000.times do
  fibonacci_iterative(10) 
  end
 }
 puts Benchmark.measure {1000.times do 
  fibonacci_recursive(10)
  end
  }
end
run