use AMS;

-- Creating Views
-- Companion

CREATE OR REPLACE VIEW VActivityLog AS
SELECT logID,activityID,patientID,companionID,date,startTime,endTime FROM activitylog;

CREATE OR REPLACE VIEW VCompanion AS
SELECT companionID,firstName,surname,address,suburb,city,dob FROM Companion;

-- Relative

CREATE OR REPLACE VIEW VRelative AS
SELECT relativeID,rFirstName,rSurname,rAddress,rSuburb,rCity,contact FROM Relative;


CREATE OR REPLACE VIEW VVisitation AS
SELECT visitationID,patientID,relativeID,visitTime FROM Visitation;

-- Doctor

CREATE OR REPLACE VIEW VDoctor AS
SELECT doctorID,dFirstName,dSurname,office,address,suburb,city,dob FROM Doctor;


CREATE OR REPLACE VIEW VContact AS
SELECT doctorID,contactType,phoneNumber FROM Contact;


-- Carer
CREATE OR REPLACE VIEW VCarer AS
SELECT carerID,cFirstName,cSurname,cContact,cAddress,cSuburb,cCity,dob FROM Carer;


CREATE OR REPLACE VIEW VCareLog AS
SELECT cLogID,patientID,carerID,date,startTime,endTime FROM CareLog;

-- Creating a role 
CREATE ROLE 'Companion';
CREATE ROLE 'Relative';
CREATE ROLE 'Doctor';
CREATE ROLE 'Carer';

-- Granting permissions on to a Companion role
GRANT SELECT, INSERT ON AMS.VActivityLog TO 'Companion';
GRANT SELECT, INSERT, UPDATE ON AMS.VCompanion TO 'Companion';

-- Granting permissions on to a Relative role
GRANT SELECT, INSERT, UPDATE ON AMS.VRelative TO 'Relative';
GRANT SELECT, INSERT ON AMS.VVisitation TO 'Relative';

-- Granting permissions on to a Doctor role
GRANT SELECT, INSERT, UPDATE ON AMS.VDoctor TO 'Doctor';
GRANT SELECT, INSERT, UPDATE ON AMS.VContact TO 'Doctor';

-- Granting permissions on to a Carer role
GRANT SELECT, INSERT, UPDATE ON AMS.VCarer TO 'Carer';
GRANT SELECT, INSERT ON AMS.VCareLog TO 'Carer';

-- Creating new user
CREATE USER 'Alberto'@'localhost' IDENTIFIED BY 'alberto1234#';
CREATE USER 'Nina'@'localhost' IDENTIFIED BY 'nina1234#';
CREATE USER 'Steve'@'localhost' IDENTIFIED BY 'steve1234#';
CREATE USER 'Jenny'@'localhost' IDENTIFIED BY 'jenny1234#';

-- Grant user a role
GRANT 'Companion' TO 'Alberto'@'localhost';
GRANT 'Relative' TO 'Nina'@'localhost';
GRANT 'Doctor' TO 'Steve'@'localhost';
GRANT 'Carer' TO 'Jenny'@'localhost';

-- TO MAKE ROLE ACTIVE
SET DEFAULT ROLE ALL TO 'Alberto'@'localhost', 'Nina'@'localhost', 'Steve'@'localhost', 'Jenny'@'localhost';
