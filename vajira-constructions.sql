-----create the database for the company-----
CREATE DATABASE Vajira_Constructions;


-----use the created database to implement the tables and input data-----
USE Vajira_Constructions;


-----create table for normalized strong entity department-----
CREATE TABLE Department
(Department_ID varchar(3) NOT NULL Primary key,
Department_Name varchar(50) NOT NULL);

INSERT INTO Department values('D01','Human Resources'), ('D02','Finance and Accounting'),
('D03','Project Management'), ('D04','Engineering and Design'),
('D05','Information Technology'), ('D06','Supply Chain and Purchases'),
('D07','Constructions and Operations'), ('D08','Quality Assurance/Control'),
('D09','Equipment Maintenance'), ('D10','Health and Safety');

SELECT * FROM Department;

-----create table for strong entity employee-----
CREATE TABLE Employee
(Employee_ID varchar(4) NOT NULL Primary key,
Employee_Name varchar(100) NOT NULL,
Age numeric(2) NOT NULL,
Salary int NOT NULL,
Position varchar(20) NOT NULL,
Phone_No numeric(10) NOT NULL,
Department_ID varchar(3) NOT NULL Foreign key references Department(Department_ID));

INSERT INTO Employee values('E001','Nuwan Perera','32',175000,'Project Manager','0713353092','D03'),
('E002','Tharindu Perera','35',200000,'Construction Manager','0720711504','D07'),
('E003','Chamodi Silva','29',120000,'Civil Engineer','0786905892','D04'),
('E004','Nuwan Wickramasinghe','42',150000,'Architect','0713571669','D04'),
('E005','Saman Jayantha','40',90000,'Foreman','0710965891','D07'),
('E006','Nishantha Kumara','38',50000,'Safety Officer','0776079872','D10'),
('E007','Pradeep Kumara','45',45000,'Security Officer','0713250696','D10'),
('E008','Prabath Liyanage','23',165000,'QA and QC Manager','0785387988','D08'),
('E009','Anjula Supun','31',65000,'Accountant','0740822123','D02'),
('E010','Chanaka Madushan','32',230000,'Software Engineer','0776744068','D05'),
('E011','Sanduni Liyanage','27',125000,'HR Manager','0779524343','D01'),
('E012','Gihan Shirantha','28',60000,'Foreman','0774600864','D07'),
('E013','Nethmi Sandamali','22',45000,'Casier','0710828295','D02'),
('E014','Chamith Premalal','36',90000,'QA','0760831863','D08'),
('E015','Lalith Bandara','45',70000,'Carpenter','0770077133','D07'),
('E016','Niroshan Costa','25',150000,'IT Manager','0763286236','D05'),
('E017','Supun Dilshan','33',300000,'Engineering Manager','0778478195','D04'),
('E018','Sandunika Pieris','36',135000,'Health Manager','0723412604','D10'),
('E019','Janith Rathnasekara','29',125000,'Electrician','0720500100','D07'),
('E020','Sherine Rodrigo','37',130000,'Surveyor','0740587668','D04'),
('E021','Sumeda Adhikari','34',95000,'Mason','0718369374','D07'),
('E022','Kawya Dilshani','30',100000,'Nurse','0775882738','D10'),
('E023','Sajith Madusha','31',120000,'Supply Chain Manager','0711257099','D06'),
('E024','Chathumi Hansika','28',75000,'QC','0764193014','D08'),
('E025','Saman Kumara','37',40000,'Cleaner','0778650315','D09'),
('E026','Pasindu Nishan','42',60000,'Foreman','0778089407','D09'),
('E027','Asuntha Fernando','26',100000,'Finance Manager','0765917667','D02'),
('E028','Kavindu Weerasinghe','30',38000,'Cleaner','0776312916','D10'),
('E029','Gayan Sandaruwan','27',115000,'Maintenance Manager','0702875031','D09'),
('E030','Charith Sachintha','47',80000,'Mason','0773018734','D04');

SELECT * FROM Employee;

-----create table for strong entity permanent employee-----
CREATE TABLE Permanent_Employee
(PEmployee_ID varchar(4) NOT NULL Foreign key references Employee(Employee_ID),
OT_Hours int NOT NULL);

INSERT INTO Permanent_Employee values('E001',50), ('E002',52), ('E003',25), ('E005',19), 
('E006',48), ('E008',57), ('E009',23), ('E011',36), ('E012',36), ('E013',0), ('E014',26), ('E016',30),
('E017',42), ('E018',55), ('E019',44), ('E020',60), ('E023',36), ('E024',47), ('E027',31), ('E029',20);

SELECT * FROM Permanent_Employee; 

-----create table for strong entity freelanced employee-----
CREATE TABLE Freelanced_Employee
(FEmployee_ID varchar(4) NOT NULL Foreign key references Employee(Employee_ID),
Worked_Hours int NOT NULL);

INSERT INTO Freelanced_Employee values('E004',520), ('E007',812),
('E010',360), ('E015',350), ('E021',500), ('E022',715),
('E025',450), ('E026',150), ('E028',600), ('E030',320);

SELECT * FROM Freelanced_Employee; 

-----create table for strong entity customer-----
CREATE TABLE Customer
(Customer_ID int IDENTITY(1,1) NOT NULL Primary key,
Customer_Name varchar(100) NOT NULL,
Address varchar(20) NOT NULL);

INSERT INTO Customer (Customer_Name,Address)
values('Shanthakumar Mirthush','Negombo'), ('Indika Fernando','Nittabuwa'),
('Sheltan Kumara','Jaela'), ('Shanika Maduwanthi','Kurunegala'), ('Kaushal Perera','Colombo'), ('Nihal Kumarasiri','Wattala'),
('Samitha Athapaththu','Minuwangoda'), ('Ajith Soyza','Kottawa'), ('Maheshi Perera','Katana'), ('Ashoka Silva','Chilaw');

SELECT * FROM Customer; 

-----create table for strong entity projects-----
CREATE TABLE Projects
(Project_ID int IDENTITY(1,1) NOT NULL Primary key,
Project_Name varchar(100) NOT NULL,
Location varchar(50) NOT NULL,
Budget int NOT NULL,
Start_Date date NOT NULL,
End_Date date NOT NULL,
Customer_ID int NOT NULL Foreign key references Customer(Customer_ID));

INSERT INTO Projects (Project_Name,Location,Budget,Start_Date,End_Date,Customer_ID) 
values('Two Storied House','Negombo',5000000,'2024-07-16','2024-10-16',1),
('Cafe Building','Katana',1000000,'2024-08-11','2024-09-13',9),
('Shopping Mall','Jaela',6500000,'2024-07-12','2024-10-11',3),
('Sports Complex','Colombo',7000000,'2024-11-23','2025-01-20',5),
('Supermarket','Nittabuwa',5500000,'2024-12-12','2025-02-28',2),
('Villa','Kurunegala',4500000,'2025-02-13','2025-03-23',4),
('Two Storied House','Chilaw',2000000,'2025-01-04','2025-03-16',10),
('Single Storied House','Kottawa',2000000,'2025-02-02','2025-04-02',8),
('Garment Factory','Minuwangoda',5000000,'2024-12-06','2025-04-12',7),
('Three Storied House','Wattala',7500000,'2025-01-20','2025-05-06',6);

SELECT * FROM Projects; 

-----create table for strong entity project tasks-----
CREATE TABLE Project_Tasks
(Task_ID varchar(4) NOT NULL Primary key,
Task_Description varchar(100) NOT NULL,
Deadline date NOT NULL,
Status varchar(20) NOT NULL,
Project_ID int NOT NULL Foreign key references Projects(Project_ID));

INSERT INTO Project_Tasks values('T001','Fix the Pantry Cupboards','2024-10-02','Completed',1),
('T002','Lay Foundation for the building','2024-07-28','Completed',3),
('T003','Carpet the Running Tracks','2024-12-12','Completed',4),
('T004','Wiring','2025-01-30','Ongoing',5),
('T005','Tile the floors','2025-01-16','Ongoing',5),
('T006','Roofing','2025-03-06','Pending',6),
('T007','Build the walls','2025-01-23','Ongoing',9),
('T008','Plan the Design','2025-01-18','Ongoing',10),
('T009','Plastering walls','2025-02-14','Pending',10),
('T010','Fix Doors and Windows','2025-05-01','Pending',10);

SELECT * FROM Project_Tasks; 

-----create table for strong entity supplier-----
CREATE TABLE Supplier
(Supplier_ID varchar(4) NOT NULL Primary key,
Supplier_Name varchar(100) NOT NULL);

INSERT INTO Supplier values('S001','Liyanage Traders'), ('S002','Anthonys Hardware'),
('S003','Sandasiri Traders'), ('S004','Perera Steels'), ('S005','Udayasiri Hardware'), ('S006','Rhino Roofing'),
('S007','Ranjith Furnitures'), ('S008','Rocel Bathware'), ('S009','Saman Electricals'), ('S010','Perno Tiles');

SELECT * FROM Supplier; 

-----create table for strong entity material-----
CREATE TABLE Material
(Material_ID int NOT NULL Primary key,
Material_Name varchar(100) NOT NULL,
Quantity int NOT NULL,
Price decimal(8,2) NOT NULL);

INSERT INTO Material values(1,'Cement Bags',2000,'14000'), (2,'Steel Rods',500,'1500'),(3,'Paint Buckets',100,'18500'),
(4,'Paint Brushes',50,'800'), (5,'Doors',10,'75000'), (6,'Windows',24,'120000'), (7,'Pantry Cupboards',6,'54000'),
(8,'Bathware Sets',2,'280000'), (9,'Tiles',200,'165000'), (10,'Wires',5,'18000'), (11,'Roofing Sheets',200,'98000');

SELECT * FROM Material; 

-----create table for weak entity manager-----
CREATE TABLE Manager
(Manager_ID varchar(4) NOT NULL Primary key,
Years_Worked int NOT NULL,
Employee_ID varchar(4) NOT NULL Foreign key references Employee(Employee_ID));

INSERT INTO Manager values('M001',3,'E001'), ('M002',5,'E002'),
('M003',1,'E008'), ('M004',2,'E011'),
('M005',1,'E016'), ('M006',4,'E017'),
('M007',8,'E018'), ('M008',3,'E023'),
('M009',2,'E027'), ('M010',4,'E029');

SELECT * FROM Manager;

-----create table for weak entity employee assignments -----
CREATE TABLE Employee_Assignments
(Assignment_ID varchar(4) NOT NULL Primary key,
Task_ID varchar(4) NOT NULL Foreign key references Project_Tasks(Task_ID));

INSERT INTO Employee_Assignments values('A001','T001'), ('A002','T002'),
('A003','T003'), ('A004','T004'), ('A005','T005'), ('A006','T006'),
('A007','T007'), ('A008','T008'), ('A009','T009'), ('A010','T010');

SELECT * FROM Employee_Assignments;

-----create table for employee assignments m:n relationship-----
CREATE TABLE Assigned_Assignments
(Employee_ID varchar(4) NOT NULL Foreign key references Employee(Employee_ID),
Assigment_ID varchar(4) NOT NULL Foreign key references Employee_Assignments(Assignment_ID));

INSERT INTO Assigned_Assignments values('E015','A001'), ('E021','A002'), ('E030','A002'), ('E030','A003'),
('E019','A004'), ('E021','A005'), ('E015','A006'), ('E030','A007'),
('E021','A007'), ('E003','A008'), ('E021','A009'), ('E015','A010');

SELECT * FROM Assigned_Assignments; 

-----create table for employee and manager m:n relationship-----
CREATE TABLE Permanent_Employee_Manager
(Employee_ID varchar(4) NOT NULL Foreign key references Employee(Employee_ID),
Manager_ID varchar(4) NOT NULL Foreign key references Manager(Manager_ID));

INSERT INTO Permanent_Employee_Manager values('E001','M001'), ('E002','M002'),
('E008','M003'), ('E011','M004'), ('E016','M005'), ('E017','M006'),
('E018','M007'), ('E023','M008'), ('E027','M009'), ('E029','M010');

SELECT * FROM Permanent_Employee_Manager;

-----create table for quantity used m:n relationship-----
CREATE TABLE Quantity_Used
(Project_ID int NOT NULL Foreign key references Projects(Project_ID),
Material_ID int NOT NULL Foreign key references Material(Material_ID),
Quantity_Used int NOT NULL);

INSERT INTO Quantity_Used values(1,7,6), (3,1,500), (3,2,50),
(4,1,400), (5,10,3), (5,9,150), (6,11,100),
(9,1,100), (10,1,200), (10,5,6), (10,6,15);

SELECT * FROM Quantity_Used;

-----create table for supplied material m:n relationship-----
CREATE TABLE Supplied_Material
(Supplier_ID varchar(4) NOT NULL Foreign key references Supplier(Supplier_ID),
Material_ID int NOT NULL Foreign key references Material(Material_ID));

INSERT INTO Supplied_Material values('S004',2), ('S001',1), ('S002',3),
('S002',4), ('S007',5), ('S007',6), ('S007',7),
('S008',8), ('S010',9), ('S009',10), ('S006',11);

SELECT * FROM Supplied_Material;

-----create table for multivalued department telephone no-----
CREATE TABLE Department_Telephone_No
(Department_ID varchar(03) NOT NULL Foreign key references Department(Department_ID),
Telephone_No numeric(10) NOT NULL);

INSERT INTO Department_Telephone_No values('D01','0112293001'),('D02','0112293010'), ('D02','0112293010'),
('D03','0112293020'), ('D04','0112293030'), ('D05','0112293040'), ('D06','0112293050'), 
('D06','0112293051'), ('D07','0112293060'), ('D08','0112293070'), ('D08','0112293071'),
('D09','0112293080'), ('D10','0112293090'), ('D10','0112293091'), ('D10','0112293092');

SELECT * FROM Department_Telephone_No;

-----create table for multivalued customer phone no-----
CREATE TABLE Customer_Phone_No
(Customer_ID int NOT NULL Foreign key references Customer(Customer_ID),
Phone_No numeric(10) NOT NULL);

INSERT INTO Customer_Phone_No values(1,'0777196065'), (2,'0750209749'),
(2,'0785672066'), (3,'0769034186'), (3,'0771904489'), (4,'0778532260'), (4,'0741786120'),
(5,'0776844589'), (6,'0701354108'), (7,'0718852566'), (7,'0760862601'), (8,'0786011018'),
(9,'0774375487'), (9,'0704896945'), (10,'0703958500'), (10,'0725639293');

SELECT * FROM Customer_Phone_No;

-----create table for multivalued supplier phone no-----
CREATE TABLE Supplier_Phone_No
(Supplier_ID varchar(04) NOT NULL Foreign key references Supplier(Supplier_ID),
Phone_No numeric(10) NOT NULL);

INSERT INTO Supplier_Phone_No values('S001','01122293000'), ('S001','0112231952'), ('S001','01173321000'),
('S002','0111614152'), ('S003','0117544801'), ('S004','0110323072'), ('S004','0111273072'), ('S005','0110322173'),
('S006','0114332270'), ('S007','0113490220'), ('S007','0111363793'), ('S007','0111980621'),
('S008','0118333966'), ('S009','0114434900'), ('S010','0116760760'), ('S010','0117321095');

SELECT * FROM Supplier_Phone_No;

-----create table for multivalued supplier address-----
CREATE TABLE Supplier_Address
(Supplier_ID varchar(04) NOT NULL Foreign key references Supplier(Supplier_ID),
Address varchar(20) NOT NULL);

INSERT INTO Supplier_Address values('S001','Jaela'), ('S001','Colombo'), ('S001','Minuwangoda'),
('S002','Colombo'), ('S003','Kandy'), ('S004','Jaela'), ('S004','Colombo'), ('S005','Gampaha'),
('S006','Kurunegala'), ('S007','Negombo'), ('S007','Wattala'), ('S007','Kadawatha'),
('S008','Kandana'), ('S009','Nittabuwa'), ('S010','Nittabuwa'), ('S010','Peliyagoda');

SELECT * FROM Supplier_Address;

-----create and view normalized assignment hours table-----
CREATE TABLE Assignment_Hours 
(Assignment_ID varchar(04) NOT NULL Foreign key references Employee_Assignments(Assignment_ID),
Hours_Worked int NOT NULL);

INSERT INTO Assignment_Hours values('A001',300), ('A002',250),
('A003',36), ('A004',400), ('A005',60), ('A006',45),
('A007',100), ('A008',90), ('A009',120), ('A010',48);

SELECT * FROM Assignment_Hours;

-----create and view normalized department manager table-----
CREATE TABLE Department_Manager
(Department_ID varchar(03) NOT NULL Foreign key references Department(Department_ID),
Manager_ID varchar(4) NOT NULL Foreign key references Manager(Manager_ID));

INSERT INTO Department_Manager values('D01','M004'), ('D02','M009'),
('D03','M001'), ('D04','M006'), ('D05','M005'), ('D06','M008'),
('D07','M002'), ('D08','M003'), ('D09','M010'), ('D10','M007');

SELECT * FROM Department_Manager;

-----employees having salary greater than 100000-----
SELECT Employee_Name, Salary
FROM Employee 
WHERE Salary>100000;

-----details of freelanced employees-----
SELECT Employee_ID,Employee_Name, Age, Salary,Position, Department_ID 
FROM Employee, Freelanced_Employee
WHERE Employee.Employee_ID=Freelanced_Employee.FEmployee_ID;

-----permanent employees who worked more than 50 OT Hours-----
SELECT * FROM Permanent_Employee
WHERE OT_Hours>50;

-----completed projects before 2025-----
SELECT Project_Name, End_Date
FROM Projects
WHERE End_Date<'2025-01-01';

-----ongoing project tasks-----
SELECT Task_ID, Task_Description, Deadline
FROM Project_Tasks
WHERE Status='Ongoing';

-----suppliers in Colombo, Wattala, Jaela-----
SELECT Supplier_Name, Address
FROM Supplier, Supplier_Address
WHERE Supplier.Supplier_ID=Supplier_Address.Supplier_ID
AND (Supplier_Address.Address='Colombo' OR Supplier_Address.Address='Wattala' OR Supplier_Address.Address='Jaela')
GROUP BY Supplier_Name, Address;

-----number of employees in each department-----
SELECT Department_Name, COUNT(Employee_ID) AS Number_Of_Employees
FROM Employee, Department
WHERE Department.Department_ID=Employee.Department_ID
GROUP BY Department_Name;

-----total salary of each department-----
SELECT Department_Name, SUM(Salary) AS Total_Salary 
FROM Department, Employee 
WHERE Employee.Department_ID=Department.Department_ID
GROUP BY Department_Name;

-----departments having salary greater than 250000 and order by the salary descending order-----
SELECT Department_Name, SUM(Salary) AS Total_Salary 
FROM Department, Employee 
WHERE Employee.Department_ID=Department.Department_ID
GROUP BY Department_Name
HAVING SUM(Salary) > 250000
ORDER BY SUM(Salary) DESC; 

-----customers who placed projects with a budget greater than or equal to 5000000 ordered by ascending order-----
SELECT Customer_Name, Project_Name, Budget 
FROM Customer, Projects
WHERE Customer.Customer_ID=Projects.Customer_ID
AND Budget>=5000000
GROUP BY Customer_Name, Project_Name, Budget
ORDER BY Budget; 

-----joining Department table, Department Manager table and Manager table-----
SELECT Department.Department_ID, Department_Name, Manager.Manager_ID
FROM ((Department INNER JOIN Department_Manager ON Department.Department_ID=Department_Manager.Department_ID) 
INNER JOIN Manager ON Manager.Manager_ID=Department_Manager.Manager_ID)
GROUP BY Department.Department_ID, Department_Name, Manager.Manager_ID
ORDER BY Department.Department_ID;

-----joining Customer table and Projects table-----
SELECT Projects.Project_ID, Project_Name, Customer_Name 
FROM Projects INNER JOIN Customer ON Projects.Customer_ID=Customer.Customer_ID 
ORDER BY Projects.Project_ID;

-----joining Projects table, Material table and Quantity Used-----
SELECT Projects.Project_ID, Projects.Project_Name, Material.Material_Name, Quantity_Used.Quantity_Used
FROM ((Projects INNER JOIN Quantity_Used ON Projects.Project_ID=Quantity_Used.Project_ID)
INNER JOIN Material ON Quantity_Used.Material_ID=Material.Material_ID)
GROUP BY Projects.Project_ID, Projects.Project_Name, Material.Material_Name, Quantity_Used.Quantity_Used
ORDER BY Projects.Project_ID, Projects.Project_Name, Material.Material_Name, Quantity_Used.Quantity_Used;

-----creating Owner and grant all permissions for him to control the database-----
CREATE USER Vajira FOR LOGIN Owner;

GRANT CONTROL TO Vajira;

-----create and grant permissions and control for IT Department Manager-----
CREATE USER Niroshan FOR LOGIN ITManager;

GRANT CONTROL TO Niroshan;

-----create and grant permissions for HR Manager-----
CREATE USER Sanduni FOR LOGIN HRManager;

GRANT ALL
ON Department
TO Sanduni;   

GRANT ALL
ON Department_Telephone_No
TO Sanduni;   

GRANT ALL
ON Employee
TO Sanduni;   

GRANT ALL
ON Permanent_Employee
TO Sanduni;  

GRANT ALL
ON Freelanced_Employee
TO Sanduni;   

GRANT ALL
ON Manager
TO Sanduni;   

GRANT ALL
ON Permanent_Employee_Manager
TO Sanduni;   

GRANT ALL
ON Department_Manager
TO Sanduni;   

-----create and grant permissions for Project Manager-----
CREATE USER Nuwan FOR LOGIN ProjectManager;

GRANT ALL
ON Customer
TO Nuwan;   

GRANT ALL
ON Customer_Phone_No
TO Nuwan;

GRANT ALL
ON Projects
TO Nuwan;   

GRANT ALL
ON Project_Tasks
TO Nuwan;   

-----create and grant permissions for Supply Chain Manager-----
CREATE USER Sajith FOR LOGIN SupplyChainManager;

GRANT ALL
ON Supplier
TO Sajith;   

GRANT ALL
ON Supplier_Phone_No
TO Sajith;

GRANT ALL
ON Supplier_Address
TO Sajith;   

GRANT ALL
ON Material
TO Sajith;   

GRANT ALL
ON Supplied_Material
TO Sajith;   

GRANT ALL
ON Quantity_Used
TO Sajith;   

-----create and grant permissions for Construction Manager-----
CREATE USER Tharindu FOR LOGIN ConstructionManager;

GRANT ALL
ON Employee_Assignments
TO Tharindu;   

GRANT ALL
ON Assignment_Hours
TO Tharindu;

-----create and grant permissions to view details about projects for architect-----
CREATE USER Nuwan_Wickramasingha FOR LOGIN Architect;

GRANT SELECT
ON Projects
TO Nuwan_Wickramasingha;   


GRANT SELECT
ON Project_Tasks
TO Nuwan_Wickramasingha;
