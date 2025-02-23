-- creazione database
CREATE DATABASE ToysGroup;

-- uso il database
USE ToysGroup;

-- creazione tabella Prodotti dove ho inserito l'idproduct (PK) , il nome, la categoria e il prezzo 
CREATE TABLE Product(
IDProduct INT PRIMARY KEY,
Product_Name VARCHAR (50),
Category VARCHAR (30),
Price DECIMAL (6,2)
);

-- creazione tabella Region dove ho inserito l'idregion(PK) lo Stato e l'area geografica(AREA)
CREATE TABLE Region(
IDRegion INT PRIMARY KEY,
State VARCHAR (50),
Area VARCHAR (50)
);

-- creazione tabella Sales dove ho inserito idsales (PK), il numero dell'odrine, la data dell'ordine e le rispettive (FK) idproduct e idregion 
CREATE TABLE Sales(
IDSales INT PRIMARY KEY,
Order_Number VARCHAR (50),
Order_Date DATE,
IDProduct INT,
IDRegion INT,
FOREIGN KEY (IDProduct) REFERENCES Product (IDProduct),
FOREIGN KEY (IDRegion) REFERENCES Region (IDRegion)
);

 -- inserisco valori dentro Product
INSERT INTO Product  VALUES 
(1, 'LEGO City Police Station', 'Building Toys', 99.99),
(2, 'Barbie Dreamhouse', 'Dolls', 199.99),
(3, 'Hot Wheels Super Ultimate Garage', 'Vehicles', 129.99),
(4, 'NERF Ultra One Blaster', 'Outdoor Toys', 49.99),
(5, 'Monopoly Classic Board Game', 'Games', 19.99),
(6, 'Play-Doh 36-Can Mega Pack', 'Arts & Crafts', 24.99),
(7, 'Fisher-Price Laugh & Learn Smart Stages Chair', 'Infant Toys', 39.99),
(8, 'Crayola Inspiration Art Case', 'Arts & Crafts', 24.99),
(9, 'Disney Princess Royal Shimmer Cinderella Doll', 'Dolls', 12.99),
(10, 'Melissa & Doug Wooden Building Blocks Set', 'Building Toys', 29.99);

 -- inserisco valori dentro Region
INSERT INTO Region  VALUES 
(1, 'Italy', 'South Europe'),
(2, 'United Kingdom', 'West Europe'),
(3, 'Sweden', 'North Europe'),
(4, 'Poland', 'East Europe'),
(5, 'Portugal', 'West Europe'),
(6, 'Greece', 'South Europe'),
(7, 'Norway', 'North Europe'),
(8, 'United States', 'North America'),
(9, 'Canada', 'North America'),
(10, 'Japan', 'Asia');

 -- inserisco valori dentro Sales
INSERT INTO Sales VALUES 
(1, 'ORD123456', '2022-03-12', 1, 3),
(2, 'ORD123457', '2023-07-24', 2, 5),
(3, 'ORD123458', '2024-05-11', 3, 7),
(4, 'ORD123459', '2021-09-18', 4, 9),
(5, 'ORD123460', '2025-01-02', 5, 2),
(6, 'ORD123461', '2020-11-15', 6, 4),
(7, 'ORD123462', '2021-08-20', 7, 6),
(8, 'ORD123463', '2023-12-27', 8, 8),
(9, 'ORD123464', '2022-04-06', 9, 1),
(10, 'ORD123465', '2024-06-30', 10, 10);

SELECT * FROM Product;
SELECT * FROM Region;
SELECT * FROM Sales;

-- avevo creato la colonna quantità prodotti ma ho capito che non mi serviva 
ALTER TABLE Sales
DROP COLUMN Quantity;

-- sto aggiungendo altri 10 prodotti
INSERT INTO Product VALUES
(11, 'Star Wars Millennium Falcon LEGO Set', 'Building Toys', 159.99),
(12, 'American Girl Doll of the Year', 'Dolls', 98.99),
(13, 'Tonka Steel Classics Mighty Dump Truck', 'Vehicles', 34.99),
(14, 'Super Soaker Hydro Cannon', 'Outdoor Toys', 29.99),
(15, 'Catan Board Game', 'Games', 44.99),
(16, 'Crayola Washable Kids Paint Set', 'Arts & Crafts', 19.99),
(17, 'VTech Sit-to-Stand Learning Walker', 'Infant Toys', 49.99),
(18, 'KidKraft Waterfall Mountain Train Set', 'Building Toys', 119.99),
(19, 'Polly Pocket Big Pocket World', 'Dolls', 14.99),
(20, 'Step2 Fantasy Vanity', 'Pretend Play', 79.99);

-- inserisco altre 10 vendite 
INSERT INTO Sales VALUES
(11, 'ORD123466', '2022-07-23', 1, 5),
(12, 'ORD123467', '2023-01-18', 2, 7),
(13, 'ORD123468', '2021-11-29', 3, 6),
(14, 'ORD123469', '2024-09-10', 4, 3),
(15, 'ORD123470', '2023-05-14', 5, 8),
(16, 'ORD123471', '2022-02-22', 6, 10),
(17, 'ORD123472', '2024-04-03', 7, 4),
(18, 'ORD123473', '2021-06-25', 8, 2),
(19, 'ORD123474', '2023-10-30', 9, 9),
(20, 'ORD123475', '2022-12-07', 10, 1);






















