-- Create tables
CREATE TABLE AIRCRAFT (
    Aircraft_ID INT PRIMARY KEY,
    Aircraft_name VARCHAR(255),
    Cruising_range INT
);

CREATE TABLE EMPLOYEE (
    Emp_ID INT PRIMARY KEY,
    Ename VARCHAR(255),
    Salary INT
);

CREATE TABLE CERTIFIED (
    EID INT,
    AID INT,
    FOREIGN KEY (EID) REFERENCES EMPLOYEE(Emp_ID),
    FOREIGN KEY (AID) REFERENCES AIRCRAFT(Aircraft_ID)
);

-- Insert data into tables
INSERT INTO AIRCRAFT VALUES
(1, 'Boeing 737', 5000),
(2, 'Airbus A320', 4800),
(3, 'Boeing 747', 8000),
(4, 'Airbus A380', 8500),
(5, 'Cessna 172', 800);

INSERT INTO EMPLOYEE VALUES
(101, 'John Smith', 60000),
(102, 'Alice Johnson', 60000),
(103, 'Bob Davis', 52000),
(104, 'Emily Wilson', 48000),
(105, 'Michael Brown', 51000);

INSERT INTO CERTIFIED VALUES
(101, 1),
(104, 3),
(102, 1),
(102, 2),
(103, 3),
(103, 4),
(104, 5);

select * from AIRCRAFT;
select * from EMPLOYEE;
select * from CERTIFIED;


#Query-1#
select Emp_ID
from EMPLOYEE
where Salary = (Select MAX(Salary) from EMPLOYEE);


#Query-2#
select distinct Aircraft_name
from AIRCRAFT, EMPLOYEE, CERTIFIED
where Aircraft_ID=AID and EID=Emp_ID and Salary>=60000;

#Query-3#
select Emp_ID,Ename
from EMPLOYEE
where Emp_ID not in (select distinct EID from CERTIFIED);
