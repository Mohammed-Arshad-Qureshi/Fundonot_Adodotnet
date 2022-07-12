--DataBase Create
Create DataBase Fundonotes
-- Using the Database
use Fundonotes


-- Creating table Users in Fundonotes Database
Create table Users(
UserId int identity(1,1) primary key,
Firstname varchar(50),
Lastname varchar(50),
Email varchar(50) unique,
password varchar(100),
CreatedDate datetime default GetDate(),
modifiedDate datetime default GetDate(),
)

drop table Users


--we can use 
select sysDatetime();
--or	
select GetDate();
--to Fetch system time


insert into Users(Firstname,Lastname,Email,password) values('suresh','kumar','suresh@gmail.com','suresh123')


--Created Stored Procedure to get all records
create procedure spGetAllUser
As
Begin try
select * from Users
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH

exec spGetAllUser

Drop procedure sp_AddUser


--Created Stored Procedure
create procedure spAddUser(
@Firstname varchar(50), 
@Lastname varchar(50),
@Email varchar(50),
@password varchar(100)
)
As
Begin try
insert into Users(Firstname,Lastname,Email,password) values(@Firstname,@Lastname,@Email,@password)
--select * from Users where Email=@Email
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH


--executing the spAddUser stored procedure
exec spAddUser 'Suresh','kumar','suresh@gmail.com','Suresh@123'

--to get all records from table
select * from Users


---------------------------------------------
--Another table 
--select * from userSignup



----Inserting Data
--Alter procedure spAddUserDetails(
--@Firstname varchar(20), 
--@Lastname varchar(20),
--@PhoneNo bigint,
--@Address varchar(50),
--@Email varchar(50),
--@Password varchar(100),
--@CPassword varchar(100)

--)
--As
--Begin try
--insert into userSignup(Firstname,Lastname,PhoneNo,Address,Email,Password,CPassword,ModifiedDate) values(@Firstname,@Lastname,@PhoneNo,@Address,@Email,@Password,@CPassword,SYSDATETIME())
----select * from Users where Email=@Email
--end try
--Begin catch
--SELECT 
--	ERROR_NUMBER() AS ErrorNumber,
--	ERROR_STATE() AS ErrorState,
--	ERROR_PROCEDURE() AS ErrorProcedure,
--	ERROR_LINE() AS ErrorLine,
--	ERROR_MESSAGE() AS ErrorMessage;
--END CATCH

--exec spAddUserDetails 'Yaswant','Kumar',8879865596,'Arku','yaswanth123@gmail.com','Yaswanth@123','Yaswanth@123'


--create procedure spGetAllUserSignup
--As
--Begin try
--select * from userSignup
--end try
--Begin catch
--SELECT 
--	ERROR_NUMBER() AS ErrorNumber,
--	ERROR_STATE() AS ErrorState,
--	ERROR_PROCEDURE() AS ErrorProcedure,
--	ERROR_LINE() AS ErrorLine,
--	ERROR_MESSAGE() AS ErrorMessage;
--END CATCH

--exec spGetAllUSerSignup



Create procedure spLoginUser(
@Email varchar(50),
@Password varchar(50)
)
As
Begin try
select * from Users where Email=@Email and password = @Password
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH

exec spLoginUser 'arshad@gmail.com' ,'Arshad@123'

--select * from userSignup
--truncate table userSignup
select * from Users

drop table note
drop proc spAddNote

Create procedure spForgetPasswordUser(
@Email varchar(50)
)
As
Begin try
select * from Users where Email=@Email 
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH

exec spForgetPasswordUser 'arshad@gmail.com'


Create procedure spResetPassword(
@Email varchar(50),
@Password varchar(50)
)
As
Begin try
select * from Users where Email=@Email 
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH

sp_helptext spAddNote





exec spAddNote 'aaaa','bbbc','cccc',2;
Create procedure spAddNote(
@Title varchar(20), 
@Description varchar(max),
@BgColor varchar(50),
@UserId int
)
As
Begin try
insert into Note(Title,Description,Bgcolor,UserId,ModifiedDate) values(@Title,@Description,@BgColor,@UserId,GetDate())
Select * from Note where UserId = @UserId
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH




create table Note(
NoteId int identity(1,1) primary key,
Title varchar(20) not null,
Description varchar(max) not null,
Bgcolor varchar(50) not null,
IsPin bit,
IsArchive bit,
IsRemainder bit,
IsTrash bit,
UserId int not null foreign key references Users(UserId),
RegisteredDate datetime default GETDATE(),
Remainder datetime,
ModifiedDate datetime null
)
select * from Note

	



