--AFTER Trigger

--EmployeeDetails
CREATE TABLE EMPLOYEEDETAILS (
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
);

--EmployeeLogs
CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);

--1. Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to display the message "Employee record inserted", "Employee record updated", "Employee record deleted"
CREATE OR ALTER TRIGGER TR_AfterEmployeeChange
ON EmployeeDetails
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        PRINT 'Employee record inserted';
    END
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        IF (SELECT COUNT(*) FROM inserted) = 0
        BEGIN
            PRINT 'Employee record deleted';
        END
        ELSE
        BEGIN
            PRINT 'Employee record updated';
        END
    END
END;

--2. Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to log all operations into the EmployeeLog table.
CREATE OR ALTER TRIGGER TR_LogEmployeeOperations
ON EmployeeDetails
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Action VARCHAR(100), @EmployeeID INT, @EmployeeName VARCHAR(100);
    
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SET @Action = 'Inserted';
        SELECT @EmployeeID = EmployeeID, @EmployeeName = EmployeeName FROM inserted;
    END
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        IF @Action = 'Inserted'
        BEGIN
            SET @Action = 'Updated';
        END
        ELSE
        BEGIN
            SET @Action = 'Deleted';
            SELECT @EmployeeID = EmployeeID, @EmployeeName = EmployeeName FROM deleted;
        END
    END

    INSERT INTO EmployeeLogs (EmployeeID, EmployeeName, ActionPerformed, ActionDate)
    VALUES (@EmployeeID, @EmployeeName, @Action, GETDATE());
END;

--3. Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary) for new employees and update a bonus column in the EmployeeDetails table.
CREATE OR ALTER TRIGGER TR_CalculateJoiningBonus
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
    DECLARE @EmployeeID INT, @Salary DECIMAL(10,2), @Bonus DECIMAL(10,2);
    
    SELECT @EmployeeID = EmployeeID, @Salary = Salary FROM inserted;
    
    SET @Bonus = @Salary * 0.10;
    
    UPDATE EmployeeDetails
    SET Salary = @Bonus
    WHERE EmployeeID = @EmployeeID;
END;

--4. Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL during an INSERT operation.
CREATE OR ALTER TRIGGER TR_SetJoiningDateIfNull
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
    DECLARE @JoiningDate DATETIME,@EID INT
	SELECT @JoiningDate = JoiningDate, @EID = EmployeeID FROM inserted

	IF(@JoiningDate IS NULL)
	BEGIN
		UPDATE EmployeeDetails
		SET @JoiningDate = GETDATE()
		WHERE EmployeeID = @EID
	End
END;

--5. Create a trigger that ensure that ContactNo is valid during insert and update (Like ContactNo length is 10)
CREATE OR ALTER TRIGGER TR_ValidateContactNo
ON EmployeeDetails
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE LEN(ContactNo) != 10)
    BEGIN
        PRINT 'ContactNo must be 10 digits long.';
    END
END;

--Instead of Trigger

--Movies
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);

--MoviesLog
CREATE TABLE MoviesLog (
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);

--1. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table. For that, log all operations performed on the Movies table into MoviesLog.
CREATE OR ALTER TRIGGER TR_InsteadOfMoviesOperations
ON Movies
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Action VARCHAR(100), @MovieID INT, @MovieTitle VARCHAR(255);
    
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SET @Action = 'Inserted';
        SELECT @MovieID = MovieID, @MovieTitle = MovieTitle FROM inserted;
    END
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        IF @Action = 'Inserted'
        BEGIN
            SET @Action = 'Updated';
        END
        ELSE
        BEGIN
            SET @Action = 'Deleted';
            SELECT @MovieID = MovieID, @MovieTitle = MovieTitle FROM deleted;
        END
    END

    INSERT INTO MoviesLog (MovieID, MovieTitle, ActionPerformed, ActionDate)
    VALUES (@MovieID, @MovieTitle, @Action, GETDATE());

    -- Perform actual operation after logging (if needed)
    IF @Action = 'Inserted'
    BEGIN
        INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
        SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted;
    END
    ELSE IF @Action = 'Updated'
    BEGIN
        UPDATE Movies
        SET MovieTitle = inserted.MovieTitle,
            ReleaseYear = inserted.ReleaseYear,
            Genre = inserted.Genre,
            Rating = inserted.Rating,
            Duration = inserted.Duration
        FROM inserted WHERE Movies.MovieID = inserted.MovieID;
    END
    ELSE IF @Action = 'Deleted'
    BEGIN
        DELETE FROM Movies WHERE MovieID = deleted.MovieID;
    END
END;

--2. Create a trigger that only allows to insert movies for which Rating is greater than 5.5 .
CREATE OR ALTER TRIGGER TR_ValidateMovieRating
ON Movies
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Rating <= 5.5)
    BEGIN
        PRINT 'Movie Rating must be greater than 5.5.';
    END
    ELSE
    BEGIN
        INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
        SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted;
    END
END;

--3. Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table.
CREATE OR ALTER TRIGGER TR_PreventDuplicateMovieTitle
ON Movies
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE MovieTitle IN (SELECT MovieTitle FROM Movies))
    BEGIN
        PRINT 'Movie title already exists in the Movies table.';
        INSERT INTO MoviesLog (MovieTitle, ActionPerformed, ActionDate)
        SELECT MovieTitle, 'Duplicate Insert Attempt', GETDATE() FROM inserted;
    END
    ELSE
    BEGIN
        INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
        SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted;
    END
END;

--4. Create trigger that prevents to insert pre-release movies.
CREATE OR ALTER TRIGGER TR_PreventPreReleaseMovies
ON Movies
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE ReleaseYear < YEAR(GETDATE()))
    BEGIN
        PRINT 'Cannot insert pre-release movies.';
    END
    ELSE
    BEGIN
        INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
        SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted;
    END
END;

--5. Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater than 120 minutes (2 hours) to prevent unrealistic entries.
CREATE OR ALTER TRIGGER TR_ValidateMovieDuration
ON Movies
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Duration > 120)
    BEGIN
        PRINT 'Movie duration cannot be greater than 120 minutes.';
    END
    ELSE
    BEGIN
        UPDATE Movies
        SET MovieTitle = inserted.MovieTitle,
            ReleaseYear = inserted.ReleaseYear,
            Genre = inserted.Genre,
            Rating = inserted.Rating,
            Duration = inserted.Duration
        FROM inserted WHERE Movies.MovieID = inserted.MovieID;
    END
END;