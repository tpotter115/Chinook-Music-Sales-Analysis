{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf0 \expnd0\expndtw0\kerning0
SELECT Country, COUNT(Country) AS\'a0 CustomerCount\uc0\u8232 FROM customer\
GROUP BY Country\
ORDER BY CustomerCount DESC;\
\
SELECT e.FirstName, e.LastName, SUM(i.total) AS TotalSales\
FROM employee AS e\
JOIN customer AS c\
\'a0\'a0 ON e.EmployeeId = c.SupportRepId\
JOIN invoice AS i\
\'a0\'a0 ON c.CustomerId = i.CustomerId\uc0\u8232 GROUP BY e.EmployeeId\u8232 ORDER BY TotalSales DESC\
LIMIT 1;\
\
SELECT c.Country, SUM(i.Total) AS\'a0 TotalRevenue\uc0\u8232 FROM customer AS c\
JOIN invoice AS i\uc0\u8232 \'a0\'a0 ON c.CustomerId = i.CustomerId\
GROUP BY Country\
ORDER BY TotalRevenue DESC;\
\
SELECT g.name AS GenreName, SUM(i.quantity) AS TracksSold\uc0\u8232 FROM genre AS g\u8232 JOIN track AS t\
\'a0\'a0\'a0 ON g.GenreId = t.GenreId\
JOIN\'a0 invoiceLine AS i\
\'a0\'a0 ON t.TrackId = i.TrackId\
GROUP BY g.name\
ORDER BY TracksSold DESC\uc0\u8232 LIMIT 5;\
\
SELECT a.name, SUM(i.unitprice) AS TotalRevenue\
FROM artist AS a\
JOIN album AS al\
\'a0 ON a.ArtistId = al.ArtistId\
JOIN track AS t\
\'a0 ON al.AlbumId = t.AlbumId\
JOIN invoiceline as i\
\'a0 ON t.TrackId = i.TrackId\uc0\u8232 GROUP BY a.name\
ORDER BY TotalRevenue DESC\
LIMIT 1;\
}
