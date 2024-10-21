CREATE DATABASE Movies;
create schema Movie_1;
use Movies;


CREATE TABLE actor (
    act_id INTEGER PRIMARY KEY,
    act_fname CHAR(20),
    act_lname CHAR(20),
    act_gender CHAR(1)
);


CREATE TABLE director (
    dir_id INTEGER PRIMARY KEY,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
);


CREATE TABLE movie (
    mov_id INTEGER PRIMARY KEY,
    mov_title CHAR(50),
    mov_year INTEGER,
    mov_time INTEGER,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);


CREATE TABLE movie_cast (
    act_id INTEGER,
    mov_id INTEGER,
    _role_  CHAR(30)
);


CREATE TABLE genres (
    gen_id INTEGER PRIMARY KEY,
    gen_title CHAR(20)
);


CREATE TABLE movie_genres (
    mov_id INTEGER,
    gen_id INTEGER
);


CREATE TABLE rating (
    rev_id INTEGER,
    mov_id INTEGER,
    rev_stars INTEGER,
    num_o_ratings INTEGER
);


CREATE TABLE reviewer (
    rev_id INTEGER PRIMARY KEY,
    rev_name CHAR(30)
);


CREATE TABLE movie_direction (
    dir_id INTEGER,
    mov_id INTEGER
);

-- 1)Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).

CREATE TABLE Employees (
    ID INTEGER ,
    Name VARCHAR(120),
    Salary DECIMAL(10, 3)
);

--2)Add a new column named "Department" to the "Employees" table with data type varchar(50).

ALTER TABLE Employees
ADD Department varchar(50);


--3)Remove the "Salary" column from the "Employees" table.

ALTER TABLE Employees
Drop column Salary;

--4)Rename the "Department" column in the "Employees" table to "DeptName".

EXEC sp_rename 'Employees.Department', 'DeptName', 'COLUMN';


--5)Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(350)
);

--6)Add a primary key constraint to the "Employees" table for the "ID" column.

ALTER TABLE Employees
ADD CONSTRAINT ID PRIMARY KEY (ID);

--7)Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").

ALTER TABLE Employees
ADD ProjectID INT;

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Projects
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);

--8)Remove the foreign key relationship between "Employees" and "Projects."

ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Projects;


--9)Add a unique constraint to the "Name" column in the "Employees" table.

ALTER TABLE Employees
ADD CONSTRAINT UNIQ_NAME UNIQUE (Name);

--10)Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).

CREATE TABLE Customers (
    CustomerID INT ,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Status VARCHAR(50)
);

--11)Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.

ALTER TABLE Customers
ADD CONSTRAINT unique_first_last_name UNIQUE (FirstName, LastName);


--12)Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.

ALTER TABLE Customers
ADD CONSTRAINT Customers_Status DEFAULT 'Active' FOR Status;



--13)Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).


CREATE TABLE Orders (
    OrderID INT ,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2)
);


--14)Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.

ALTER TABLE Orders
ADD CONSTRAINT TotalAmount CHECK (TotalAmount > 0);

--15)Create a schema named "Sales" and move the "Orders" table into this schema.

CREATE SCHEMA Sales;
ALTER SCHEMA Sales TRANSFER dbo.Orders;


--16)Rename the "Orders" table to "SalesOrders."

EXEC sp_rename 'Sales.Orders', 'SalesOrders';











