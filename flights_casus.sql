USE Flights;
GO

/*----------------------Drop Tables---------------------*/
IF OBJECT_ID('Booking', 'U') IS NOT NULL
	DROP TABLE Booking;

IF OBJECT_ID('FlightPrice', 'U') IS NOT NULL
	DROP TABLE FlightPrice;

IF OBJECT_ID('Flight', 'U') IS NOT NULL
	DROP TABLE Flight;

IF OBJECT_ID('Airplane', 'U') IS NOT NULL
	DROP TABLE Airplane;

IF OBJECT_ID('Airline', 'U') IS NOT NULL
	DROP TABLE Airline;

IF OBJECT_ID('Passenger', 'U') IS NOT NULL
	DROP TABLE Passenger;

/*-------------------Passenger Table-------------------*/
CREATE TABLE Passenger (
	passengerID int NOT NULL PRIMARY KEY,
	reason VARCHAR(100) NOT NULL,
	nationality VARCHAR(100) NOT NULL
);

/*--------------------Airline Table--------------------*/
CREATE TABLE Airline (
	airlineID VARCHAR(5) NOT NULL PRIMARY KEY
	--airlineName varchar(100)
);

/*--------------------Airplane Table-------------------*/
CREATE TABLE Airplane (
	airplaneID int NOT NULL PRIMARY KEY,
	airlineID VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES Airline(airlineID),
	airplaneType VARCHAR(50) NOT NULL,
	--airplaneCapacity int
);

/*---------------------Flight Table--------------------*/
CREATE TABLE Flight (
	flightID int NOT NULL PRIMARY KEY,
	airplaneID int NOT NULL FOREIGN KEY REFERENCES Airplane(airplaneID),
	airlineID VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES Airline(airlineID),
	fromAirport VARCHAR(100) NOT NULL,
	toAirport VARCHAR(100) NOT NULL,
	--distance int,
	--flightTime time
);

/*------------------FlightPrice Table------------------*/
CREATE TABLE FlightPrice (
	priceID int NOT NULL PRIMARY KEY,
	flightID int NOT NULL FOREIGN KEY REFERENCES Flight(flightID),
	CLASS VARCHAR(50) NOT NULL,
	price decimal(7,2) NOT NULL
);

/*--------------------Booking Table--------------------*/
CREATE TABLE Booking (
	bookingID int NOT NULL PRIMARY KEY,
	passengerID int NOT NULL FOREIGN KEY REFERENCES Passenger(passengerID),
	priceID int NOT NULL FOREIGN KEY REFERENCES FlightPrice(priceID),
	flightID int NOT NULL FOREIGN KEY REFERENCES Flight(flightID)
);

/*--------------------Import Airline-------------------*/
BULK INSERT Airline
FROM 'airline.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ' ',
	ROWTERMINATOR = '\n'
);

/*-------------------Import Airplane-------------------*/
BULK INSERT Airplane
FROM 'airplane.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ' ',
	ROWTERMINATOR = '\n'
);

/*-------------------Import Flight-------------------*/
BULK INSERT Flight
FROM 'flight.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ' ',
	ROWTERMINATOR = '\n'
);

