--create tables

-- Table: taverns
CREATE TABLE taverns (
    id int IDENTITY(1, 1),
    name varchar(250),
    floor_count int,
    owner_id int,
    location_id int,
    PRIMARY KEY (id)
);

-- Table: users
CREATE TABLE users (
    id int IDENTITY(1, 1),
    name varchar(250),
    birthday date,
    role_id int,
    PRIMARY KEY (id)
);

-- Table: roles
CREATE TABLE roles (
    id int IDENTITY(1, 1),
    name varchar(250),
    PRIMARY KEY (id)
);

-- Table: locations
CREATE TABLE locations (
    id int IDENTITY(1, 1),
    name varchar(250),
    PRIMARY KEY (id)
);

-- Table: basement rats
CREATE TABLE basement_rats (
    id int IDENTITY(1, 1),
    name varchar(250),
    tavern_id int,
    PRIMARY KEY (id)
);

-- Table: supplies
CREATE TABLE supplies (
    id int IDENTITY(1, 1),
    name varchar(250),
    unit varchar(250),
    tavern_id int,
    quantity int,
    date_updated datetime,
    PRIMARY KEY (id)
);

-- Table: supply_sales
CREATE TABLE supply_sales (
    id int IDENTITY(1, 1),
    supply_id int,
    tavern_id int,
    total_cost decimal(10,2),
    quantity_sold int,
    date_purchased datetime,
    PRIMARY KEY (id)
);

-- Table: services
CREATE TABLE services (
    id int IDENTITY(1, 1),
    name varchar(250),
    status varchar(250),
    tavern_id int,
    PRIMARY KEY (id)
);

-- Table: service_sales
CREATE TABLE service_sales (
    id int IDENTITY(1, 1),
    service_id int,
    guest_id int,
    cost decimal(10,2),
    amount_purchased int,
    date_purchased datetime,
    tavern_id int,
    PRIMARY KEY (id)
);

-- Table: service_statuses
CREATE TABLE service_statuses (
    id int IDENTITY(1, 1),
    name varchar(250),
    PRIMARY KEY (id)
);

-- Table: guests
CREATE TABLE guests (
    id int IDENTITY(1, 1),
    name varchar(250),
    PRIMARY KEY (id)
);

-- seed tables

-- Table: taverns
INSERT INTO taverns (name, floor_count, owner_id, location_id) VALUES ('The Prancing Pony', 3, 1, 1);
INSERT INTO taverns (name, floor_count, owner_id, location_id) VALUES ('The Three Broomsticks', 1, 2, 2);
INSERT INTO taverns (name, floor_count, owner_id, location_id) VALUES ('The Leaky Cauldron', 2, 3, 3);
INSERT INTO taverns (name, floor_count, owner_id, location_id) VALUES ('The Green Dragon Inn', 1, 4, 4);
INSERT INTO taverns (name, floor_count, owner_id, location_id) VALUES ('The Hogs Head Inn', 2, 5, 2);

-- Table: users
INSERT INTO users (name, birthday, role_id) VALUES ('Gandalf', '1986-12-27', 1);
INSERT INTO users (name, birthday, role_id) VALUES ('Harry Potter', '1984-07-16', 2);
INSERT INTO users (name, birthday, role_id) VALUES ('Dumbledore', '1952-1-21', 2);
INSERT INTO users (name, birthday, role_id) VALUES ('Samwise Gamgee', '2000-01-01', 3);
INSERT INTO users (name, birthday, role_id) VALUES ('Hermione Granger', '1986-06-09', 5);

-- Table: roles
INSERT INTO roles (name) VALUES ('Wizard');
INSERT INTO roles (name) VALUES ('Chosen One');
INSERT INTO roles (name) VALUES ('Headmaster');
INSERT INTO roles (name) VALUES ('Hero');
INSERT INTO roles (name) VALUES ('Genius');

-- Table: locations
INSERT INTO locations (name) VALUES ('Bree');
INSERT INTO locations (name) VALUES ('Hogsmeade');
INSERT INTO locations (name) VALUES ('Diagon Alley');
INSERT INTO locations (name) VALUES ('The Shire');

-- Table: basement_rats
INSERT INTO basement_rats (name, tavern_id) VALUES ('Tom', 1);
INSERT INTO basement_rats (name, tavern_id) VALUES ('Fred', 2);
INSERT INTO basement_rats (name, tavern_id) VALUES ('Becky', 3);
INSERT INTO basement_rats (name, tavern_id) VALUES ('Henry', 4);
INSERT INTO basement_rats (name, tavern_id) VALUES ('Julie', 5);

-- Table: supplies
INSERT INTO supplies (name, unit, tavern_id, quantity, date_updated) VALUES ('Butterbeer', 'fluid ounces', 2, 10, '2021-01-20 01:00:00');
INSERT INTO supplies (name, unit, tavern_id, quantity, date_updated) VALUES ('Ale', 'fluid ounces', 1, 10, '2021-01-20 01:00:00');
INSERT INTO supplies (name, unit, tavern_id, quantity, date_updated) VALUES ('Beer', 'fluid ounces', 3, 10, '2021-01-20 01:00:00');
INSERT INTO supplies (name, unit, tavern_id, quantity, date_updated) VALUES ('Meat Pie', 'ounces', 4, 10, '2021-01-20 01:00:00');
INSERT INTO supplies (name, unit, tavern_id, quantity, date_updated) VALUES ('Candy', 'ounces', 5, 10, '2021-01-20 01:00:00');

-- Table: supply_sales
INSERT INTO supply_sales (supply_id, tavern_id, total_cost, quantity_sold, date_purchased) VALUES (1, 2, 3.99, 1, '2021-01-20 01:00:00');
INSERT INTO supply_sales (supply_id, tavern_id, total_cost, quantity_sold, date_purchased) VALUES (2, 1, 9.97, 2, '2021-01-20 01:00:00');
INSERT INTO supply_sales (supply_id, tavern_id, total_cost, quantity_sold, date_purchased) VALUES (3, 3, 10.06, 3, '2021-01-20 01:00:00');
INSERT INTO supply_sales (supply_id, tavern_id, total_cost, quantity_sold, date_purchased) VALUES (4, 4, 5.04, 1, '2021-01-20 01:00:00');
INSERT INTO supply_sales (supply_id, tavern_id, total_cost, quantity_sold, date_purchased) VALUES (5, 5, 5, 10.99, '2021-01-20 01:00:00');

-- Table: services
INSERT INTO services (name, status, tavern_id) VALUES ('Wand Repair', 'active', 2);
INSERT INTO services (name, status, tavern_id) VALUES ('Sword Sharpening', 'active', 1);
INSERT INTO services (name, status, tavern_id) VALUES ('Robe Repair', 'inactive', 3);
INSERT INTO services (name, status, tavern_id) VALUES ('Shoe Repair', 'inactive', 4);
INSERT INTO services (name, status, tavern_id) VALUES ('Career Counseling', 'active', 5);

-- Table: service_sales
INSERT INTO service_sales (service_id, guest_id, cost, amount_purchased, date_purchased, tavern_id) VALUES (1, 1, 9.99, 2, '2021-01-20 01:00:00', 2);
INSERT INTO service_sales (service_id, guest_id, cost, amount_purchased, date_purchased, tavern_id) VALUES (2, 2, 10.04, 1, '2021-01-20 01:00:00', 1);
INSERT INTO service_sales (service_id, guest_id, cost, amount_purchased, date_purchased, tavern_id) VALUES (3, 3, 9.99, 1, '2021-01-20 01:00:00', 3);
INSERT INTO service_sales (service_id, guest_id, cost, amount_purchased, date_purchased, tavern_id) VALUES (4, 4, 9.99, 1, '2021-01-20 01:00:00', 4);
INSERT INTO service_sales (service_id, guest_id, cost, amount_purchased, date_purchased, tavern_id) VALUES (5, 5, 9.99, 1, '2021-01-20 01:00:00', 5);

-- Table: service_statuses
INSERT INTO service_statuses (name) VALUES ('active');
INSERT INTO service_statuses (name) VALUES ('inactive');

-- Table: service_statuses
INSERT INTO guests (name) VALUES ('Pippin');
INSERT INTO guests (name) VALUES ('Ron');
INSERT INTO guests (name) VALUES ('Boromir');
INSERT INTO guests (name) VALUES ('Ginny');
INSERT INTO guests (name) VALUES ('Theoden');






