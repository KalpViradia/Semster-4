-- Create the Products table
CREATE TABLE Products (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);
-- Insert data into the Products table
INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);

--From the above given tables perform the following queries:
--Part - A
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
DECLARE @Product_id INT;
DECLARE @Product_Name VARCHAR(250);
DECLARE @Price DECIMAL(10, 2);

DECLARE Product_Cursor CURSOR FOR
SELECT Product_id, Product_Name, Price
FROM Products;

OPEN Product_Cursor;

FETCH NEXT FROM Product_Cursor INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Product ID: ' + CAST(@Product_id AS VARCHAR) + ', Name: ' + @Product_Name + ', Price: ' + CAST(@Price AS VARCHAR);
   
    FETCH NEXT FROM Product_Cursor INTO @Product_id, @Product_Name, @Price;
END

CLOSE Product_Cursor;
DEALLOCATE Product_Cursor;

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. (Example: 1_Smartphone)
DECLARE @Product_id INT;
DECLARE @Product_Name VARCHAR(250);

DECLARE Product_Cursor_Fetch CURSOR FOR
SELECT Product_id, Product_Name
FROM Products;

OPEN Product_Cursor_Fetch;

FETCH NEXT FROM Product_Cursor_Fetch INTO @Product_id, @Product_Name;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT CAST(@Product_id AS VARCHAR) + '_' + @Product_Name;
   
    FETCH NEXT FROM Product_Cursor_Fetch INTO @Product_id, @Product_Name;
END

CLOSE Product_Cursor_Fetch;
DEALLOCATE Product_Cursor_Fetch;

--3. Create a Cursor to Find and Display Products Above Price 30,000.
DECLARE @Product_id INT;
DECLARE @Product_Name VARCHAR(250);
DECLARE @PRICE DECIMAL(10, 2);

DECLARE Product_Cursor_Price CURSOR FOR
SELECT Product_id, Product_Name, Price
FROM Products
WHERE Price > 30000;

OPEN Product_Cursor_Price;

FETCH NEXT FROM Product_Cursor_Price INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Product ID: ' + CAST(@Product_id AS VARCHAR) + ', Name: ' + @Product_Name + ', Price: ' + CAST(@Price AS VARCHAR);
   
    FETCH NEXT FROM Product_Cursor_Price INTO @Product_id, @Product_Name, @Price;
END

CLOSE Product_Cursor_Price;
DEALLOCATE Product_Cursor_Price;

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
DECLARE @Product_id INT;
DECLARE @Product_Name VARCHAR(250);
DECLARE @PRICE DECIMAL(10, 2);

DECLARE Product_CursorDelete CURSOR FOR
SELECT Product_id, Product_Name, Price
FROM Products;

OPEN Product_CursorDelete;

FETCH NEXT FROM Product_CursorDelete INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Deleting Product ID: ' + CAST(@Product_id AS VARCHAR) + ', Name: ' + @Product_Name + ', Price: ' + CAST(@Price AS VARCHAR);

	DELETE FROM Products
	WHERE Product_id = @Product_id;
   
    FETCH NEXT FROM Product_CursorDelete INTO @Product_id, @Product_Name, @Price;
END

CLOSE Product_CursorDelete;
DEALLOCATE Product_CursorDelete;


--Part – B
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%.
DECLARE @Product_id INT;
DECLARE @Product_Name VARCHAR(250);
DECLARE @Price DECIMAL(10, 2);

DECLARE Product_CursorUpdate CURSOR FOR
SELECT Product_id, Product_Name, Price
FROM Products;

OPEN Product_CursorUpdate;

FETCH NEXT FROM Product_CursorUpdate INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Product ID: ' + CAST(@Product_id AS VARCHAR) + ', Name: ' + @Product_Name + ', Old Price: ' + CAST(@Price AS VARCHAR);

    UPDATE products
    SET Price = @Price * 1.10
    WHERE Product_id = @Product_id;

    PRINT 'Updated Price for Product ID: ' + CAST(@Product_id AS VARCHAR) + ' to ' + CAST(@Price * 1.10 AS VARCHAR);

    FETCH NEXT FROM Product_CursorUpdate INTO @Product_id, @Product_Name, @Price;
END

CLOSE Product_CursorUpdate;
DEALLOCATE Product_CursorUpdate;

--6. Create a Cursor to Rounds the price of each product to the nearest whole number.
DECLARE @Product_id INT;
DECLARE @Product_Name VARCHAR(250);
DECLARE @Price DECIMAL(10, 2);

DECLARE Product_Cursor_PriceRound CURSOR FOR
SELECT Product_id, Product_Name, Price
FROM Products;

OPEN Product_Cursor_PriceRound;

FETCH NEXT FROM Product_Cursor_PriceRound INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE products
    SET Price = ROUND(@Price, 0)
    WHERE Product_id = @Product_id;

    PRINT 'Rounded Price for Product ID: ' + CAST(@Product_id AS VARCHAR) + ' to ' + CAST(@Price * 1.10 AS VARCHAR);

    FETCH NEXT FROM Product_Cursor_PriceRound INTO @Product_id, @Product_Name, @Price;
END

CLOSE Product_Cursor_PriceRound;
DEALLOCATE Product_Cursor_PriceRound;

--Part – C
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” (Note: Create NewProducts table first with same fields as Products table)
CREATE TABLE NewProducts (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(250) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

DECLARE @Product_id INT;
DECLARE @Product_Name VARCHAR(250);
DECLARE @Price DECIMAL(10, 2);

DECLARE NewProducts_Cursor_Insert CURSOR FOR
SELECT Product_id, Product_Name, Price
FROM Products
WHERE Product_Name = 'Laptop';

OPEN NewProducts_Cursor_Insert;

FETCH NEXT FROM NewProducts_Cursor_Insert INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO NewProducts (Product_id, Product_Name, Price)
    VALUES (@Product_id, @Product_Name, @Price);

    FETCH NEXT FROM NewProducts_Cursor_Insert INTO @Product_id, @Product_Name, @Price;
END;

CLOSE NewProducts_Cursor_Insert;
DEALLOCATE NewProducts_Cursor_Insert;

--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products with a price above 50000 to an archive table, removing them from the original Products table.
CREATE TABLE ArchivedProducts (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(250) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

DECLARE @Product_id INT;
DECLARE @Product_Name VARCHAR(250);
DECLARE @Price DECIMAL(10, 2);

DECLARE ArchivedProducts_Cursor_Insert CURSOR FOR
SELECT Product_id, Product_Name, Price
FROM Products
WHERE Price > 50000;

OPEN ArchivedProducts_Cursor_Insert;

FETCH NEXT FROM ArchivedProducts_Cursor_Insert INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO ArchivedProducts (Product_id, Product_Name, Price)
    VALUES (@Product_id, @Product_Name, @Price);

	DELETE FROM Products
    WHERE Product_id = @Product_id;

    FETCH NEXT FROM ArchivedProducts_Cursor_Insert INTO @Product_id, @Product_Name, @Price;
END;

CLOSE ArchivedProducts_Cursor_Insert;
DEALLOCATE ArchivedProducts_Cursor_Insert;