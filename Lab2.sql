-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);

--From the above given tables create Stored Procedures:

--Part – A
--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
create or alter procedure PR_Department_Insert
	@DepartmentID int,
	@DepartmentName varchar(100)
as
begin
	insert into Department (DepartmentID, DepartmentName)
	values (@DepartmentID, @DepartmentName)
end

create or alter procedure PR_Designation_Insert
	@DesignationID int,
	@DesignationName varchar(100)
as
begin
	insert into Designation(DesignationID, DesignationName)
	values (@DesignationID, @DesignationName)
end

create or alter procedure PR_Person_Insert
	@FirstName varchar(100),
	@LastName varchar(100),
	@Salary decimal(8, 2),
	@JoiningDate datetime,
	@DepartmentID int,
	@DesignationID int
as
begin
	insert into Person (FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID)
	values (@FirstName, @LastName, @Salary, @JoiningDate, @DepartmentID, @DesignationID)
end

create or alter procedure PR_Department_Update
	@DepartmentID int,
	@DepartmentName varchar(100)
as
begin
	update Department
	set DepartmentName = @DepartmentName
	where DepartmentID = @DepartmentID
end

create or alter procedure PR_Designation_Update
	@DesignationID int,
	@DesignationName varchar(100)
as
begin
	update Designation
	set DesignationName = @DesignationName
	where DesignationID = @DesignationID
end

create or alter procedure PR_Person_Update
	@PersonID int,
	@FirstName varchar(100),
	@LastName varchar(100),
	@Salary decimal(8, 2),
	@JoiningDate datetime,
	@DepartmentID int,
	@DesignationID int
as
begin
	update Person
	set FirstName = @FirstName, LastName = @LastName, Salary = @Salary, JoiningDate = @JoiningDate, DepartmentID = @DepartmentID, DesignationID = @DesignationID
	where PersonID = @PersonID
end

create or alter procedure PR_Department_Delete
	@DepartmentID int
as
begin
	delete from Department
	where DepartmentID = @DepartmentID
end

create or alter procedure PR_Designation_Delete
	@DesignationID int
as
begin
	delete from Designation
	where DesignationID = @DesignationID
end

create or alter procedure PR_Person_Delete
	@PersonID int
as
begin
	delete from Person
	where PersonID = @PersonID
end

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY
create or alter proc PR_Department_SelectByPrimaryKey
	@DepartmentID int
as
begin
	select * from Department where DepartmentID = @DepartmentID
end

create or alter proc PR_Designation_SelectByPrimaryKey
	@DesignationID int
as
begin
	select * from Designation where DesignationID = @DesignationID
end

create or alter proc PR_Person_SelectByPrimaryKey
	@PersonID int
as
begin
	select * from Person where PersonID = @PersonID
end

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take
--columns on select list)
create or alter proc PR_Department_Display
as
begin
	select * from Department
end

create or alter proc PR_Designation_Display
as
begin
	select * from Designation
end

create or alter proc PR_Person_Display
as
begin
	select * from Person join Department 
	on Person.DepartmentID = Department.DepartmentID join Designation 
	on Person.DesignationID = Designation.DesignationID
end

--4. Create a Procedure that shows details of the first 3 persons.
create or alter proc PR_Person_DetailsOfFirst3Person
as
begin
	select top 3 * from Person
end

--Part – B
--5. Create a Procedure that takes the department name as input and returns a table with all workers working in that department.
create or alter proc PR_Department_DepartmentWiseWorkers
	@DepartmentName varchar(100)
as
begin
	select Department.DepartmentName, Person.FirstName
	from Department join Person
	on Department.DepartmentID = Person.DepartmentID
	where DepartmentName = @DepartmentName
end

--6. Create Procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name.
create or alter proc PR_Department_WorkerDetail
	@DepartmentName varchar(100),
	@DesignationName varchar(100)
as
begin
	select Person.FirstName, Person.Salary, Person.JoiningDate, Department.DepartmentName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID join Designation
	on Person.DesignationID = Designation.DesignationID
	where Department.DepartmentName = @DepartmentName and Designation.DesignationName = @DesignationName
end

--7. Create a Procedure that takes the first name as an input parameter and display all the details of the worker with their department & designation name.
create or alter proc PR_Person_WorkerDetail
	@FirstName varchar(100)
as
begin
	select Person.PersonID, Person.FirstName, Person.LastName, Person.Salary, Person.JoiningDate, Department.DepartmentName, Designation.DesignationName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID join Designation
	on Person.DesignationID = Designation.DesignationID
	where Person.FirstName = @FirstName
end

--8. Create Procedure which displays department wise maximum, minimum & total salaries.
create or alter proc PR_Department_DepartmentWiseSalary
as
begin
	select Department.DepartmentName, max(Person.Salary) as Max_Salary, min(Person.Salary) as Min_Salary, sum(Person.Salary) as Total_Salary
	from Department join Person
	on Department.DepartmentID = Person.DepartmentID
	group by Department.DepartmentName
end

--9. Create Procedure which displays designation wise average & total salaries.
create or alter proc PR_Designation_AvgSalary
as
begin
	select Designation.DesignationName, avg(Person.Salary) as Avg_Salary
	from Designation join Person
	on Designation.DesignationID = Person.DesignationID
	group by Designation.DesignationName
end

--Part – C
--10. Create Procedure that Accepts Department Name and Returns Person Count.
--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than
--input salary value along with their department and designation details.
--12. Create a procedure to find the department(s) with the highest total salary among all departments.
--13. Create a procedure that takes a designation name as input and returns a list of all workers under that
--designation who joined within the last 10 years, along with their department.
--14. Create a procedure to list the number of workers in each department who do not have a designation
--assigned.
--15. Create a procedure to retrieve the details of workers in departments where the average salary is above
--12000.