select *
from Track
join Genre on Track.genreId = Genre.GrenreId
where Genre.Name in ('Jazz', 'Blues')

select Artist.ArtistId, Artist.Name, ...
from Artistjoin Album on Album.ArtistId = Artist.ArtistId
group by Artist.ArtistId, Artist.Name
-- Practice joins

-- Use at least one join for all of the following
--
-- Examples
--
-- Select [Column names] from [Table] [abbv] join [Table2] [abbv2] on abbv.prop=abbv2.prop where [Conditions]
--
-- Select a.Name, b.Name from someTable a join anotherTable b on a.someid=b.someid
-- Select a.Name, b.Name from someTable a join anotherTable b on a.someid=b.someid where b.email='e@mail.com'

-- Get all invoices where the quantity on the invoice line is greater than 1
SELECT InvoiceLine.InvoiceId, Invoice.InvoiceId FROM Invoice join InvoiceLine on InvoiceLine.InvoiceId = Invoice.InvoiceId where  Quantity > 1
-- Get all invoices and show me their invoice date, customer first and last names, and total
SELECT Invoice.InvoiceDate, Customer.FirstName, Customer.LastName, Invoice.total FROM Customer join Invoice on Invoice.CustomerId = Invoice.CustomerId
-- Get all customers and show me their first name, last name, and support rep first name and last name (support reps are on the Employees table)
SELECT Customer.FirstName, Customer.LastName, Employee.FirstName, Employee.LastName FROM Customer Join Employee On Employee.EmployeeId = Customer.CustomerId
-- Get all Albums and show me the album title and the artist name
Select Album.Title, Artist.Name FROM Artist JOIN Album ON Artist.ArtistId = Album.ArtistId
-- Get all Playlist Tracks where the playlist name is Music
Select Playlist.Name, PlaylistTrack.TrackId From Playlist Join PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId
-- Get all Tracknames for playlistId 5
Select Track.Name From Track Join PlaylistTrack on PlaylistTrack.TrackId = Track.TrackId WHERE playlistId = 5

-- Now we want all tracknames and the playlist name that they're on (You'll have to use 2 joins)
Select Track.Name, Playlist.Name From Track Join PlaylistTrack On Track.TrackId = PlaylistTrack.TrackId Join Playlist On Playlist.PlaylistId = PlaylistTrack.PlaylistId;
-- Get all Tracks that are alternative and show me the track name and the album name (2 joins)
Select Track.Name, Album.Title From Album Join Track on Track.AlbumId = Album.AlbumId Join Genre on Track.GenreId = Genre.GenreId Where Genre.Name = 'alternative'
-- Black Diamond :
--
-- Get all tracks on the playlist(s) called Music and show their name, genre name, album name, and artist name (at least 5 joins)
Select Track.Name, Genre.Name, Album.Title, Artist.Name
From Genre Join Track On Genre.GenreId = Track.GenreId
Join PlaylistTrack On Track.TrackId = PlaylistTrack.TrackId
Join Playlist On PlaylistTrack.PlaylistId = Playlist.PlaylistId
Join Album On Track.AlbumId = Album.AlbumId
Join Artist On Album.ArtistId = Artist.ArtistId
Where Playlist.Name = 'Music'
-- Practice nested queries

-- Use no joins for the following queries. Use only nested queries.
--
-- Examples
--
-- Select [Column names] from [Table] where columnId in (select columnId from [Table2] where [Condition])
--
-- Select Name, email from athlete where athleteId in (select personId from pieEaters where flavor='Apple')
Select Name, Email
From Athlete
Where Athlete.athleteId in (Select personId From pieEaters Where flavor = "Apple")
-- Get all invoices where the quantity on the invoice line is greater than 1
Select *
From Invoice
Where InvoiceId in (Select InvoiceId From InvoiceLine Where Quantity > 1)
-- Get all Playlist Tracks where the playlist name is Music
Select *
From PlaylistTrack
Where PlaylistId in (Select PlaylistId From Playlist Where Name = "Music")
-- Get all Tracknames for playlistId 5
Select Name
From Track
Where TrackId in (Select TrackId From PlaylistTrack Where PlaylistId = 5)
-- Get all tracks where the genre is comedy
Select *
From Track
Where GenreId in (Select GenreId From Genre Where Name = "Comedy")
-- Get all tracks where the album is Fireball
Select *
From Track
Where AlbumId in (Select AlbumId From Album Where Title = "Fireball")
-- Get all tracks for the artist queen Queen (2 nested subqueries)
Select *
From Track
Where AlbumId in (Select AlbumId From Album Where ArtistId in (Select ArtistId From Artist Where Name = "Queen"))
-- Practice updating Rows
--
-- Examples
--
-- Update [Table] (column1, column2, etc) values (value1, value2, etc) where [Condition]
--
-- Update Athletes (sport) values ('Pickleball') where sport='pockleball'

-- Find all customers with fax numbers and set those numbers to null
Update Customer
Set Fax = null

-- Find all customers with no company (null) and set their company to self
Update Customer
Set Company = "self"
Where Company = null
-- Find the customer Julia Barnett and change her last name to Thompson
Update Customer
Set LastName = "Thompson"
Where FirstName = "Julia" AND LastName = "Barnett"
-- Find the customer with this email luisrojas@yahoo.cl and change his support rep to rep 4
Update Customer
Set  SupportRepId = 4
Where Email = 'luisrojas@yahoo.cl'
-- Find all tracks that are of the genre Metal and that have no composer and set the composer to be 'The darkness around us'
Update Track
Set Composer = "The darkness around us"
Where Composer IS null AND GenreId In (Select GenreId From Genre Where Name = "Metal")
-- Once you're done with all of those refresh your page to blow away your changes to the database!
--
-- Group by
--
-- Find a count of how many tracks there are per genre
Select Track.GenreId, count(*)
From Track
Join Genre On Track.GenreId = Genre.GenreId
Group By Genre.Name
-- Find a count of all Tracks where the Genre is pop
Select count(*)
From Track
Join Genre On Track.GenreId = Genre.GenreId
Group By Genre.Name = "pop"
-- Find a list of all artist and how many albums they have
Select Artist.name, count(*)
From Artist
Join Album On Album.ArtistId = Artist.ArtistId
Group By Album.ArtistId
-- Use Distinct
--
-- From the tracks table find a unique list of all composers
Select Distinct Composer
From Track
-- From the Invoice table find a unique list of all Billing postal codes
Select Distinct BillingPostalCode
From Invoice
-- From the Customer table find a unique list of all companies
Select Distinct Company
From Customer
-- Delete Rows
--
-- Always do a select before a delete to make sure you get back exactly what you want and only what you want to delete!
--
-- Remove all pop tracks from the tracks table
Delete
From Track
Join Genre On Genre.GenreId = Track.GenreId
Where Genre.Name = "Pop"
-- Remove all tracks by Santana
Delete
From Track
Join Album On Album.AlbumId = Track.AlbumId
Join Artist On Artist.ArtistId = Album.ArtistId
Where Artist.Name = "Santana"
-- Remove all of the rest of the tracks, yes all of them.
Delete *
From Track
-- Now refresh your browser to reset all your data
--
-- eCommerce simulation
--
-- Let's simulate an e-commerce site. We're going to need users, products, and orders.
--
-- Users need a name and an email. Products need a name and a price Orders need a ref to product. All 3 need primary keys.
CREATE TABLE Users
(
  UserId INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(40),
  email VARCHAR(80)

);
CREATE TABLE Products
(
  ProductId INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(40),
  price INTEGER,

);
CREATE TABLE Orders
(
  OrderId INTEGER PRIMARY KEY AUTOINCREMENT,
  ProductId INTEGER,
  Quantity INTEGER
);
-- Add some data to fill up each table (write down your schema since you won't see it on the side). You'll need to insert products before you can link them.
--
-- Add 2 users, multiple products and multiple orders.
INSERT INTO Users (name, email)  VALUES ("Heather", "Heather@me.com");
INSERT INTO Users (name, email)  VALUES ("Tom", "tom@t.com");

INSERT INTO Products (name, price, productId)  VALUES ("shirt", 10, 0001);
INSERT INTO Products (name, price, productId)  VALUES ("hat", 20, 0008);
INSERT INTO Products (name, price, productId)  VALUES ("flip-flops", 25, 0200);

INSERT INTO Orders (productId, quantity)  VALUES (0001, 4);
INSERT INTO Orders (productId, quantity)  VALUES (0008, 1);
INSERT INTO Orders (productId, quantity)  VALUES (0200, 10);
INSERT INTO Orders (productId, quantity)  VALUES (0001, 2);
-- Run some queries against your data:
--
-- Get all products for the first order
Select Products
From Orders
Where OrdersId = 1
-- Get all orders
Select *
From Orders
-- Get the total cost of an order (sum the price of all products on an order)
Select ProductId * Quantity
From Order
Join Products On ProductId Where Order.productId = Products.ProductId
-- Add foreign key to existing table
ALTER TABLE Users ADD COLUMN OrderId INTEGER REFERENCES Orders(OrderId);
-- Orders have products, but someone needs to place the order.
--
-- Add a ref from Orders to Users.
--same as above
-- Add some users. Update the Orders table to link the a user to each order.
INSERT INTO Users (name, email, OrderId)  VALUES ("B", "B@t.com", 3);
INSERT INTO Users (name, email, OrderId)  VALUES ("C", "C@t.com", 4);
-- Run some queries against your data:
--
-- Get all orders for a user
Select *
From Users
Join Orders on Users.OrderId = Orders.OrderId
-- Get how many orders each user has
Select sum(*)
From Users
Join Orders on Orders.OrderId = Users.OrderId
-- Black Diamond: Get the total spend on all orders for each user
