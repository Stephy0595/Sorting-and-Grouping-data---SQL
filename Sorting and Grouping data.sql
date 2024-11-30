CREATE DATABASE Assignment5;

USE Assignment5;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Population INT,
    Rating DECIMAL(3,2),
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331002651, 9833517),
(2, 'India', 1380004385, 3287263),
(3, 'China', 1393409038, 9596961),
(4, 'Russia', 145912025, 17098242),
(5, 'Brazil', 212559417, 8515767),
(6, 'Australia', 25499884, 7692024),
(7, 'Canada', 37742154, 9984670),
(8, 'Mexico', 126190788, 1964375),
(9, 'Japan', 126476461, 377975),
(10, 'Germany', 83783942, 357022);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Varghese', 1000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Philip', 1500000, 3.8, 2, 'India'),
(3, 'Carlos', 'Mathew', 1200000, 4.0, 3, 'China'),
(4, 'Marie', 'Abraham', 900000, 4.9, 4, 'Russia'),
(5, 'George', 'Martin', 1100000, 4.2, 5, 'Brazil'),
(6, 'Lucy', 'Jacob', 500000, 3.6, 6, 'Australia'),
(7, 'Henry', 'Abraham', 700000, 4.1, 7, 'Canada'),
(8, 'Emma', 'Williams', 800000, 4.7, 8, 'Mexico'),
(9, 'Tom', 'Mathew', 650000, 4.3, 9, 'Japan'),
(10, 'Jessica', 'James', 450000, 4.4, 10, 'Germany');

SELECT SUBSTRING(Country_name, 1, 3) AS Country_Abbreviation FROM Country;

SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;

SELECT COUNT(DISTINCT Country_name) AS Unique_Country_Count FROM Persons;

SELECT MAX(Population) AS Max_Population FROM Country;

SELECT MIN(Population) AS Min_Population FROM Persons;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(11, 'Samuel', NULL, 300000, 3.5, 1, 'USA'),
(12, 'Olivia', NULL, 400000, 3.7, 2, 'India');
SELECT COUNT(Lname) AS Non_Null_Lnames FROM Persons;

SELECT COUNT(*) AS Total_Rows FROM Persons;

SELECT Population FROM Country LIMIT 3;

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

SELECT * FROM Persons ORDER BY Rating DESC;

SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

SELECT Country_name, COUNT(Id) AS Total_Persons, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(Id) > 2
ORDER BY Average_Rating ASC;