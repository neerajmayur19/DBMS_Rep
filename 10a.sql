-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    cust_no INT PRIMARY KEY,
    cname VARCHAR(255),
    city VARCHAR(255)
);

-- Create ORDER table
CREATE TABLE ORDERING (
    order_no INT PRIMARY KEY,
    odate DATE,
    o_cust_no INT,
    ord_amt INT,
    FOREIGN KEY (o_cust_no) REFERENCES CUSTOMER(cust_no)
);

-- Create ORDER_ITEM table
CREATE TABLE ORDER_ITEM (
    or_order_no INT primary key,
    item_no INT,
    qty INT,
    FOREIGN KEY (or_order_no) REFERENCES ORDERING(order_no)
);

-- Create ITEM table
CREATE TABLE ITEM (
    it_item_no INT PRIMARY KEY,
    unit_price INT
);

-- Create SHIPMENT table
CREATE TABLE SHIPMENT (
    sh_order_no INT PRIMARY KEY,
    ship_date DATE,
    FOREIGN KEY (sh_order_no) REFERENCES ORDERING(order_no)
);

-- Insert sample data into CUSTOMER table
INSERT INTO CUSTOMER VALUES
    (1, 'John Doe', 'Bangalore'),
    (2, 'Jane Smith', 'Los Angeles'),
    (3, 'Alice Johnson', 'Chicago'),
    (4, 'Bob Brown', 'Bangalore'),
    (5, 'Emily Davis', 'San Francisco');

-- Insert sample data into ORDER table
INSERT INTO ORDERING VALUES
    (1, '2023-01-01', 1, 100),
    (2, '2023-01-01', 2, 150),
    (3, '2023-01-03', 1, 200),
    (4, '2023-01-04', 2, 250),
    (5, '2023-01-05', 5, 300);

-- Insert sample data into ORDER_ITEM table
INSERT INTO ORDER_ITEM VALUES
    (1, 10, 2),
    (2, 2, 3),
    (3, 3, 4),
    (4, 4, 5),
    (5, 5, 6);

-- Insert sample data into ITEM table
INSERT INTO ITEM VALUES
    (10, 10),
    (2, 20),
    (3, 30),
    (4, 40),
    (5, 50);

-- Insert sample data into SHIPMENT table
INSERT INTO SHIPMENT VALUES
    (1, '2023-01-02'),
    (2, '2023-01-03'),
    (3, '2023-01-04'),
    (4, '2023-01-05'),
    (5, '2023-01-06');
    
select * from CUSTOMER;
select * from ORDERING;
select * from ORDER_ITEM;
select * from ITEM;
select * from SHIPMENT;

select cname,count(o_cust_no) as no_of_orders
from CUSTOMER
join ORDERING
where o_cust_no=cust_no and city='Bangalore'
group by cname;


select cname,count(o_cust_no) as no_of_orders
from CUSTOMER
join ORDERING
where cust_no=o_cust_no
group by cname
having no_of_orders>=1;


SELECT c.cname
FROM CUSTOMER c
LEFT JOIN ORDER_ITEM oi ON c.cust_no = oi.or_order_no AND oi.item_no = 10
WHERE oi.or_order_no IS NULL;
