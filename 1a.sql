create table sailors(sid int primary key, sname varchar(50), rating int, age int);
create table boats(bid int primary key, bname varchar(50), colour varchar(50));
create table reserves(fsid int, fbid int, day date, foreign key(fsid) references sailors(sid), foreign key(fbid) references boats(bid));
insert into sailors values
(101, 'John', 8, 25),
(102, 'Alice', 7, 28),
(103, 'Bob', 6, 22),
(104, 'Emily', 9, 30),
(105, 'David', 8, 26),
(106, 'Neeraj', 10, 25);

insert into boats values
(201, 'Sailboat1', 'Red'),
(202, 'Speedboat1', 'Green'),
(203, 'Rowboat1', 'Blue'),
(204, 'Canoe1', 'Red'),
(205, 'Yacht1', 'Green');

insert into reserves values
(101, 201, '2023-01-01'),
(102, 202, '2023-01-02'),
(103, 203, '2023-01-03'),
(104, 204, '2023-01-04'),
(101, 205, '2023-01-05');
select * from sailors;
select * from boats;
select * from reserves;


#Query-1#
select distinct sname
from sailors, reserves
where sid=fsid;


#Query-2#
select distinct fsid
from boats, reserves
where bid=fbid and (colour='Red' or colour='Green');

#Query-3#
select sid
from sailors
where sid not in(select fsid from reserves);
