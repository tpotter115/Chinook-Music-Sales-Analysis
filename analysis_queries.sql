-- 1. Customer distribution by country
SELECT 
    Country, 
    COUNT(CustomerId) AS CustomerCount
FROM customer
GROUP BY Country
ORDER BY CustomerCount DESC;

-- 2. Top performing Sales Support Representative
SELECT 
    e.FirstName, 
    e.LastName, 
    SUM(i.total) AS TotalSales
FROM employee AS e
JOIN customer AS c ON e.EmployeeId = c.SupportRepId
JOIN invoice AS i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY TotalSales DESC
LIMIT 1;

-- 3. Total Revenue by Country
SELECT 
    c.Country, 
    SUM(i.Total) AS TotalRevenue
FROM customer AS c
JOIN invoice AS i ON c.CustomerId = i.CustomerId
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- 4. Top 5 Best-Selling Genres
SELECT 
    g.Name AS GenreName, 
    SUM(il.Quantity) AS TracksSold
FROM genre AS g
JOIN track AS t ON g.GenreId = t.GenreId
JOIN invoiceLine AS il ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY TracksSold DESC
LIMIT 5;

-- 5. Highest Grossing Artist
SELECT 
    a.Name AS ArtistName, 
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM artist AS a
JOIN album AS al ON a.ArtistId = al.ArtistId
JOIN track AS t ON al.AlbumId = t.AlbumId
JOIN invoiceLine AS il ON t.TrackId = il.TrackId
GROUP BY a.Name
ORDER BY TotalRevenue DESC
LIMIT 1;
