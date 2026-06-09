--- Creating the Database and further creating tables
CREATE DATABASE ProjectWorkMentalHealth;
 USE ProjectWorkMentalHealth;

 --Creating tables for the various entities
-- Patients table created
CREATE TABLE Patients(
Patient_id INT PRIMARY KEY,
PFName VARCHAR(50) NOT NULL,
PLName	VARCHAR(50) NOT NULL,
Age INT NOT NULL,
Gender VARCHAR(50) NOT NULL,
Phone_number INT,	
Home_address VARCHAR(50) NOT NULL,	
Email VARCHAR(50), 
Registration_date DATE NOT NULL);


	 --Therapists table created
CREATE TABLE Therapists(
    TherapistID INT PRIMARY KEY,
	TFName	VARCHAR(100) NOT NULL,
	TLName	VARCHAR(100) NOT NULL,
	Specialization VARCHAR(100) NOT NULL,
	Email  VARCHAR(50));
	SELECT *FROM Therapists;



	--Session table created
CREATE TABLE TSession(
   TsessionID INT PRIMARY KEY,
   Patient_id  INT ,
   TherapistID INT,
   SessionDate DATE,
   Duration INT NOT NULL,
   FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
   FOREIGN KEY (TherapistID) REFERENCES Therapists(TherapistID)
   );
  SELECT *FROM TSession;

	
	


   --Feedbacks table created
CREATE TABLE Feedbacks (
    FeedbackID INT PRIMARY KEY,
	Patient_id INT,
	FeedbackText VARCHAR(1000),
	Rating INT,
    SubmittedDate DATE NOT NULL,
	FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id));
	SELECT *FROM Feedbacks;


	
	--Progress table created

CREATE TABLE Progress(
    ProgressID INT PRIMARY KEY,
	Patient_id INT,
	CheckInDate DATE NOT NULL,
	MoodScore INT,
	SleepHours DECIMAL(10,2),
	FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id));
SELECT * FROM Progress;


--Records table created
CREATE TABLE Records(
     Record_id INT PRIMARY KEY,
     Patient_id INT,
	 diagnosis VARCHAR(100) NOT NULL,
	 treatment_plan VARCHAR(100) NOT NULL,
	 last_updated DATE,
	 FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id));
SELECT * FROM Records;




--Payments table created
CREATE TABLE Payments (
     payment_id INT PRIMARY KEY,
	 Patient_id INT,
	 TsessionID INT,
	 amount_paid DECIMAL(10,2) NOT NULL,
	 payment_method VARCHAR(100),
	 payment_date DATE NOT NULL,
	 FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
	 FOREIGN KEY (TsessionID) REFERENCES Tsession(TsessionID));
SELECT * FROM Payments;



--DBL and DML

--to select all values from the table
SELECT *FROM Patients;
Select * from Therapists;
Select * from Feedbacks;
Select * from TSession;
Select * from Progress;
Select * from Records;
Select * from Payments;

Select * from Therapists where Specialization in ('Humanistic');


--To RETRIEVE SPECIFIC columns IN a table 
SELECT PFName,PLName,Age,Gender from Patients;

--Selecting the top 5 patients by age
SELECT PFName,PLName,Gender FROM Patients ORDER BY Age DESC;

--Retrieve distinct values
SELECT DISTINCT Gender FROM Patients;

--For filtering records ,we use the "WHERE"
SELECT Age, Gender FROM Patients WHERE Age >50;

--Retrieving a record within a range
SELECT Age,Gender,Email FROM Patients WHERE Registration_date BETWEEN 2024-01 AND 2024-07;
 
--Retrieving data using string 
--wildcard is used as a cheat code ,something like the %
SELECT PFName,PLName,Email 
FROM Patients
WHERE PFName LIKE 'A%';

--Using logical operators like "AND ' or 'NOT'
SELECT MoodScore,SleepHours,Patient_id
FROM Progress
WHERE MoodScore > 4 AND Patient_id <1010;


SELECT MoodScore,SleepHours,Patient_id
FROM Progress
WHERE MoodScore > 4 OR Patient_id <1010;

SELECT MoodScore,SleepHours,Patient_id
FROM Progress
WHERE NOT MoodScore  < 4 ;

---DML
--Updating the table with a patient email(this is used when changes are to be made to a record in a table.)
SELECT *FROM Patients
UPDATE Patients
SET Home_address = 'Washington'
WHERE Patient_id = 1001;

--Create a full name column
SELECT PFName + '' + PLName AS Fullname, Age ,Email
FROM Patients;

--JOINS
--INNER join ,this talks about what is common b/w tables ..
--like an intersection(Performing an inner join between the patients table and the Session table)

SELECT S.TSessionID,S.Duration,P.PFName,P.PLName,P.Home_address
FROM     TSession S INNER JOIN Patients P
ON  S.Patient_id = P .Patient_id;


--Left Join (This will show all the rows of the session table and 
--only the matching rows on the right hand table )

SELECT S.TSessionID,S.Duration,P.PFName,P.PLName
FROM   TSession S LEFT JOIN Patients P
ON  S.Patient_id = P .Patient_id;

--Right outer join

SELECT S.TSessionID,S.Duration,P.PFName,P.PLName,P.Home_address
FROM     TSession S RIGHT JOIN Patients P
ON  S.Patient_id = P .Patient_id;


--full outer join
SELECT S.TSessionID,S.Duration,P.PFName,P.PLName,P.Home_address
FROM     TSession S FULL OUTER JOIN Patients P
ON  S.Patient_id = P .Patient_id;

---CROSS join
SELECT F.Rating ,PR.MoodScore
FROM Feedbacks F CROSS JOIN Progress PR;

--SUBQUERIES
SELECT  TFName,TLName FROM Therapists
WHERE TherapistID IN(
      SELECT TherapistID FROM TSession
	  WHERE TsessionID IN(
	        SELECT TsessionID FROM Payments
			WHERE amount_paid <(SELECT AVG(amount_paid) FROM Payments)));

Select *from payments

SELECT Patient_id,payment_method,amount_paid FROM Payments
WHERE amount_paid =(SELECT MIN(amount_paid) FROM Payments);









