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

-- START ASSIGNMENT TWO

-- Table: guests
CREATE TABLE guests (
    id int IDENTITY(1, 1),
    name varchar(250),
    notes varchar(Max),
    birthday date,
    cakeday date,
    status_id int
);

-- Table: guest_statuses
CREATE TABLE guest_statuses (
    id int IDENTITY(1, 1),
    name varchar(250)
);

-- Table: classes
CREATE TABLE classes (
    id int IDENTITY(1, 1),
    name varchar(250)
);

-- Table: levels
CREATE TABLE levels (
    id int IDENTITY(1, 1),
    level int,
    guest_id int,
    class_id int,
);

-- stop tracking rats
DROP TABLE IF EXISTS basement_rats;

-- add primary keys to new tables (assignment 2) using ALTER TABLE command
ALTER TABLE guests ADD PRIMARY KEY (id);
ALTER TABLE guest_statuses ADD PRIMARY KEY (id);
ALTER TABLE classes ADD PRIMARY KEY (id);
ALTER TABLE levels ADD PRIMARY KEY (id);

-- add a few guest_statuses
INSERT INTO guest_statuses (name) VALUES ('hangry');
INSERT INTO guest_statuses (name) VALUES ('sick');
INSERT INTO guest_statuses (name) VALUES ('placid');
INSERT INTO guest_statuses (name) VALUES ('fine');
INSERT INTO guest_statuses (name) VALUES ('raging');

-- add a few guests
INSERT INTO guests (name, notes, birthday, cakeday, status_id) VALUES ('Pippin', 'eats a lot', '2021-01-24', '2021-01-24', 1);
INSERT INTO guests (name, notes, birthday, cakeday, status_id) VALUES ('Ron', 'red hair', '2021-01-24', '2021-01-24', 2);
INSERT INTO guests (name, notes, birthday, cakeday, status_id) VALUES ('Boromir', 'has a sword', '2021-01-24', '2021-01-24', 3)
INSERT INTO guests (name, notes, birthday, cakeday, status_id) VALUES ('Ginny', 'also has red hair', '2021-01-24', '2021-01-24', 4)
INSERT INTO guests (name, notes, birthday, cakeday, status_id) VALUES ('Theoden', 'is a king', '2021-01-24', '2021-01-24', 5)

-- add a few guest_statuses

-- add foreign keys to all existing tables using ALTER TABLE command

ALTER TABLE taverns ADD FOREIGN KEY (location_id) REFERENCES locations(id);
ALTER TABLE taverns ADD FOREIGN KEY (owner_id) REFERENCES users(id);

ALTER TABLE users ADD FOREIGN KEY (role_id) REFERENCES roles(id);

ALTER TABLE supplies ADD FOREIGN KEY (tavern_id) REFERENCES taverns(id);

ALTER TABLE supply_sales ADD FOREIGN KEY (supply_id) REFERENCES supplies(id);
ALTER TABLE supply_sales ADD FOREIGN KEY (tavern_id) REFERENCES taverns(id);

ALTER TABLE services ADD FOREIGN KEY (tavern_id) REFERENCES taverns(id);

ALTER TABLE service_sales ADD FOREIGN KEY (service_id) REFERENCES services(id);
ALTER TABLE service_sales ADD FOREIGN KEY (guest_id) REFERENCES guests(id);
ALTER TABLE service_sales ADD FOREIGN KEY (tavern_id) REFERENCES taverns(id);

ALTER TABLE guests ADD FOREIGN KEY (status_id) REFERENCES guest_statuses(id);

ALTER TABLE levels ADD FOREIGN KEY (guest_id) REFERENCES guests(id);
ALTER TABLE levels ADD FOREIGN KEY (class_id) REFERENCES classes(id);


-- insertions that will fail due to foreign key restraints
-- INSERT INTO taverns (name, floor_count, owner_id, location_id) VALUES ('The Prancing Pony', 2, 'five', 'New York');
-- INSERT INTO service_sales (service_id, guest_id, cost, amount_purchased, date_purchased, tavern_id) VALUES (5, 'guest_four', 9.99, 1, '2021-01-20 01:00:00', 'The Hogs Head Inn');
-- INSERT INTO levels (level, guest_id, class_id) VALUES (27, 'Gandalf', 'Wizard');


