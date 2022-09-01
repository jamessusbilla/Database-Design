-- Getting Meaningful Insights
-- patients which have companion firstname which has 'un' in the between and an 
-- activity which has an s in the between but with the letter before s can be any 
USE AMS;
-- Query 1
SELECT L2.pFirstName, L2.pSurname, L2.firstName, L2.surname, a.activitydescription FROM
(SELECT L1.pFirstName, L1.pSurname, L1.activityID, c.firstName,c.surname FROM
(SELECT p.patientID,al.companionID, p.pFirstName, p.pSurname, al.activityID FROM patient p 
inner join activitylog al on p.patientID = al.patientID) AS L1
INNER JOIN Companion c force index(index_companion) ON c.companionID = L1.companionID) AS L2 
INNER JOIN activity a force index(index_activity) ON a.activityID = L2.activityID 
WHERE L2.firstName like '%un%' and a.activitydescription like '%_s%'
ORDER BY L2.firstName;

-- Optimizing Query 1

CREATE INDEX index_companion ON Companion(surname,firstName);
CREATE INDEX index_activity ON Activity(activityID,activityDescription);

-- Query 1 can no longer be further optimised, Differences can be shown through execution plan & query stats of Query 1


-- Query 2

-- Patients which have more than 1 condition
SELECT  L1.pFirstName, L1.pSurname, COUNT(mr.medicalCondition) AS 'No.Condition' FROM 
(SELECT p.pFirstName,p.pSurname, cu.conditionID FROM patient p inner join checkup cu FORCE INDEX(index_checkups) on p.patientID = cu.patientID) AS L1
INNER JOIN medicalrecord mr on mr.conditionID = L1.conditionID
GROUP BY L1.pFirstName, L1.pSurname
HAVING COUNT(mr.medicalCondition) > 1;

-- Optimizing Query 2
CREATE INDEX index_checkups ON checkUP(checkUpID,conditionID,patientID);
-- See Optimization.Query 2 folder for details

-- Query 3
-- Number of contacts of each doctor
SELECT d.doctorID,dFirstName,dSurname,count(d.doctorID) AS 'No.PhoneNumber' 
FROM Doctor d FORCE INDEX(index_doctordetail), Contact c WHERE d.doctorID = c.doctorID
GROUP BY d.doctorID;

-- Optimizing Query 3
CREATE INDEX index_doctordetail ON Doctor(doctorID,dFirstName,dSurname);
-- index_doctordetail is created for future usage, See Optimization.Query 3