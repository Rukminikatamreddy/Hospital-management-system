create database hospital_management_system;
use hospital_management_system;

drop database hospital_management_system;
drop table departments;
drop table doctors;
drop table nurses;
drop table patients;
drop table appointments;

 create table departments(
 departmentID INT PRIMARY KEY AUTO_INCREMENT,
 departmentsName VARCHAR(100) NOT NULL);
 
 create table doctors(
 doctorID INT PRIMARY KEY AUTO_INCREMENT,
 doctorName VARCHAR(100) NOT NULL,
 gender ENUM('male','female','other'),
 phoneNumber BIGINT,
 speciality varchar(100),
 departmentID INT,
 FOREIGN KEY(departmentID) REFERENCES departments(departmentID)
);


CREATE TABLE nurses (
    nurseID INT PRIMARY KEY AUTO_INCREMENT,
    nurseName VARCHAR(100) NOT NULL,
    gender ENUM('male','female','others'),
    phoneNumber BIGINT,
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES departments(departmentID)
);


CREATE TABLE patients (
	patientID INT PRIMARY KEY AUTO_INCREMENT,
    patientName VARCHAR(100) NOT NULL,
    age INT,
	gender ENUM('male','female','others'),
    phoneNumber BIGINT,
    speciality VARCHAR(100),
    address VARCHAR (255),
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES departments(departmentID)
);

CREATE TABLE appointments (
	appointmentID INT PRIMARY KEY AUTO_INCREMENT,
    doctorID INT,
    patientID INT,
	appointmentDate DATE,
    appointmentTIME TIME,
    appointmentReason VARCHAR(255),
    FOREIGN KEY (doctorID) REFERENCES doctors(doctorID),
	FOREIGN KEY (patientID) REFERENCES patients(patientID)
);

INSERT INTO departments (departmentsName) VALUES ('Cardiology'), ('Orthopedics'), ('Neurology'), ('Pediatrics');

INSERT INTO doctors (doctorName, gender, phoneNumber, speciality, departmentID) VALUES 
('Dr. John Smith', 'male', 1234567890, 'Cardiologist', 1),
('Dr. Emily Johnson', 'female', 9876543210, 'Orthopedic Surgeon', 2),
('Dr. Michael Lee', 'male', 1231231234, 'Neurologist', 3),
('Dr. Sarah Clark', 'female', 4567891230, 'Pediatrician', 4);

INSERT INTO nurses (nurseName, gender, phoneNumber, departmentID) VALUES 
('Nurse Jane Doe', 'female', 9876543210, 1),
('Nurse Tom Smith', 'male', 1234567890, 2),
('Nurse Emily Brown', 'female', 4561237890, 3),
('Nurse Alex Johnson', 'male', 7891234560, 4);

 INSERT INTO patients (patientName, age, gender, phoneNumber, speciality, address, departmentID) VALUES 
('Alice Johnson', 35, 'female', 5551234567, 'Cardiology', '123 Main St, Anytown', 1),
('Bob Anderson', 45, 'male', 5559876543, 'Orthopedics', '456 Oak St, Othertown', 2),
('Cathy Smith', 25, 'female', 5555555555, 'Neurology', '789 Elm St, Newtown', 3),
('David Lee', 10, 'male', 5552223333, 'Pediatrics', '101 Pine St, Smalltown', 4);

INSERT INTO appointments (doctorID, patientID, appointmentDate, appointmentTIME, appointmentReason) VALUES 
(1, 1, '2024-04-25', '10:00:00', 'Routine checkup'),
(2, 2, '2024-04-26', '11:00:00', 'Knee pain evaluation'),
(3, 3, '2024-04-27', '12:00:00', 'Headache consultation'),
(4, 4, '2024-04-28', '13:00:00', 'Child vaccination');

SELECT * FROM departments;
SELECT * FROM doctors;
SELECT * FROM nurses;
SELECT * FROM patients;
SELECT * FROM appointments;


SELECT d.*, dp.departmentsName 
FROM doctors d 
JOIN departments dp ON d.departmentID = dp.departmentID;

SELECT * FROM appointments
ORDER BY appointmentDate ASC, appointmentTIME ASC;

SELECT * FROM nurses
ORDER BY nurseName DESC;

SELECT * FROM patients WHERE departmentID = 1;

SELECT p.*, dp.departmentsName 
FROM patients p 
left join departments dp ON p.departmentID = dp.departmentID;

SELECT dept.departmentsName AS department, COUNT(*) AS totalAppointments
FROM appointments a
INNER JOIN doctors d ON a.doctorID = d.doctorID
INNER JOIN departments dept ON d.departmentID = dept.departmentID
GROUP BY dept.departmentsName;

SELECT COUNT(*) AS totalDoctors FROM doctors;

SELECT MAX(age) AS maxAge FROM patients;

UPDATE doctors SET phoneNumber = 5559998888 WHERE doctorID = 5;











