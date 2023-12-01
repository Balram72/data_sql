CREATE DATABASE IF EXISTS Telephone;
CREATE DATABASE Telephone;
USE Telephone;

-- ***************
-- *** groups ****
-- ***************

SELECT 'groups';
DROP TABLE IF EXISTS groups;
CREATE TABLE groups(
    g_id  INT(6) NOT NULL AUTO_INCREMENT,
    g_name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY(g_id) 
);
INSERT INTO groups (g_name) VALUES 
    ('School_Friends'),
    ('Professor'),
    ('College_Friends'),
    ('Business'),
    ('Office');

-- ***************
-- ** Porfession *
-- ***************
SELECT 'porfessions';
DROP TABLE IF EXISTS porfessions;
CREATE TABLE porfessions(
    p_id  INT(6) NOT NULL AUTO_INCREMENT,
    g_id  INT(6) NOT NULL REFERENCES groups(g_id),
    p_name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY(p_id) 
);
INSERT INTO porfessions(g_id,p_name) VALUES 
    (1,'Doctor'),
    (2,'Teacher'),
    (3,'Enginner'),
    (5,'Lawyer'),
    (2,'Nurse'),
    (4,'Electrician'),
    (3,'Actor'),
    (4,'Photographer'),
    (3,'Developer');



-- ***************
-- ** Location  **
-- ***************

SELECT 'locations';
DROP TABLE IF EXISTS locations;
CREATE TABLE locations(
    l_id  INT(6) NOT NULL AUTO_INCREMENT,
    l_name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY(l_id) 
);
INSERT INTO locations(l_name) VALUES 
    ('Bhubaneswar'),
    ('Sambalpur'),
    ('Cuttack'),
    ('Puri'),
    ('Berhampur'),
    ('Rayagada');


-- ***************
-- ** Contacts  **
-- ***************
SELECT 'contacts';
DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts(
    c_id  INT(6) NOT NULL AUTO_INCREMENT,
    g_id INT(6) NOT NULL REFERENCES groups(g_id),
    l_id INT(6) NOT NULL REFERENCES locations(l_id),
    p_id INT(6) NOT NULL REFERENCES porfessions(p_id),
    c_name VARCHAR(255) NOT NULL UNIQUE,
    c_email VARCHAR(255) NOT NULL UNIQUE,
    c_number VARCHAR(11) NOT NULL UNIQUE,
    PRIMARY KEY(c_id) 
);
INSERT INTO contacts(g_id,l_id,p_id,c_name,c_email,c_number) VALUES 
    (1,1,9,'Balram Panda','bal@gmail.com','1525925671'),
    (3,3,8,'Biku Jana','biku@gmail.com','2485203651'),
    (2,4,7,'Bibhuit Swain','bibhuti@gmail.com','3385203642'),
    (5,2,6,'Rudra jena','Rudra@gmail.com','4285213642'),
    (4,5,5,'Ram Swain','ram@gmail.com','5185203635'),
    (5,6,4,'saiRam panda','sai@gmail.com','6085203622'),
    (3,5,3,'aditya parida','aditya@gmail.com','7685203832'),
    (2,4,2,'Archana Panda','Archana@gmail.com','8785203952'),
    (1,2,1,'Rani Panda','Rain@gmail.com','9885203552'),
    (4,1,7,'jyoti Parida','jyoti@gmail.com','0985203777');

SELECT 
    contacts.c_id As 'Contact id',
    contacts.c_name AS 'Contact Name',
    contacts.c_email AS 'Contact Email',
    contacts.c_number AS 'Phone Number',
    porfessions.p_name AS 'Profession',
    groups.g_name AS 'Group',
    locations.l_name AS 'location'
FROM 
    Contacts
LEFT JOIN 
    groups ON groups.g_id = contacts.g_id
LEFT JOIN 
    porfessions ON porfessions.p_id = contacts.p_id
LEFT JOIN 
    locations ON  locations.l_id = contacts.l_id;



