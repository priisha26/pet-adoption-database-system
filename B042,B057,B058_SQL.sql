CREATE DATABASE petadoption;
USE petadoption;

-- =========================
-- USER TABLE
-- =========================

CREATE TABLE USER (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    housing_type VARCHAR(50),
    experience_level VARCHAR(50)
);

-- =========================
-- SHELTER TABLE
-- =========================

CREATE TABLE SHELTER (
    shelter_id INT PRIMARY KEY,
    shelter_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    contact_number VARCHAR(15)
);

-- =========================
-- PET TABLE
-- =========================

CREATE TABLE PET (
    pet_id INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT CHECK (age >= 0),
    gender VARCHAR(10),
    vaccinated BOOLEAN,
    urgent_status BOOLEAN,
    shelter_id INT,
    FOREIGN KEY (shelter_id)
        REFERENCES SHELTER(shelter_id)
);

-- =========================
-- ADOPTION REQUEST TABLE
-- =========================

CREATE TABLE ADOPTION_REQUEST (
    request_id INT PRIMARY KEY,
    user_id INT,
    pet_id INT,
    request_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (user_id)
        REFERENCES USER(user_id),

    FOREIGN KEY (pet_id)
        REFERENCES PET(pet_id)
);

-- =========================
-- FAVORITES TABLE
-- =========================

CREATE TABLE FAVORITES (
    favorite_id INT PRIMARY KEY,
    user_id INT,
    pet_id INT,

    FOREIGN KEY (user_id)
        REFERENCES USER(user_id),

    FOREIGN KEY (pet_id)
        REFERENCES PET(pet_id)
);

-- =========================
-- NEW TABLE: DONATION
-- =========================

CREATE TABLE DONATION (
    donation_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2) CHECK (amount > 0),
    donation_type VARCHAR(50),
    donation_date DATE,

    FOREIGN KEY (user_id)
        REFERENCES USER(user_id)
);

-- =========================
-- NEW TABLE: MEDICAL RECORD
-- =========================

CREATE TABLE MEDICAL_RECORD (
    record_id INT PRIMARY KEY,
    pet_id INT,
    treatment VARCHAR(100),
    doctor_name VARCHAR(100),
    cost DECIMAL(10,2),
    treatment_date DATE,

    FOREIGN KEY (pet_id)
        REFERENCES PET(pet_id)
);

-- =========================
-- NEW TABLE: EXPENSE
-- =========================

CREATE TABLE EXPENSE (
    expense_id INT PRIMARY KEY,
    pet_id INT,
    category VARCHAR(50),
    amount DECIMAL(10,2),
    expense_date DATE,

    FOREIGN KEY (pet_id)
        REFERENCES PET(pet_id)
);

-- =========================
-- INSERT DATA
-- =========================

INSERT INTO USER VALUES
(1,'Amit Sharma','amit@email.com','9876543210','Apartment','Beginner'),
(2,'Riya Patel','riya@email.com','9876501234','House','Experienced');

INSERT INTO SHELTER VALUES
(101,'Happy Tails Shelter','Mumbai','9871111111'),
(102,'Paws Care Center','Pune','9872222222');

INSERT INTO PET VALUES
(1,'Buddy','Dog','Golden Retriever',2,'Male',TRUE,TRUE,101),
(2,'Luna','Cat','Persian',1,'Female',TRUE,FALSE,102),
(3,'Max','Dog','Beagle',3,'Male',TRUE,FALSE,101);

INSERT INTO ADOPTION_REQUEST VALUES
(201,1,1,CURDATE(),'Pending'),
(202,2,2,CURDATE(),'Approved');

INSERT INTO FAVORITES VALUES
(301,1,2),
(302,2,1);

INSERT INTO DONATION VALUES
(401,1,500.00,'Medical',CURDATE()),
(402,2,1000.00,'Food',CURDATE());

INSERT INTO MEDICAL_RECORD VALUES
(501,1,'Vaccination','Dr. Mehta',1200.00,CURDATE()),
(502,2,'General Checkup','Dr. Shah',800.00,CURDATE());

INSERT INTO EXPENSE VALUES
(601,1,'Food',300.00,CURDATE()),
(602,2,'Maintenance',500.00,CURDATE());

-- =========================
-- BASIC SELECT
-- =========================

SELECT * FROM PET;

SELECT *
FROM PET
WHERE species = 'Dog';

-- =========================
-- JOINS
-- =========================

SELECT
    U.full_name,
    P.name,
    A.status
FROM ADOPTION_REQUEST A
JOIN USER U
ON U.user_id = A.user_id
JOIN PET P
ON P.pet_id = A.pet_id;

SELECT
    P.name,
    S.shelter_name,
    S.location
FROM PET P
JOIN SHELTER S
ON P.shelter_id = S.shelter_id;

-- =========================
-- GROUP BY + AGGREGATE
-- =========================

SELECT
    species,
    COUNT(*) AS total_pets
FROM PET
GROUP BY species;

SELECT
    donation_type,
    SUM(amount) AS total_donations
FROM DONATION
GROUP BY donation_type;

SELECT
    pet_id,
    COUNT(request_id) AS total_requests
FROM ADOPTION_REQUEST
GROUP BY pet_id;

-- =========================
-- HAVING
-- =========================

SELECT
    species,
    COUNT(*) AS total
FROM PET
GROUP BY species
HAVING COUNT(*) >= 1;

-- =========================
-- SUBQUERIES
-- =========================

SELECT name
FROM PET
WHERE pet_id IN
(
    SELECT pet_id
    FROM ADOPTION_REQUEST
    WHERE status = 'Pending'
);

SELECT name
FROM PET P
WHERE EXISTS
(
    SELECT *
    FROM MEDICAL_RECORD M
    WHERE M.pet_id = P.pet_id
);

-- =========================
-- VIEW
-- =========================

CREATE VIEW PET_DETAILS AS
SELECT
    name,
    species,
    age,
    vaccinated
FROM PET;

SELECT * FROM PET_DETAILS;

-- =========================
-- ORDER BY
-- =========================

SELECT
    name,
    age
FROM PET
ORDER BY age ASC;

-- =========================
-- LIMIT
-- =========================

SELECT *
FROM PET
LIMIT 5;

-- =========================
-- CASE STATEMENT
-- =========================

SELECT
    name,
    CASE
        WHEN age < 2 THEN 'Young'
        WHEN age BETWEEN 2 AND 5 THEN 'Adult'
        ELSE 'Senior'
    END AS age_category
FROM PET;

-- =========================
-- DISTINCT
-- =========================

SELECT DISTINCT
    species
FROM PET;

-- =========================
-- ANALYTICAL QUERY
-- =========================

SELECT
    P.name,
    COUNT(A.request_id) AS total_requests
FROM PET P
LEFT JOIN ADOPTION_REQUEST A
ON P.pet_id = A.pet_id
GROUP BY P.name;