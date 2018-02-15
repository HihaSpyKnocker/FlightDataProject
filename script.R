routes <- read.csv(file = "routes.csv", sep = ",", header = FALSE)

colnames(routes) <- c("AirlineID", "c1", "fromAirport", "c2", 
                      "toAirport", "c3", "c4", "stops", "airplaneType")

# remove unnecessary columns
routes$c1 <- NULL
routes$c2 <- NULL
routes$c3 <- NULL
routes$c4 <- NULL
routes$stops <- NULL

# generate artificial RegID's (surrogate key)
routes <- cbind(airplaneID = 0, routes)
routes$airplaneID <- seq(from = 10000, 77662, by = 1)

Flight <- routes
Flight$airplaneType = NULL

Airline <- routes
Airline$fromAirport = NULL
Airline$toAirport = NULL
Airline$airplaneType = NULL

Airplane <- routes
Airplane$toAirport = NULL
Airplane$fromAirport = NULL

airlineID <- unique(Airline$AirlineID)
rm(Airline)
Airline <- data.frame(airlineID)

# output tables
write.table(Airline, file = "airline.csv", quote = FALSE, 
            row.names = FALSE)
write.table(Airplane, file = "airplane.csv", quote = FALSE, 
            row.names = FALSE)
write.table(Flight, file = "flight.csv", quote = FALSE,
            row.names = TRUE)