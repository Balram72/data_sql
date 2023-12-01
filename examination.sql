DROP DATABASE IF EXISTS gift;
CREATE DATABASE gift;
USE gift;

####################
###   students   ###
####################
SELECT 'students';
DROP TABLE IF EXISTS students;
CREATE TABLE students(
    roll_no     INT(6)              NOT NULL AUTO_INCREMENT,
    name        VARCHAR(50)         NOT NULL UNIQUE,
    father      VARCHAR(50)         DEFAULT NULL,
    gender      ENUM('F','M','O')   DEFAULT NULL,
    dob         DATE                DEFAULT NULL,
    PRIMARY KEY(roll_no)
);
INSERT INTO students(name,father,gender,dob) VALUES
    ('Tanmoy Sinha','Sinha','M','1990-11-30'),
    ('Balram Panda','Panda','M','1995-12-12'),
    ('Rudra Prasad Jena','Jena','M','1995-01-13'),
    ('Uma Sankar Dash','Dash','M','1994-02-15');


#################
###   marks   ###
#################
SELECT 'marks';
DROP TABLE IF EXISTS marks;
CREATE TABLE marks(
    mark_id			INT(6)          NOT NULL AUTO_INCREMENT,
	roll_no			INT(6)          NOT NULL REFERENCES students(roll_no),
	english			INT(3)			DEFAULT 0,
	mathematics		INT(3)			DEFAULT 0,
	physics			INT(3)			DEFAULT 0,
	chemistry		INT(3)			DEFAULT 0,
	biology			INT(3)			DEFAULT 0,
	history			INT(3)			DEFAULT 0,
	civics			INT(3)			DEFAULT 0,
	geography		INT(3)			DEFAULT 0,
	PRIMARY KEY(mark_id)
);
INSERT INTO marks(roll_no,english,mathematics,physics,chemistry,biology,history,civics,geography) VALUES
	(3, 60, 85, 77, 80, 85, 60, 50, 70),
	(5, 60, 85, 77, 80, 85, 60, 50, 70),
	(2, 60, 85, 77, 80, 85, 60, 50, 70),
	(4, 60, 85, 77, 80, 85, 60, 50, 70),
	(1, 60, 85, 77, 80, 85, 60, 50, 70);


######################
###   attendance   ###
######################
SELECT 'attendance';
DROP TABLE IF EXISTS attendance;
CREATE TABLE attendance(
    attend_id			INT(6)          NOT NULL AUTO_INCREMENT,
	roll_no             INT(6)          NOT NULL REFERENCES students(roll_no),
	month_year          VARCHAR(20)     NOT NULL,
	day_01              ENUM('P')       DEFAULT NULL,
	day_02              ENUM('P')       DEFAULT NULL,
	day_03              ENUM('P')       DEFAULT NULL,
	day_04              ENUM('P')       DEFAULT NULL,
	day_05              ENUM('P')       DEFAULT NULL,
	day_08              ENUM('P')       DEFAULT NULL,
	day_09              ENUM('P')       DEFAULT NULL,
	day_10              ENUM('P')       DEFAULT NULL,
	day_11              ENUM('P')       DEFAULT NULL,
	day_12              ENUM('P')       DEFAULT NULL,
	PRIMARY KEY(attend_id)
);
INSERT INTO attendance(roll_no,month_year,day_01,day_02,day_03,day_04,day_05,day_08,day_09,day_10,day_11,day_12) VALUES
	(2, 'Nov-2023', 'P','P','P','P','P','P','P','P','P','P'),
	(1, 'Nov-2023', 'P','P','P','P','P','P','P','P','P','P'),
	(4, 'Nov-2023', 'P','P','P','P','P','P','P','P','P','P'),
	(3, 'Nov-2023', 'P','P','P','P','P','P','P','P','P','P'),
	(5, 'Nov-2023', 'P','P','P','P','P','P','P','P','P','P');

SELECT roll_no AS 'Roll',name AS 'Candiate-Name',gender AS 'SEX',DATE_FORMAT(dob,'%d-%m-%y') AS 'Date-of-Birth' FROM students;

SELECT m.roll_no AS 'Roll',s.name AS 'Candiate-Name',s.gender AS 'SEX',DATE_FORMAT(s.dob,'%d-%m-%y') AS 'Date-of-Birth',m.english AS 'ENG',m.mathematics AS 'MATH',a.day_01 AS '01', a.day_02 AS '02' FROM students AS s
LEFT JOIN marks AS m ON (s.roll_no=m.roll_no)
LEFT JOIN attendance AS a ON (s.roll_no=a.roll_no);



