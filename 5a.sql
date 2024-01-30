CREATE TABLE AIRCRAFT (
    Aircraft_ID INT PRIMARY KEY,
    Aircraft_name VARCHAR(50),
    Cruising_range INT
);

CREATE TABLE CERTIFIED (
    EID INT,
    AID INT,
    FOREIGN KEY (EID) REFERENCES EMPLOYEE(Emp_ID),
    FOREIGN KEY (AID) REFERENCES AIRCRAFT(Aircraft_ID)
);

CREATE TABLE EMPLOYEE (
    Emp_ID INT PRIMARY KEY,
    Ename VARCHAR(50),
    Salary INT
);


INSERT INTO AIRCRAFT VALUES
    (1, 'Boeing 747', 5000),
    (2, 'Airbus A380', 5500),
    (3, 'Boeing 737', 4000),
    (4, 'Airbus A320', 4500),
    (5, 'Embraer E190', 3000);


INSERT INTO EMPLOYEE VALUES
    (101, 'John Smith', 60000),
    (102, 'Alice Johnson', 55000),
    (103, 'Bob Davis', 58000),
    (104, 'Emily Wilson', 52000),
    (105, 'Michael Brown', 62000);


INSERT INTO CERTIFIED VALUES
    (101, 1),
    (102, 2), 
    (103, 1), 
    (104, 3), 
    (105, 4); 

Select * from AIRCRAFT;
Select * from EMPLOYEE;
Select * from CERTIFIED;


#Query-1#
Select Ename
from EMPLOYEE, CERTIFIED, AIRCRAFT
where AID=Aircraft_ID and EID=Emp_ID and Aircraft_name="Boeing 747";

#Query-2#
Select * 
from AIRCRAFT
ORDER BY Cruising_range ASC;


#Query-3#
Select distinct Ename
from EMPLOYEE,AIRCRAFT,CERTIFIED
where Emp_ID in 
(select EID from CERTIFIED,AIRCRAFT where AID=Aircraft_ID and AID not in (Select Aircraft_ID from AIRCRAFT where Aircraft_name='Boeing 747') and Cruising_range>4000);
