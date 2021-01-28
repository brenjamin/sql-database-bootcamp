-- 0. Complete the lab to create the SELECT CREATE query!
SELECT CONCAT('CREATE TABLE ', TABLE_NAME, ' (') AS query, 1 AS FILTER FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'taverns'
UNION
select CONCAT(COLUMN_NAME, ' ', DATA_TYPE, ','), 2
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'taverns'
UNION
SELECT ');', 3
ORDER BY FILTER;

-- 1. The system should also be able to track Rooms. Rooms should have a status and an associated tavern. 
-- There should be a way to track Room Stays which will contain a sale, guest, room, the date it was stayed in and the rate

CREATE TABLE room_statuses (
    id int PRIMARY KEY IDENTITY(1,1),
    status_name varchar(50)
);

CREATE TABLE rooms (
    id int PRIMARY KEY IDENTITY(1,1),
    status_id varchar(50) FOREIGN KEY REFERENCES room_statues(id),
    tavern_id int FOREIGN KEY REFERENCES taverns(id),
    rate_per_night decimal(10,2)
);

CREATE TABLE room_stays (
    id int PRIMARY KEY IDENTITY(1,1),
    sale_amount decimal(10, 2),
    guest_id int FOREIGN KEY REFERENCES guests(id),
    room_id int FOREIGN KEY REFERENCES rooms(id),
    date_of_stay date,
    rate decimal(10, 2)
);

--2. Write a query that returns guests with a birthday before 2000. 
SELECT * FROM guests WHERE YEAR(birthday) < 2000;

--3. Write a query to return rooms that cost more than 100 gold a night
SELECT * FROM rooms WHERE rate_per_night > 100;

--4.Write a query that returns UNIQUE guest names. 
SELECT DISTINCT name from guests;

--5. Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]
SELECT * from guests ORDER BY name ASC;

--6. Write a query that returns the top 10 highest price sales
SELECT TOP 10 * FROM supply_sales ORDER BY total_cost DESC

-- 7. Write a query to return all the values stored in all Lookup Tables - Lookup tables are the tables we reference typically with just an ID and a name. This should be a dynamic combining of all of the tables

-- 8. Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-10, 10-20, etc)
SELECT * from guests

-- 9. Write a series of INSERT commands that will insert the statuses of one table into another of your choosing using SELECT statements (See our lab in class - The INSERT commands should be generated). It’s ok if the data doesn’t match or make sense! :)
-- * Remember, INSERT Commands look like: INSERT INTO Table1 (column1, column2) VALUES (column1, column2)