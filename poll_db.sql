CREATE TABLE congress_members (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(64) NOT NULL,
  party VARCHAR(64) NOT NULL,
  location VARCHAR(64) NOT NULL,
  grade_1996 REAL, 
  grade_current REAL, 
  years_in_congress INTEGER,
  dw1_score REAL
, created_at DATETIME, updated_at DATETIME);

CREATE TABLE voters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(64) NOT NULL,
    last_name  VARCHAR(64) NOT NULL,
    gender VARCHAR(64) NOT NULL,
    party VARCHAR(64) NOT NULL,
    party_duration INTEGER, 
    age INTEGER,
    married INTEGER,
    children_count INTEGER,
    homeowner INTEGER, 
    employed INTEGER, 
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
  );

CREATE TABLE votes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    voter_id INTEGER,
    politician_id INTEGER,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY(voter_id) REFERENCES voters(id),
    FOREIGN KEY(politician_id) REFERENCES congress_members(id)
  );


SELECT COUNT(*)
FROM congress_members INNER JOIN votes 
ON congress_members.id = votes.politician_id
WHERE congress_members.name = "Rep. Erik Paulsen";

SELECT congress_members.name, COUNT(votes.politician_id) 
FROM congress_members 
INNER JOIN votes ON congress_members.id = votes.politician_id 
GROUP BY congress_members.name 
ORDER BY COUNT(votes.politician_id) DESC);

SELECT congress_members.name, COUNT(votes.politician_id) 
FROM congress_members 
INNER JOIN votes ON congress_members.id = votes.politician_id 
GROUP BY congress_members.name 
ORDER BY COUNT(votes.politician_id) ASC;

SELECT congress_members.name, COUNT(votes.politician_id)
FROM congress_members
INNER JOIN votes ON congress_members.id = votes.politician_id
GROUP BY congress_members.name
ORDER BY COUNT(votes.politician_id) DESC LIMIT 1;

SELECT voters.first_name, voters.last_name, voters.gender, voters.party
FROM voters
INNER JOIN votes ON voters.id = votes.voter_id
WHERE votes.politician_id 
IN (SELECT votes.politician_id
FROM congress_members
INNER JOIN votes ON congress_members.id = votes.politician_id
GROUP BY congress_members.name
ORDER BY COUNT(votes.politician_id) DESC LIMIT 1);

SELECT name, location, grade_1996, grade_current, COUNT(politician_id)
FROM congress_members INNER JOIN votes ON congress_members.id = votes.politician_id
WHERE congress_members.grade_current < 9
GROUP BY congress_members.name;

SELECT congress_members.location, COUNT(votes.politician_id)
FROM congress_members 
INNER JOIN votes ON congress_members.id = votes.politician_id
GROUP BY congress_members.location
ORDER BY COUNT(votes.politician_id) DESC LIMIT 10;


SELECT voters.id, voters.first_name, voters.last_name, COUNT(votes.voter_id)
FROM voters INNER JOIN votes
ON voters.id = votes.voter_id
GROUP BY voters.id
HAVING COUNT(votes.voter_id) > 2;

