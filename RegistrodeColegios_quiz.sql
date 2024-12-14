Create database RegistrodeColegios
go

Use RegistrodeColegios
go


Create table School
(
SchoolId int primary key identity,
SchoolName varchar(50) not null,
Descripcion varchar(1000),
Adress varchar (50),
Phone varchar(50),
PostCode varchar(50),
PostAdress varchar(50)
)


Create table Class
(
ClassId int primary key identity,
SchoolId int foreign key references School(SchoolId) not null, 
ClassName varchar(50) not null,
Descripcion varchar(1000)
)

Create procedure ConsultSchool
@id int 
as 
  Begin
    select SchoolId, SchoolName, Descripcion, Adress, Phone, PostCode, PostAdress from School where SchoolId =@id
  end

create procedure AddSchool
@name Varchar (50),
@descripcion Varchar (1000),
@adress Varchar (50),
@phone Varchar (50),
@postCode Varchar (50),
@postAdress Varchar (50)
as
  begin
   insert into School (SchoolName, Descripcion, Adress, Phone, PostCode, PostAdress) values (@name, @descripcion, @adress, @phone, @postCode, @postAdress)
  end


Create procedure DeleteSchool
@id int
as
  begin
    delete School where SchoolId = @id
  end

create procedure EditSchool
@id int,
@name Varchar (50),
@descripcion Varchar (1000),
@adress Varchar (50),
@phone Varchar (50),
@postCode Varchar (50),
@postAdress Varchar (50)
as
   begin
   update School set  SchoolName = @name, Descripcion = @descripcion, Adress = @adress , Phone = @phone, PostCode = @postCode, PostAdress = @postAdress where SchoolId = @id
  end

Create procedure ConsultClass
@id int 
as
 begin
    select ClassId, SchoolId, ClassName, Descripcion from Class where ClassId = @id
end

Create procedure AddClass
@schoolId int,
@name varchar (50),
@descripcion varchar(1000)
as
   begin 
   insert into Class (SchoolId, ClassName, Descripcion) values (@schoolId, @name, @descripcion)
   end

Create procedure DeleteClass
@id int
as
  begin 
    delete Class where ClassId = @id
  end

create procedure EditClass
@id int,
@schoolId int,
@name varchar(50),
@descripcion varchar (1000)
as
   begin
   update Class set SchoolId = @schoolId, ClassName =@name , Descripcion = @descripcion where ClassId = @id
   end 






