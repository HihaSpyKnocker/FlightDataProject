# Flight Data Project

## Project Description
This project is part of a SQL training, which is part of the Business Intelligence
/ Big Data traineeship I am following.

## Repository Contents

### README.md
Documentation explaining the project and how to use files contained in the
repository.

### script.R
R script that does the following: 

1. Reads the routes.csv file
2. Remove unnecessary columns
3. Generate artificial airplaneID's  
4. Create dataframes out of routes.csv  
  4.1. Airline  
  4.2. Airplane    
  4.3. Flight  
5. Write the dataframes in seperate csv files, i.e. <code>airline.csv</code>, 
<code>airplane.csv</code> and <code>flight.csv</code>

### routes.csv
Data is obtained from https://openflights.org/data.html. The specific link is 
https://raw.githubusercontent.com/jpatokal/openflights/master/data/routes.dat.

Contains the data from which airline.csv, airplane.csv and flight.csv are formed:

* Contains the airline ID's, for example KL is an identifier for the
Koninklijke Luchtvaart Maatschappij   
* Contains the source airport, e.g. AMS is an identifier for Amsterdam Schiphol   
* Contains the destination airport, e.g. MAD is an identifier for Barajas Airport   
* Contains the codeshare, i.e. when a flight is not operated by an airline  
* Contains the number of stops  
* Contains the airplane type, for example 738 is a Boeing 737-800  

### airline.csv 
* Contains the airline ID's  

### airplane.csv 
* Contains surrogate keys for airplane ID's
* Contains the airline ID's
* Contains the airplane type  

### flight.csv 
* Contains the surrogate keys for airplane ID's  
* Contains the airline ID's  
* Contains the source airport   
* Contains the destination airport   

### flights_casus.sql 
Creates the database tables and bulk inserts of the <code>airline.csv</code>, 
<code>airplane.csv</code> and <code>flight.csv</code> files.

### flights_queries.sql 
Contains queries answering the following questions:

* What are the most common airplane types?   
* Which airports have the most flight connections?  
* Which airlines offer most unique flights?   