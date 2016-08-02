

-- // PERSON
-- // Create a table called Person that records a person's Name, Age, Height, City, FavoriteColor, and Id. Id should be an auto-incrementing id/primary key.
CREATE TABLE person
(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(40),
  age INTEGER,
  height INTEGER,
  city VARCHAR(40),
  FavoriteColor VARCHAR(40)
);

-- // Add 5 different people into the Person database. Remember to not include the Id because it should auto-increment.
INSERT INTO person (name, age, height, city, FavoriteColor)  VALUES ("Heather", 25, 68, "Provo", "orange");
INSERT INTO person (name, age, height, city, FavoriteColor)  VALUES ("Eda", 28, 67, "San Francisco", "cardinal");
INSERT INTO person (name, age, height, city, FavoriteColor)  VALUES ("Becca", 25, 70, "Sacramento", "yello");
INSERT INTO person (name, age, height, city, FavoriteColor)  VALUES ("Dani", 24, 69, "San Francisco", "blue");
INSERT INTO person (name, age, height, city, FavoriteColor)  VALUES ("Evan", 21, 74, "Seattle", "green");
// List the people in the Person table by Height from tallest to shortest (descending)
SELECT * FROM person ORDER BY height DESC;
-- // (For this database to create an auto incrementing field set it's type to INTEGER PRIMARY KEY AUTOINCREMENT)

-- // List the people in the Person table by Height from shortest to tallest (ascending)
SELECT * FROM person ORDER BY height DESC;
-- // List all the people in the Person table by oldest first
SELECT * FROM person ORDER BY age DESC;
-- // List all the people in the Person table older than age 20.
SELECT * FROM person WHERE age > 20;
-- // List all the people in the Person table that are exactly 18.
SELECT * FROM person WHERE age = 18;
-- // List all Person that are less than 20 and older than 30.
SELECT * FROM person WHERE age < 20 AND age > 30;
-- // List all Person that are not 27 (Use not equals)
SELECT * FROM person WHERE age != 27;
-- // List all Person where their favorite color is not red
SELECT * FROM person WHERE FavoriteColor != 'red';
-- // List all Person where their favorite color is not red or blue
SELECT * FROM person WHERE FavoriteColor != 'red' OR FavoriteColor != 'blue';
-- // List all Person where their favorite color is orange or green
SELECT * FROM person WHERE FavoriteColor IN ('orange', 'green');
-- // List all Person where their favorite color is orange or green blue (use IN)
SELECT * FROM person WHERE FavoriteColor IN ('orange', 'green', 'blue');
-- // List all Person where their favorite color is yellow or purple
SELECT * FROM person WHERE FavoriteColor IN ('yellow', 'purple');
-- // ORDER

-- // Create a table called Orders that records the productName, productPrice, Quantity, and personId
-- // Add 5 Orders to Order table
CREATE TABLE Orders
(
  personId INTEGER PRIMARY KEY AUTOINCREMENT,
  productName VARCHAR(40),
  productPrice INTEGER,
  Quantity INTEGER
);

INSERT INTO Orders (productName, productPrice, Quantity) VALUES ('laptop', 1000, 1);
INSERT INTO Orders (productName, productPrice, Quantity) VALUES ('TV', 2000, 4);
INSERT INTO Orders (productName, productPrice, Quantity) VALUES ('AV cord', 10, 27);
INSERT INTO Orders (productName, productPrice, Quantity) VALUES ('cups', 1, 3000);
INSERT INTO Orders (productName, productPrice, Quantity) VALUES ('desk', 350, 15);


-- // Select all the records from the Order table
SELECT * FROM Orders;
-- // Calculate the total number of products Ordered
SELECT sum(Quantity) FROM Orders;
-- // Calculate the total Order Price
SELECT sum(productPrice * Quantity) FROM Orders;
-- // Calculate the total Order Price By personId (If you only made orders for 1 person, go add more for the other people)
SELECT PersonId, Quantity * productPrice FROM Orders;
-- // Artists
-- //
-- // Add 3 new Artists to the Artist table
INSERT INTO Artist (Name) VALUES ('Fleetwood Mac');
INSERT INTO Artist (Name) VALUES ('N*Sync');
INSERT INTO Artist (Name) VALUES ('Kenny Logins');
-- // Select the top 10 artists in reverse alphabetical order
SELECT Name FROM Artist ORDER BY Name DESC;
-- // Select the top 5 artists in alphabetical order
SELECT Name FROM Artist ORDER BY Name DESC LIMIT 5;
-- // Select all artists that start with the word Black
SELECT * FROM Artist WHERE Name LIKE "Black%";
-- // Select all artists that contain the word Black
SELECT * FROM Artist WHERE Name LIKE "%Black%";
-- // Employee

-- // Add 2 new Employees to the Employee table
INSERT INTO Employee (LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES ('Hargreaves', 'Heather', 'no one', '03/12/50', '08/2/08', '11 Main', 'Provo', 'Utah', 'USA', '81641', '555-555-5555', null, 'heather@me.com');
INSERT INTO Employee (LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) VALUES ('Hargreaves', 'Evan', 'Heather', '01/12/90', '10/2/11', '2 Beach', 'Los Angeles', 'CA', 'USA', '90001', '555-555-5555', null, 'evan@me.com')
-- // List all Employee first and last names only that live in Calgary
SELECT FirstName, LastName, City FROM Employees WHERE City = 'Calgary';
-- // Find the first and last name for the youngest employee
SELECT FirstName, LastName FROM Employee ORDER BY BirthDate DESC LIMIT 1;
-- // Find the first and last name for the oldest employee
SELECT FirstName, LastName FROM Employee ORDER BY BirthDate ASC LIMIT 1;
-- // Find everyone that reports to Nancy Edwards (Use the ReportsTo column)
SELECT * FROM Employee WHERE ReportsTo = 'Nancy Edwards';
-- // Count how many people live in Lethbridge
SELECT count(*) FROM Employee WHERE City = "Lethbridge";
-- // Invoice

-- // Use the Invoice table for the following

-- // Count how many orders were made from the USA
SELECT Count(*) FROM Invoice WHERE BillingCountry = "USA";
-- // Find the largest order total amount
SELECT * FROM Invoice ORDER BY Total DESC LIMIT 1;
-- // Find the smallest order total amount
SELECT * FROM Invoice ORDER BY Total ASC LIMIT 1;
-- // Find all orders bigger than $5
SELECT * FROM Invoice WHERE Total > 5;
-- // Count how many orders were smaller than $5
SELECT count(*) FROM Invoice WHERE Total < 5;
-- // Count how many orders were in CA, TX, or AZ (use IN)
SELECT count(*) FROM Invoice WHERE BillingState IN ('CA', 'TX', 'AZ');
-- // Get the average total of the orders
SELECT avg(Total) FROM Invoice;
-- // Get the total sum of the orders
SELECT sum(Total) FROM Invoice;
