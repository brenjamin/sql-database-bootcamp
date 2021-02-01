-- add admin role
INSERT INTO roles (name) VALUES ('admin');

-- add some admins
INSERT INTO users (name, birthday, role_id) VALUES ('Sauron', '1984-07-16', 6);
UPDATE users SET role_id = 6 WHERE user_id = 1;


-- 1. Write a query to return users who have admin roles
SELECT * FROM users WHERE role_id = 6;

-- 2. Write a query to return users who have admin roles and information about their taverns
SELECT * FROM users u JOIN roles r on u.role_id = r.id AND u.role_id=6

-- 3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels
SELECT coung.name, c.name, l.level FROM guests g 
JOIN levels l 
ON g.id = l.guest_id 
JOIN classes c ON l.class_id = c.id 
ORDER BY g.name

-- 4. Write a query that returns the top 10 sales in terms of sales price and what the services were
SELECT TOP 10 ss.cost, sv.name 
FROM service_sales ss 
JOIN services sv 
ON ss.service_id = sv.id 
ORDER BY ss.cost DESC

-- 5. Write a query that returns guests with 2 or more classes
SELECT g.name, c.name
FROM guests g 
JOIN levels l 
ON g.id = l.guest_id 
JOIN classes c ON l.class_id = c.id
GROUP BY g.name
HAVING COUNT(g.name) > 1
ORDER BY g.name

-- 6. Write a query that returns guests with 2 or more classes with levels higher than 5


-- 7. Write a query that returns guests with ONLY their highest level class


-- 8. Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)


-- 9. Using the additional queries provided, take the lab’s SELECT ‘CREATE query’ and add any IDENTITY and PRIMARY KEY constraints to it.