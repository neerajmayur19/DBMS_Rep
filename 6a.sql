CREATE TABLE EMPLOYEE (
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    SSN VARCHAR(11) PRIMARY KEY,
    Addrs VARCHAR(100),
    Sex CHAR(1),
    Salary INT,
    SuperSSN VARCHAR(11),
    Dno INT,
    FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE DEPARTMENT (
    Dname VARCHAR(50),
    Dnumber INT PRIMARY KEY,
    MgrSSN VARCHAR(11),
    MgrStartDate DATE,
    FOREIGN KEY (MgrSSN) REFERENCES EMPLOYEE(SSN)
);

CREATE TABLE DEPENDENT (
    Depname VARCHAR(50),
    ESSN VARCHAR(11),
    FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN)
);

INSERT INTO EMPLOYEE VALUES 
    ('John', 'Doe', '123-45-6789', '123 Main St', 'M', 60000.00, NULL, 1),
    ('Jane', 'Smith', '234-56-7890', '456 Elm St', 'F', 70000.00, '123-45-6789', 1),
    ('Michael', 'Johnson', '345-67-8901', '789 Oak St', 'M', 55000.00, '123-45-6789', 2),
    ('Emily', 'Brown', '456-78-9012', '987 Pine St', 'F', 65000.00, '123-45-6789', 2),
    ('David', 'Davis', '567-89-0123', '654 Birch St', 'M', 75000.00, NULL, 2);
    
INSERT INTO DEPARTMENT VALUES 
    ('Technology', 1, '123-45-6789', '2023-01-01'),
    ('Human Resources', 2, '234-56-7890', '2023-01-01'),
    ('Finance', 3, '345-67-8901', '2023-01-01'),
    ('Marketing', 4, '456-78-9012', '2023-01-01'),
    ('Operations', 5, '567-89-0123', '2023-01-01');

INSERT INTO DEPENDENT VALUES 
    ('Jane', '234-56-7890'),
    ('Emily', '345-67-8901'),
    ('Michael', '567-89-0123'),
    ('John', '123-45-6789'),
    ('David', '567-89-0123');

select * from EMPLOYEE;
select * from DEPARTMENT;
select * from DEPENDENT;

select Dname, AVG(Salary) as Average
from DEPARTMENT
join EMPLOYEE WHERE Dnumber=Dno
group by Dname;

select distinct Fname, Lname
from EMPLOYEE,DEPARTMENT,DEPENDENT
where ESSN=MgrSSN and MgrSSN=SSN;

select *
from DEPARTMENT
where Dname like '%tech%';
