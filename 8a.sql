-- Create PLAYER table
CREATE TABLE PLAYER (
    PId INT PRIMARY KEY,
    Lname VARCHAR(255),
    Fname VARCHAR(255),
    Country VARCHAR(255),
    Yborn INT,
    Bplace VARCHAR(255)
);

-- Create MATCH table
CREATE TABLE MATCHING (
    MatchId INT PRIMARY KEY,
    Team1 VARCHAR(255),
    Team2 VARCHAR(255),
    Ground VARCHAR(255),
    Date DATE,
    Winner VARCHAR(255)
);

-- Create BATTING table
CREATE TABLE BATTING (
    B_MatchId INT,
    B_Pid INT,
    Nruns INT,
    Fours INT,
    Sixes INT,
    FOREIGN KEY (B_MatchId) REFERENCES MATCHING(MatchId),
    FOREIGN KEY (B_Pid) REFERENCES PLAYER(PId)
);

-- Create BOWLING table
CREATE TABLE BOWLING (
    S_MatchId INT,
    S_Pid INT,
    Novers INT,
    Maidens INT,
    Nruns INT,
    Nwickets INT,
    FOREIGN KEY (S_MatchId) REFERENCES MATCHING(MatchId),
    FOREIGN KEY (S_Pid) REFERENCES PLAYER(PId)
);

-- Insert values into PLAYER table
INSERT INTO PLAYER VALUES
    (1, 'Smith', 'Steve', 'Australia', 1989, 'Sydney'),
    (2, 'Kohli', 'Virat', 'India', 1988, 'Delhi'),
    (3, 'Dhoni', 'Mahendra', 'India', 1981, 'Ranchi'),
    (4, 'Root', 'Joe', 'England', 1990, 'Sheffield'),
    (5, 'Warner', 'David', 'Australia', 1986, 'Sydney');

-- Insert values into MATCH table
INSERT INTO MATCHING VALUES
    (1, 'Australia', 'England', 'Melbourne Cricket Ground', '2023-01-01', 'Australia'),
    (2, 'India', 'England', 'Eden Gardens', '2023-01-02', 'India'),
    (3, 'Australia', 'India', 'Sydney Cricket Ground', '2023-01-03', 'India'),
    (4, 'England', 'India', 'Lord''s Cricket Ground', '2023-01-04', 'India'),
    (5, 'Australia', 'India', 'Wankhede Stadium', '2023-01-05', 'Australia');

-- Insert values into BATTING table
INSERT INTO BATTING VALUES
    (1, 1, 50, 5, 1),
    (2, 2, 60, 7, 2),
    (3, 3, 70, 8, 3),
    (4, 4, 80, 9, 4),
    (5, 5, 90, 10, 5);

-- Insert values into BOWLING table
INSERT INTO BOWLING VALUES
    (1, 1, 10, 2, 30, 3),
    (2, 2, 12, 3, 40, 4),
    (3, 3, 14, 4, 50, 5),
    (4, 4, 16, 5, 60, 6),
    (5, 5, 18, 6, 70, 7);
    
select * from PLAYER;
select * from MATCHING;
SELECT * FROM BATTING;
SELECT * FROM BOWLING;


select ground
from MATCHING
where Team1='Australia'
order by ground DESC;


select m.*
from BATTING b
join MATCHING m
where B_MatchId=MatchId and B_Pid=(Select PId from PLAYER where Lname='Dhoni');


select Fname,Lname
from PLAYER,BATTING
where B_Pid=PId and B_MatchId=3;
