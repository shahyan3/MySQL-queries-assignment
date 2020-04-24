-- TASK 2.1 -- 
SELECT 
    CONCAT(firstname, ' ', surname) AS full_name, degreecode
FROM
    teachingstaff,
    teachingcredentials
WHERE
    teachingstaff.employeeNumber = teachingcredentials.employeeNumber
        AND teachingcredentials.uni != 'QUT';

-- TASK 2.2 -- 
SELECT 
    student.studentID, firstName, surname, gender
FROM
    student,
    enrolment
WHERE
    student.studentID = enrolment.studentID
        AND enrolment.timeMode IN ('PT')
ORDER BY student.surname;

-- TASK 2.3 -- 
SELECT 
    teachingstaff.employeeNumber AS teacherID,
    surname,
    COUNT(instructs.studentID) AS teaching
FROM
    instructs,
    teachingstaff
WHERE
    teachingstaff.employeeNumber = instructs.employeeNumber
GROUP BY teachingstaff.employeeNumber;

-- TASK 2.4 -- 
SELECT 
    firstname as First_Name, degreecode as Degree_Code
FROM
    teachingstaff
        NATURAL JOIN
    teachingcredentials
WHERE
    degreeCode NOT IN (SELECT 
            degreecode
        FROM
            enrolment
        WHERE
            enrolment.year IN ('2019'));

-- TASK 2.5 -- 
SELECT 
    placeMode,
    timeMode,
    student.surname,
    grades.studentID,
    AVG(grade) AS GPA,
    COUNT(grade) AS totalGrade
FROM
    grades
        INNER JOIN
    student ON grades.studentID = student.studentID
        INNER JOIN
    enrolment ON student.studentID = enrolment.studentID
GROUP BY student.studentID , enrolment.placeMode , enrolment.timeMode
HAVING totalGrade > 1;

-- TASK 2.6 -- 
SELECT 
    instructs.subjectCode,
    teachingstaff.surname,
    MIN(grades.grade) AS lowestGrade,
    MAX(grades.grade) AS highestGrade,
    AVG(grades.grade),
    COUNT(instructs.studentID) AS enrolled_students
FROM
    teachingstaff
        INNER JOIN
    instructs ON teachingstaff.employeeNumber = instructs.employeeNumber
        INNER JOIN
    grades ON instructs.studentID = grades.studentID
GROUP BY instructs.subjectCode , teachingstaff.surname;


-- TASK 3 INSERT -- 
INSERT INTO teachingstaff (employeeNumber, firstName, surname, departmentName)
VALUES ('1009279', 'Srikanth', 'Nair', 'SEF');

-- TASK 3 DELETE -- 
DELETE FROM grades WHERE subjectCode LIKE 'BSB111%';

-- TASK 3 UPDATE -- 
SET SQL_SAFE_UPDATES = 0;
UPDATE instructs 
SET 
    instructs.position = 'LECTURER'
WHERE
    instructs.subjectCode REGEXP '^IFB10[12345]_18'
        AND instructs.position = 'TUTOR';

-- TASK 4a -- 
CREATE INDEX idx_student ON student(studentID);

-- TASK 4b -- 
CREATE VIEW studentView as (

SELECT 
    firstName, surname, subjectCode
FROM
    grades
        INNER JOIN
    student ON grades.studentID
WHERE
    grades.grade = 7
);


-- TASK 5 -- 
-- CREATE USER IF NOT EXISTS  Chan@localhost IDENTIFIED BY 'pass1'; --
-- CREATE USER IF NOT EXISTS  Jake@localhost IDENTIFIED BY 'pass1'; --

-- TASK 5a -- 
GRANT INSERT ON university.subject TO Chan@localhost;

-- TASK 5b -- 
GRANT DELETE ON university.subject TO Chan@localhost;

-- TASK 5c -- 
-- GRANT INSERT ON university.enrolment TO Jake@localhost; --
REVOKE INSERT ON university.enrolment FROM Jake@localhost;

-- TASK 5d -- 
-- GRANT DELETE ON university.enrolment TO Jake@localhost; -- 
REVOKE DELETE ON university.enrolment FROM Jake@localhost;







