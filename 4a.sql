-- Create tables
CREATE TABLE SUPPLIER (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(255),
    Address VARCHAR(255)
);

CREATE TABLE PART (
    PID INT PRIMARY KEY,
    Pname VARCHAR(255),
    Color VARCHAR(50)
);

CREATE TABLE SHIPMENT (
    FSid INT,
    FPID INT,
    Cost INT,
    FOREIGN KEY (FSid) REFERENCES SUPPLIER(Sid),
    FOREIGN KEY (FPID) REFERENCES PART(PID)
);

-- Insert data into tables
INSERT INTO SUPPLIER VALUES
(1, 'Supplier 1', 'Address 1'),
(2, 'Supplier 2', 'Address 2'),
(3, 'Supplier 3', 'Address 3'),
(4, 'Supplier 4', 'Address 4'),
(5, 'Supplier 5', 'Address 5');

INSERT INTO PART VALUES
(101, 'Part 1', 'Red'),
(102, 'Part 2', 'Green'),
(103, 'Part 3', 'Blue'),
(104, 'Part 4', 'Yellow'),
(105, 'Part 5', 'Green');

INSERT INTO SHIPMENT VALUES
(1, 101, 100),
(1, 102, 120),
(2, 103, 110),
(3, 101, 90),
(3, 104, 150),
(4, 102, 130),
(5, 105, 140);


select * from SUPPLIER;
select * from PART;
select * from SHIPMENT;

#Query-1#
select FSid as ID 
from PART,SHIPMENT
where PID=FPID and Color='Green';


#Query-2#
select Sid, Sname, Count(*) as NoOfParts
from SUPPLIER
left join SHIPMENT on Sid=Fsid
group by Sid,Sname;


#Query-3#
update PART set Color='Yellow' where PID in (select FPID from SHIPMENT where FSid=3);

select * from PART;
