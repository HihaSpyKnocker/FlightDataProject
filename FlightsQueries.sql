USE Flights
GO

/*----------Business Cases----------*/
-- Top 10 most used airplane types
SELECT TOP 10 A.airplaneType, COUNT(A.airplaneType) AS countAirplaneType
FROM Flight AS F
INNER JOIN Airplane AS A
ON F.airplaneID = A.airplaneID
GROUP BY A.airplaneType
ORDER BY countAirplaneType DESC;

-- Top 10 airports with most flight connections
SELECT TOP 10 F.fromAirport, F.toAirport, COUNT(*) AS numConnections
FROM Flight AS F
INNER JOIN Airplane AS A
ON F.airplaneID = A.airplaneID
GROUP BY F.fromAirport, F.toAirport
ORDER BY numConnections DESC;

-- Top 10 airlines that offer most routes
SELECT TOP 10 A.airlineID, COUNT(A.airlineID) AS numRoutes
FROM Flight AS F
INNER JOIN Airplane AS A
ON F.airplaneID = A.airplaneID
GROUP BY A.airlineID
ORDER BY numRoutes DESC;
