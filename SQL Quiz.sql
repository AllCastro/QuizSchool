
CREATE DATABASE Schoolquiz;
GO


USE Schoolquiz;
GO


CREATE TABLE School 
( 
    SchoolId INT IDENTITY(1,1) PRIMARY KEY, 
    SchoolName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    Address VARCHAR(50),
    Phone VARCHAR(50),
    PostCode VARCHAR(50),
    PostAddress VARCHAR(50)
);
GO


CREATE TABLE Class
( 
    ClassId INT PRIMARY KEY,
    SchoolId INT NOT NULL,
    ClassName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES School (SchoolId)
);
GO


CREATE PROCEDURE Consulta 
    @id INT
AS
BEGIN
    SELECT * FROM School WHERE SchoolId = @id;
END;
GO


CREATE PROCEDURE Insertar
    @SchoolName VARCHAR(50),
    @Description VARCHAR(1000),
    @Address VARCHAR(50),
    @Phone VARCHAR(50),
    @PostCode VARCHAR(50),
    @PostAddress VARCHAR(50)
AS
BEGIN
    INSERT INTO School (SchoolName, Description, Address, Phone, PostCode, PostAddress) 
    VALUES (@SchoolName, @Description, @Address, @Phone, @PostCode, @PostAddress);
END;
GO



EXEC Insertar 'Hispanoamericana', 'Cede Llorente', 'Heredia', '74750776', '40506', '40500';
GO


CREATE PROCEDURE modificarSchool
    @SchoolId INT,
    @SchoolName VARCHAR(50),
    @Description VARCHAR(1000),
    @Address VARCHAR(50),
    @Phone VARCHAR(50),
    @PostCode VARCHAR(50),
    @PostAddress VARCHAR(50)
AS
BEGIN
    UPDATE School 
    SET SchoolName = @SchoolName, 
        Description = @Description, 
        Address = @Address, 
        Phone = @Phone, 
        PostCode = @PostCode,
        PostAddress = @PostAddress
    WHERE SchoolId = @SchoolId;
END;
GO


CREATE PROCEDURE borrarSchool
    @SchoolId INT
AS
BEGIN
    DELETE FROM School WHERE SchoolId = @SchoolId;
END;
GO


CREATE PROCEDURE ConsultaClass 
    @id INT
AS
BEGIN
    SELECT * FROM Class WHERE ClassId = @id;
END;
GO

CREATE PROCEDURE InsertarClass
    @SchoolId INT,
    @ClassName VARCHAR(50),
    @Description VARCHAR(1000)
AS
BEGIN
    INSERT INTO Class (SchoolId, ClassName, Description) 
    VALUES (@SchoolId, @ClassName, @Description);
END;
GO


EXEC InsertarClass 1, 'Matemáticas', 'Clase II de matemáticas';
GO


CREATE PROCEDURE modificarClass
    @ClassId INT,
    @SchoolId INT,
    @ClassName VARCHAR(50),
    @Description VARCHAR(1000)
AS
BEGIN
    UPDATE Class 
    SET SchoolId = @SchoolId, 
        ClassName = @ClassName, 
        Description = @Description
    WHERE ClassId = @ClassId;
END;

GO


CREATE PROCEDURE borrarClass
    @ClassId INT
AS
BEGIN
    DELETE FROM Class WHERE ClassId = @ClassId;
END;
GO


