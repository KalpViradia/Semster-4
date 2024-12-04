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

exec PR_Department_Insert @DepartmentID = 1, @DepartmentName = 'Admin';
exec PR_Department_Insert @DepartmentID = 2, @DepartmentName = 'IT';
exec PR_Department_Insert @DepartmentID = 3, @DepartmentName = 'HR';
exec PR_Department_Insert @DepartmentID = 4, @DepartmentName = 'Account';

exec PR_Designation_Insert @DesignationID = 11, @DesignationName = 'Jobber';
exec PR_Designation_Insert @DesignationID = 12, @DesignationName = 'Welder';
exec PR_Designation_Insert @DesignationID = 13, @DesignationName = 'Clerk';
exec PR_Designation_Insert @DesignationID = 14, @DesignationName = 'Manager';
exec PR_Designation_Insert @DesignationID = 15, @DesignationName = 'CEO';

exec PR_Person_Insert @FirstName = 'Rahul', @LastName = 'Anshu', @Salary = 56000.00, 
                      @JoiningDate = '1990-01-01', @DepartmentID = 1, @DesignationID = 12;
exec PR_Person_Insert @FirstName = 'Hardik', @LastName = 'Hinsu', @Salary = 18000.00, 
                      @JoiningDate = '1990-09-25', @DepartmentID = 2, @DesignationID = 11;
exec PR_Person_Insert @FirstName = 'Bhavin', @LastName = 'Kamani', @Salary = 25000.00, 
                      @JoiningDate = '1991-05-14', @DepartmentID = Null, @DesignationID = 11;
exec PR_Person_Insert @FirstName = 'Bhoomi', @LastName = 'Patel', @Salary = 39000.00, 
                      @JoiningDate = '2014-02-20', @DepartmentID = 1, @DesignationID = 13;
exec PR_Person_Insert @FirstName = 'Rohit', @LastName = 'Rajgor', @Salary = 17000.00, 
                      @JoiningDate = '1990-07-23', @DepartmentID = 2, @DesignationID = 15;
exec PR_Person_Insert @FirstName = 'Priya', @LastName = 'Mehta', @Salary = 25000.00, 
                      @JoiningDate = '1990-10-18', @DepartmentID = 2, @DesignationID = NULL;
exec PR_Person_Insert @FirstName = 'Neha', @LastName = 'Trivedi', @Salary = 18000.00, 
                      @JoiningDate = '2014-02-20', @DepartmentID = 3, @DesignationID = 15;


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
create or alter proc PR_Department_PersonCount
	@DepartmentName varchar(100)
as
begin
	select Department.DepartmentName, count(Person.PersonID)
	from Department join Person
	on Department.DepartmentID = Person.DepartmentID
	Where Department.DepartmentName = @DepartmentName
end

--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than input salary value along with their department and designation details.
create or alter proc PR_Department_Salary
	@Salary int
as
begin
	select Person.FirstName, Department.DepartmentName, Designation.DesignationName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID join Designation
	on Person.DesignationID = Designation.DesignationID
	where Person.Salary > @Salary
end

--12. Create a procedure to find the department(s) with the highest total salary among all departments.
create or alter proc PR_Department_HighestSalary
as
begin
	select Department.DepartmentID, Department.DepartmentName,sum(Salary) as Total_Salary from Department
	join Person
	on Person.DepartmentID = Department.DepartmentID
	group by Department.DepartmentID,Department.DepartmentName
	having sum(salary) in (select max(Total_Salary) as Max_Salary from (select sum(Salary) as Total_Salary from Person group by DepartmentID) as Salary)
end

--13. Create a procedure that takes a designation name as input and returns a list of all workers under that designation who joined within the last 10 years, along with their department.
create or alter proc PR_Designation_WorkerDetails
	@DesinationName Varchar(100)
as
begin
	select Person.FirstName, Person.JoiningDate, Department.DepartmentName, Designation.DesignationName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID join Designation
	on Person.DesignationID = Designation.DesignationID
	where Designation.DesignationName = @DesinationName and
	Person.JoiningDate > (SELECT dateadd(year, -10, getdate()))
end

--14. Create a procedure to list the number of workers in each department who do not have a designation assigned.
create or alter proc PR_Department_NoDesignation
as
begin
	select Person.FirstName, Department.DepartmentName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID
	where Person.DesignationID is null
end

--15. Create a procedure to retrieve the details of workers in departments where the average salary is above 12000.
create or alter proc PR_Department_AvgSalary
as
begin
	select FirstName, Salary, DepartmentName
	from Person join Department
	on Person.DepartmentID = Department.DepartmentID
	group by Department.DepartmentName,FirstName,salary
	having avg(Person.Salary) > 12000;
end