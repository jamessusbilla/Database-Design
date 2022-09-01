-- Getting Meaningful Insights
-- patients which have companion firstname which has 'un' in the middle and an 
-- activity which has an s in the middle but with the letter before s can be any 
USE AMS;
SELECT L2.pFirstName, L2.pSurname, L2.firstName, L2.surname, a.activitydescription FROM
(SELECT L1.pFirstName, L1.pSurname, L1.activityID, c.firstName,c.surname FROM
(SELECT p.patientID,al.companionID, p.pFirstName, p.pSurname, al.activityID FROM patient p 
inner join activitylog al on p.patientID = al.patientID) AS L1
INNER JOIN Companion c ON c.companionID = L1.companionID) AS L2
INNER JOIN activity a ON a.activityID = L2.activityID
WHERE L2.firstName like '%un%' and a.activitydescription like '%_s%';

-- Patients which have more than 1 condition
SELECT  L1.pFirstName, L1.pSurname, COUNT(mr.medicalCondition) AS 'No.Condition' FROM 
(SELECT p.pFirstName,p.pSurname, cu.conditionID FROM patient p inner join checkup cu on p.patientID = cu.patientID) AS L1
INNER JOIN medicalrecord mr on mr.conditionID = L1.conditionID
GROUP BY L1.pFirstName, L1.pSurname
HAVING COUNT(mr.medicalCondition) > 1;

-- Number of contacts of each doctor, which a patient can call for future reference
SELECT d.doctorID,dFirstName,dSurname,count(d.doctorID) AS 'No.PhoneNumber' 
FROM Doctor d, Contact c WHERE d.doctorID = c.doctorID
GROUP BY d.doctorID;