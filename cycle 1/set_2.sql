CREATE TABLE STUDENT 
(
SID INT(3),
SNAME VARCHAR(25),
DOB DATE,
PHYSICS INT(3),
CHEMISTRY INT(3),
MATHS INT(3)
);

INSERT INTO STUDENT(SID,SNAME,DOB,PHYSICS,CHEMISTRY,MATHS)VALUES
(101,'ALLEN','2000-02-29',75,45,98),
(102,'ZAM','1998-04-01',50,85,50),
(103,'JONES','1999-05-13',80,96,30),
(104,'MARTIN','2002-03-18',100,60,70),
(105,'BLAKE','2002-11-14',60,88,30);

SELECT SID,SNAME AS YOUNGEST_STUDENT, DOB AS DATE_OF_BIRTH 
FROM STUDENT WHERE DOB=(SELECT MAX(DOB) FROM STUDENT);

SELECT * FROM STUDENT WHERE (PHYSICS OR CHEMISTRY) AND MATHS >40;

ALTER TABLE STUDENT
ADD COLUMN (TOTAL INT,AVERAGE INT);

DESCRIBE STUDENT;

SELECT SNAME, MAX(MATHS) AS MAX_MATHS FROM STUDENT;

SELECT SNAME, MIN(CHEMISTRY) AS MIN_CHEMISTRY FROM STUDENT;

UPDATE STUDENT SET TOTAL=PHYSICS+CHEMISTRY+MATHS;

SELECT * FROM STUDENT; 

SELECT * FROM STUDENT ORDER BY TOTAL DESC;

ALTER TABLE STUDENT
CHANGE AVERAGE AVG_MARK INT;
DESCRIBE STUDENT;

SELECT AVG(AVG_MARK) AS OVERALL_AVG FROM STUDENT;

UPDATE STUDENT SET AVG_MARK=SUM(PHYSICS+CHEMISTRY+MATHS)/3;
/*SELECT * FROM STUDENT WHERE AVG_MARK > 40.68;*/
SELECT * FROM STUDENT WHERE AVG_MARK > (SELECT AVG(AVG_MARK) FROM STUDENT);

SELECT COUNT(*) AS TOTAL_STUDENTS FROM STUDENT 
WHERE AVG_MARK > (SELECT AVG(AVG_MARK) FROM STUDENT);
