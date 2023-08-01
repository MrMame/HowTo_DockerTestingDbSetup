-- Get rid of old database and create new one
DROP DATABASE testdb;
CREATE DATABASE testdb;

-- Connect to testdb Database
\c testdb;


-- create database schema
CREATE TABLE Persons (
    PersonID SERIAL UNIQUE PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);


-- fill with data
INSERT INTO Persons (LastName, FirstName, Address, City) VALUES ('Smart', 'Maxwell', 'England', 'London');
INSERT INTO Persons (LastName, FirstName, Address, City) VALUES ('Weller', 'Tim', 'Lehmannstrasse 12', 'Berlin');
INSERT INTO Persons (LastName, FirstName, Address, City) VALUES ('Hi', 'HoiJin', 'Jakkagawa', 'Tokyo');