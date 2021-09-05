CREATE DATABASE CANDLE_SHOP;

CREATE TABLE products
(Product_Sku INTEGER,
Product_Name VARCHAR (30),
Product_Range VARCHAR (20),
Supplier VARCHAR (30),
SupplierID INTEGER,
Cost_Price FLOAT,
Selling_Price FLOAT,
Qty_Available INTEGER);

INSERT INTO 
products
(Product_Sku, Product_Name, Product_Range, Supplier, SupplierID, Cost_Price, Selling_Price, Qty_Available)
VALUES 
(10001,'Vanilla Candle Large', 'Vanilla', 'JET', 1, 6.99, 25.99, 34),
(10002,'Vanilla Candle Regular', 'Vanilla', 'JET',1, 3.99, 16.99, 90),
(10003, 'Vanilla Tea lights', 'Vanilla', 'JET', 1, 1.99, 9.99, 8),
(10004, 'Fig Candle Large', 'Fig', 'JET', 1, 6.99, 25.99, 31),
(10005, 'Fig Candle Regular', 'Fig', 'JET', 1, 3.99, 16.99, 23),
(10006, 'Fig Tea lights', 'Fig', 'JET',1, 1.99, 9.99, 70),
(10007, 'Citrus Candle Large', 'Citrus', 'JET',1, 6.99, 25.99, 4),
(10008, 'Citrus Candle Regular', 'Citrus', 'JET',1, 3.99, 16.99, 78),
(10009, 'Citrus Tea lights', 'Citrus', 'JET',1, 1.99, 9.99, 54),
(10010, 'Oud Candle Large', 'Oud', 'JET',1, 6.99, 25.99, 88),
(10011, 'Oud Candle Regular', 'Oud', 'JET',1, 3.99, 16.99, 26),
(10012,'Oud Tea lights', 'Oud', 'JET',1, 1.99, 9.99, 24),
(10013, 'Vanilla Room Spray', 'Vanilla', 'SUN',2, 5.99, 19.99, 0),
(10014, 'Fig Room Spray', 'Fig', 'SUN',2, 5.99, 19.99, 7),
(10015, 'Citrus Room spray', 'Citrus', 'SUN',2, 5.99, 19.99, 30),
(10016, 'Oud Room Spray', 'Oud', 'SUN',2, 5.99, 19.99, 7);


CREATE TABLE suppliers
(SupplierID INTEGER,
Supplier_Name VARCHAR (20),
Country VARCHAR (20),
City VARCHAR (20),
ContactNo BIGINT,
Address VARCHAR (60),
PostCode VARCHAR (8));

INSERT INTO 
suppliers
(SupplierID, Supplier_Name, Country, City, ContactNo, Address, PostCode)
VALUES
(01,'JET', 'England', 'Birmingham', 07983783470, 'Unit 44 Chineham Business Park', 'RG21 8UY'),
(02, 'SUN', 'England', 'London', 07983724987, '11 Holloway Road', 'SW18 4JU');


CREATE TABLE order_details
(Order_No VARCHAR  (20),
Product_Sku INTEGER,
Product_Qty INTEGER,
Price_Total FLOAT, 
Order_Line_No INTEGER);

INSERT INTO 
order_details
VALUES
('O500010',10004,2,51.98,1),
('O500011',10014,1,19.99,2),
('O500012',10005,3,50.97,3),
('O500012',10007,1,25.99,4),
('O500013',10001,1,25.99,5),
('O500014',10009,1,9.99,6),
('O500015',10010,1,25.99,7),
('O500016',10012,1,9.99,8),
('O500016',10011,3,50.97,9),
('O500017',10011,1,16.99,10),
('O500017',10006,2,9.99,11),
('O500017',10003,2,19.98,12);

CREATE TABLE order_status
(Order_No VARCHAR (20),
Order_Date DATE,
Shipping_Date DATE,
Status INTEGER,
Customer_No VARCHAR(20));

INSERT INTO 
order_status
VALUES
('O500010', '2020-07-06', '2020-07-08', 05, 'C2000'),
('O500011','2020-07-06', '2020-07-08', 5, 'C2001'),
('O500012', '2020-07-07', '2020-07-09', 5, 'C2002'),
('O500013', '2020-07-08', '2020-07-10', 5, 'C2003'),
('O500014', '2020-07-10', '2020-07-12', 4, 'C2004'),
('O500015', '2020-07-10', '2020-07-12', 4, 'C2005'),
('O500016', '2020-07-11', '2020-07-13', 4, 'C2006'),
('O500017', '2020-07-11', '2020-07-13', 4, 'C2007');

CREATE TABLE status
(Status INTEGER,
Definition VARCHAR(15));

INSERT INTO 
status
VALUES
(1, 'Order received'),
(2, 'Order picked'),
(3, 'Order packed'),
(4, 'Order shipped'),
(5, 'Order delivered');

CREATE TABLE customer
(Customer_No VARCHAR(15),
First_name VARCHAR (20),
Last_name VARCHAR (20),
ContactNo BIGINT,
Address VARCHAR (50),
Postcode VARCHAR(10),
Country VARCHAR(20));

INSERT INTO customer
VALUES
('C2000' ,'Jasmine' ,'Smith' ,07846738591,'87 Gardens Road' ,'RY83 9UG' ,'England'),
('C2001','Ella','Jones',07243946271,'1 Farmers Road','BH93 U89','England'),
('C2002','Paul','Wells',07846925462,'5 Mulberry Close','SO29 J84','Wales'),
('C2003','Jade','Blackburn',07948659721, '66 Tangway' ,'DO92 H89','England'),
('C2004','Michelle','Dewy',07972022748,'44B Sussex Way','LU09 G53','Wales'),
('C2005','Erin','Hutchings',07829864011,'22 Johns Wood','RE64 B77','England'),
('C2006','Jeff','McMorran',07339827018,'3 Shepherds Road','GY38 M89','England'),
('C2007','Amy','Rose',07587489732,'66 Reading Road','EU02 Y72','England');

#Add in Primary Keys

USE CANDLE_SHOP;

ALTER TABLE customer
ADD PRIMARY KEY (Customer_No);
ALTER TABLE order_details
ADD PRIMARY KEY (order_line_no);

ALTER TABLE order_status
ADD PRIMARY KEY (order_no);

ALTER TABLE products
ADD PRIMARY KEY (product_sku);

ALTER TABLE status
ADD PRIMARY KEY (status);

ALTER TABLE suppliers
ADD PRIMARY KEY (supplierID);

#Add in foreign keys

ALTER TABLE products
ADD FOREIGN KEY (SupplierID) REFERENCES suppliers(SupplierID);

ALTER TABLE order_details
ADD FOREIGN KEY (order_no) REFERENCES order_status(order_no);

ALTER TABLE order_details
ADD FOREIGN KEY (product_sku) REFERENCES products(product_sku);

ALTER TABLE order_status
ADD FOREIGN KEY (customer_no) REFERENCES customer(customer_no);

# Combines tables: Customer names who have spent more than £30

SELECT c.first_name, c.last_name, c.country, Round(SUM(od.Price_Total),2) Order_Total
FROM customer c
LEFT JOIN
order_status os
ON 
c.Customer_No = 
os.Customer_No
LEFT JOIN 
order_details od
ON 
od.Order_No = 
os.Order_No
GROUP BY c.Customer_No
HAVING order_total >= 30

# Stored function: If the stock is available/ unaviable to buy

DELIMITER //

CREATE FUNCTION Instock (Qty_Available INTEGER)
RETURNS VARCHAR(13)
DETERMINISTIC
BEGIN
	Declare Instock VARCHAR(13);
    IF Qty_Available >= 1 THEN 
				SET Instock = 'AVAILABLE';
	ELSEIF Qty_Available = 0 THEN
				SET Instock = 'UNAVAILABLE';
	END IF;

RETURN (Instock);

END//

DELIMITER ;

SELECT Product_Sku, Instock(Qty_Available)
FROM Products;

# Subquery: Customer names of everyone who bought item 10011 (Oud Candle Regular)

SELECT First_name, Last_name
FROM customer
WHERE Customer_No IN (SELECT Customer_No
											FROM order_status
                                            WHERE Order_No IN (SELECT Order_No
																				 FROM Order_details
                                                                                 WHERE Product_Sku = 10011));


# Stored procedure: Checking what products are <10

CREATE PROCEDURE Lowstock()
SELECT Product_Sku, Product_Name, Qty_available
FROM products
WHERE
Qty_Available < 10;

CALL Lowstock();

# Group by function: How many orders were placed by country

USE CANDLE_SHOP;

SELECT 
    Country, COUNT(*)
FROM
    customer
INNER JOIN order_status
USING (Customer_No)
GROUP BY Country



