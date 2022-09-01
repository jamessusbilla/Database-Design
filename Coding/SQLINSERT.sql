USE AMS;

-- Inserting Data into Doctor
INSERT INTO Doctor(doctorID,dFirstName,dSurname,office,address,suburb,city,dob) 
VALUES('D100','John','Doery','AG100', '34 Robson Street','Hampshire','Christchurch','1967-03-04'),
	  ('D101','Jerry','Zamson','AG101', '34 Rory Street','Campbell','Christchurch','1955-03-04'),
	  ('D102','Jenny','Doery','AG102', '34 Alabame Street','Kent','Christchurch','1963-12-04');
	  
-- Testing Doctors Data
SELECT * FROM doctor;


-- Inserting data to Contact
INSERT INTO Contact(doctorID,contactType,phoneNumber) 
			VALUES('D101','after-hours','01234567891'),
				  ('D101','work-hours','01234567892'),
				  ('D100','after-hours','01234567782'),
				  ('D100','work-hours','01234567678'),
				  ('D102','work-hours','01234567123');

-- Testing Contact Data
SELECT * FROM contact;				

-- Inserting data to Patient				
INSERT INTO Patient(patientID,pFirstName,pSurname,roomNumber,dob)
			VALUES('P101', 'Naomi', 'Del fuego', 'G100', '1955-08-15'),
			('P102', 'Noel', 'Fleming', 'G101', '1955-08-15'),
			('P103', 'Mark', 'Jones', 'G102', '1955-08-15');
			
-- Testing Patient Data
SELECT * FROM patient;

-- Inserting data to Relative
INSERT INTO Relative(relativeID,rFirstName,rSurname,rAddress,rSuburb,rCity,contact)
			VALUES('1','Kelly','Jones','342 Roosebelt Road','Seattle','Auckland','02134572891'),
					('2','James','Hope','31 Roosebelt Road','Seattle','Auckland','02134572871'),
						('3','Mark John','delos Santos','34 belt Road','Seattle','Auckland','02134132891');

-- Testing Relative Data
SELECT * FROM relative;			

-- Inserting data to Visitation
INSERT INTO Visitation(visitationID,patientID,relativeID,visitTime)
			VALUES('1','P101','1','2020-05-01 09:28:01'),('2','P103','2','2020-05-01 09:28:01'),('3','P102','3','2020-06-01 09:28:01');

-- Testing Visitation Data
SELECT * FROM visitation;

-- Insert medicalservice Data
INSERT INTO MedicalService(servID,servName,servType,servAddress,servSuburb,servCity,servContact)
			VALUES('M01','Mikes Dental Clinic','Dental','456 Rosewood Street','Parkson','Dunedin','01234567894'),
			('M02','Johns Psychiatric Clinic','Psychiatry','456 Rosebush Street','Appleby','Dunedin','01234957894'),
            ('M03','St Johns Emergency Clinic','Hospital','45 Rosatom Street','Appleby','Dunedin','01234857894');
			
-- Testing Data
SELECT * FROM MedicalService;

-- Insert MedicalRecord Data
INSERT INTO MedicalRecord(conditionID,medicalCondition,servID)
			VALUES('1','Dental Problem','M01'),('2','Depression','M02'),('3','Heart Attack','M03');
			
-- Testing MedicalRecord
SELECT * FROM MedicalRecord;
            
-- Inserting CheckUP Data
INSERT INTO CheckUP(checkUpID,patientID,doctorID,conditionID,time)
			VALUES(1,'P102','D102','1','2020-06-01 13:28:31'),(2,'P102','D102','3','2020-06-01 14:28:31');
            
-- Testing CheckUp data
SELECT * FROM checkup;
			
-- Inserting CarerData
INSERT INTO Carer(carerID,cFirstName,cSurname,cContact,cAddress,cSuburb,cCity,dob)
			VALUES('C1000','Mitch','Glenwood','02145678234', '1/100 St John Street','Maximillian','Christchurch','1989-05-12');

-- Testing Carer Data
SELECT * FROM carer;


-- Inserting CareLog Data
INSERT INTO CareLog(cLogID,patientID,carerID,date,startTime,endTime)
			VALUES('L1000','P101','C1000','2020-08-10','09:00','9:40'),('L1001','P101','C1000','2020-09-10','09:00','9:40');
-- Testing CareLog Data
SELECT * FROM CareLog;



-- -------------------------------------------------------------------------
-- Insert Activity Data
INSERT INTO Activity(activityID,activityDescription)
		VALUES('A1','Exercise'),
			  ('A2','Shopping'),
			  ('A3','Chess'),
			  ('A4','Teaching Facebook');

-- Testing Data
SELECT * FROM activity;

-- Insert Skill Data
INSERT INTO Skill(companionID,skill)
			VALUES('100001','Driving'),('100001','Cooking'),('100002','Problem Solver');
		
-- Testing Data
SELECT * FROM skill;        
        
-- Insert Companion Data
INSERT INTO Companion(companionID,firstName,surname,address,suburb,city,dob)
			VALUES('100001','June','Kathmandu','151 Riccarton Road','Riccarton','Christchurch','1990-08-07'),
            ('100002','Edmund','Kathmandu','11 Riccarton Road','Riccarton','Christchurch','1991-08-07');
			
-- Testing Data
SELECT * FROM companion;   			

-- Insert ActivityLog Data
INSERT INTO ActivityLog(logID,activityID,patientID,companionID,date,startTime,endTime)
			VALUES(1,'A1','P102','100001','2020-09-10','08:30','9:30'),
					(2,'A2','P102','100001','2020-09-10','09:30','10:30'),
						(3,'A3','P102','100002','2020-09-10','10:30','11:30');
                        
SELECT * FROM ActivityLog;




INSERT INTO consent(consentID, consentTime, consentStatus)
					VALUES('P102','2020-02-10 9:00','given'),
							('100001','2020-02-14 13:30','given'),
								('100002','2020-02-14 13:30','given'),
									('100001','2020-06-17 13:30','withdrawn');
                            
SELECT * FROM consent;


INSERT INTO consentdocumentation(consentID, consentLocation, consentType)
									values('P102','C:\ACAMS\Problem_Statement\BCDE214 Enterprise Problem.docx', 'written'),
											('100001', 'C:\ACAMS\Problem_Statement\BCDE214 Enterprise Problem.docx', 'written'),
												('100002','C:\ACAMS\Problem_Statement\BCDE214 Enterprise Problem.docx', 'online');
                                                
SELECT * FROM consentdocumentation;