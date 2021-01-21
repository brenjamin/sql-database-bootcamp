--tables

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
    birthday datetime,
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
    inventory int,
    date_updated datetime,
    PRIMARY KEY (id)
);

-- Table: supply_sales
CREATE TABLE supply_sales (
    id int IDENTITY(1, 1),
    supply_id int,
    tavern_id int,
    price decimal(10,2),
    quantity int,
    date_purchased datetime,
    PRIMARY KEY (id)
);

-- Table: services
CREATE TABLE services (
    id int IDENTITY(1, 1),
    status varchar(250),
    unit varchar(250),
    tavern_id int,
    inventory int,
    date_updated datetime,
    PRIMARY KEY (id)
);

-- Table: service_sales
CREATE TABLE service_sales (
    id int IDENTITY(1, 1),
    service_id int,
    guest_id int,
    tavern_id int,
    cost decimal(10,2),
    quantity decimal(10,2),
    date_purchased datetime,
    PRIMARY KEY (id)
);

-- Table: statuses
CREATE TABLE statuses (
    id int IDENTITY(1, 1),
    name varchar(250),
    PRIMARY KEY (id)
);




ALTER TABLE taverns ADD FOREIGN KEY location_id References locations(id)
ALTER TABLE taverns ADD FOREIGN KEY owner_id References users(id)

ALTER TABLE basement_rats ADD FOREIGN KEY tavern_id References taverns(id)

ALTER TABLE supplies ADD FOREIGN KEY tavern_id References taverns(id)

ALTER TABLE supply_sales ADD FOREIGN KEY supply_id References supplies(id)
ALTER TABLE supply_sales ADD FOREIGN KEY tavern_id References taverns(id)

ALTER TABLE services ADD FOREIGN KEY tavern_id References taverns(id)

ALTER TABLE service_sales ADD FOREIGN KEY service_id References services(id)
ALTER TABLE service_sales ADD FOREIGN KEY guest_id References users(id)
ALTER TABLE service_sales ADD FOREIGN KEY tavern_id References taverns(id)

-- Table: guest_statuses
CREATE TABLE guest_statuses (
    id int IDENTITY(1, 1),
    name varchar(250)
);

-- Table: classes
CREATE TABLE classes (
    id int IDENTITY(1, 1),
    name varchar(250),
    PRIMARY KEY (id)
);

-- Table: guests
CREATE TABLE guests (
    id int IDENTITY(1, 1),
    name varchar(250),
    notes varchar(250),
    birthday date,
    cakeday date,
    status_id int FOREIGN KEY REFERENCES guest_statuses(id),
    class_id int FOREIGN KEY REFERENCES classes(id),
    PRIMARY KEY (id)
);

-- Table: levels
CREATE TABLE levels (
    level int,
    guest_id int FOREIGN KEY REFERENCES guests(id),
    class_id int FOREIGN KEY REFERENCES classes(id),
);


DROP TABLE IF EXISTS basement_rats


