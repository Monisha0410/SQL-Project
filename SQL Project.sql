CREATE DATABASE EmployeeDB;
USE EmployeeDB;
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    HireDate DATE,
    JobTitle VARCHAR(50),
    Department VARCHAR(50)
);
CREATE TABLE Jobs (
    JobID INT AUTO_INCREMENT PRIMARY KEY,
    JobTitle VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    JobDescription TEXT
);
CREATE TABLE Applications (
    ApplicationID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    JobID INT NOT NULL,
    ApplicationDate timestamp default current_timestamp(),
    Status ENUM('Submitted', 'In Review', 'Accepted', 'Rejected') DEFAULT 'Submitted',
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID)
);
INSERT INTO Employees (FirstName, LastName, Email, PhoneNumber, HireDate, JobTitle, Department)
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '2023-01-15', 'Software Engineer', 'IT'),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '2022-11-20', 'HR Manager', 'Human Resources');

INSERT INTO Jobs (JobTitle, Department, Salary, JobDescription)
VALUES 
('Software Developer', 'IT', 60000, 'Develop and maintain software applications.'),
('HR Specialist', 'Human Resources', 50000, 'Manage recruitment and employee relations.');

INSERT INTO Applications (EmployeeID, JobID, Status)
VALUES 
(1, 1, 'Submitted'),
(2, 2, 'In Review');

SELECT * FROM Employees;

SELECT a.ApplicationID, e.FirstName, e.LastName, j.JobTitle, a.Status
FROM Applications a
JOIN Employees e ON a.EmployeeID = e.EmployeeID
JOIN Jobs j ON a.JobID = j.JobID
WHERE j.JobID = 1;

SELECT Status, COUNT(*) AS TotalApplications
FROM Applications
GROUP BY Status;

