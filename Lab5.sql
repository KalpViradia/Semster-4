-- Creating PersonInfo Table
CREATE TABLE PersonInfo (
 PersonID INT PRIMARY KEY,
 PersonName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8,2) NOT NULL,
 JoiningDate DATETIME NULL,
 City VARCHAR(100) NOT NULL,
 Age INT NULL,
 BirthDate DATETIME NOT NULL
);
-- Creating PersonLog Table
CREATE TABLE PersonLog (
 PLogID INT PRIMARY KEY IDENTITY(1,1),
 PersonID INT NOT NULL,
 PersonName VARCHAR(250) NOT NULL,
 Operation VARCHAR(50) NOT NULL,
 UpdateDate DATETIME NOT NULL,
);

--From the above given tables perform the following queries:
--Part – A
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display a message “Record is Affected.”
CREATE TRIGGER tr_DisplayMessage
ON PersonInfo
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    PRINT 'Record is Affected.'
END;

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog.
CREATE TRIGGER tr_LogOperations
ON PersonInfo
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'INSERT', GETDATE()
        FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'DELETE', GETDATE()
        FROM deleted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'UPDATE', GETDATE()
        FROM inserted;
    END
END;

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog.
CREATE TRIGGER tr_InsteadLogOperations
ON PersonInfo
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'INSERT', GETDATE()
        FROM inserted;
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'DELETE', GETDATE()
        FROM deleted;
    END

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate)
        SELECT PersonID, PersonName, 'UPDATE', GETDATE()
        FROM inserted;
    END
END;

--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into uppercase whenever the record is inserted.
CREATE TRIGGER tr_UppercaseName
ON PersonInfo
AFTER INSERT
AS
BEGIN
    UPDATE PersonInfo
    SET PersonName = UPPER(PersonName)
    WHERE PersonID IN (SELECT PersonID FROM inserted);
END;

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
CREATE TRIGGER tr_PreventDuplicateName
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM PersonInfo
        WHERE PersonName IN (SELECT PersonName FROM inserted)
    )
    BEGIN
        RAISERROR ('Duplicate PersonName is not allowed.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
        SELECT PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate
        FROM inserted;
    END
END;

--6. Create trigger that prevent Age below 18 years.
CREATE TRIGGER tr_PreventUnderage
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Age < 18
    )
    BEGIN
        RAISERROR ('Age must be 18 or older.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
        SELECT PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate
        FROM inserted;
    END
END;

--Part – B
--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update that age in Person table.
CREATE TRIGGER tr_CalculateAge
ON PersonInfo
AFTER INSERT
AS
BEGIN
    UPDATE PersonInfo
    SET Age = DATEDIFF(YEAR, BirthDate, GETDATE())
    WHERE PersonID IN (SELECT PersonID FROM inserted);
END;

--8. Create a Trigger to Limit Salary Decrease by a 10%.
CREATE TRIGGER tr_LimitSalaryDecrease
ON PersonInfo
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.PersonID = d.PersonID
        WHERE i.Salary < d.Salary * 0.9
    )
    BEGIN
        RAISERROR ('Salary decrease is limited to 10%.', 16, 1);
        UPDATE p
        SET p.Salary = d.Salary
        FROM PersonInfo p
        JOIN deleted d ON p.PersonID = d.PersonID
        WHERE p.PersonID = d.PersonID;
    END
END;

--Part – C
--9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL during an INSERT.
CREATE TRIGGER tr_DefaultJoiningDate
ON PersonInfo
AFTER INSERT
AS
BEGIN
    UPDATE PersonInfo
    SET JoiningDate = GETDATE()
    WHERE JoiningDate IS NULL AND PersonID IN (SELECT PersonID FROM inserted);
END;

--10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints ‘Record deleted successfully from PersonLog’.
CREATE TRIGGER tr_DeleteMessage
ON PersonLog
AFTER DELETE
AS
BEGIN
    PRINT 'Record deleted successfully from PersonLog.'
END;
