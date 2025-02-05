SELECT *
FROM
Ships
JOIN Calls
ON Ships.lrno
= Calls.lrno

/* Ports that are larger will have slower ship movement in and out.
The average time by port for all ship movement. Sail date minus arrival date by port of call*/

SELECT *
FROM 
Calls

SELECT Ships.vesselname, Ships.lrno, Calls.portname, Calls.countryname, Calls.arrdate, Calls.datecreated, DATEDIFF(hour, Calls.arrdate, Calls.datecreated) AS TotalTimeAtPort
FROM Ships 
JOIN Calls 
ON Ships.lrno
= Calls.lrno


CREATE VIEW ShipsTotalTimeAtPort AS
SELECT Ships.vesselname, Ships.lrno, Calls.portname, Calls.countryname, Calls.arrdate, Calls.datecreated, DATEDIFF(hour, Calls.arrdate, Calls.datecreated) AS TotalTimeAtPort
FROM Ships 
JOIN Calls 
ON Ships.lrno
= Calls.lrno

select *
from 
ShipsTotalTimeAtPort;

/*What is the average time a ship is at a port?*/
SELECT Portname AS 'Port Name', 
countryname AS 'Country Name',
TotalTimeAtPort AS 'Hours At Port'
FROM ShipsTotalTimeAtPort
WHERE TotalTimeAtPort > 1;

SELECT AVG(TotalTimeAtPort) AS 'Average Time At Port'
FROM ShipsTotalTimeAtPort;

