----------------------------------------------------------------------------
------------------------------Stored Procedure for Users --------------------


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


--Created Stored Procedure to Add user
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




--Create Stored Procedure for Login
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


--Store procedure for ForgerPassword
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


--Stored Procedure to Update Password
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


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--------------------------------------For Note ------------------------------------------


--Stored Procedure to Add note
Create procedure spAddNote(
@Title varchar(20), 
@Description varchar(max),
@BgColor varchar(50),
@UserId int
)
As
Begin try
insert into Note(Title,Description,Bgcolor,UserId,IsPin,IsArchive,IsRemainder,IsTrash,ModifiedDate) values(@Title,@Description,@BgColor,@UserId,0,0,0,0,GetDate())
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
exec spAddNote 'aaaa','bbbc','cccc',2;




---Store Procedure for Update Note
Create procedure spUpdateNote(
@Title varchar(20), 
@Description varchar(max),
@BgColor varchar(50),
@UserId int,
@NoteId int,
@IsPin bit,
@IsArchive bit,
@IsTrash bit
)
As
Begin try
Update Note set Title=@Title, Description=@Description,BgColor=@BgColor,UserId=@UserId,IsPin=@IsPin,IsArchive=@IsArchive,IsTrash=@IsTrash,ModifiedDate=GetDate() where UserId=@UserId and NoteId=@NoteId
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



--Stored Procedure for To Get All Notes
Create procedure spGetAllNotes(@UserId int)
As
Begin try
select * from Note where UserId = @UserId and IsTrash=0
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH


create procedure spDeleteNote(@NoteId int,@UserId int)
As
Begin try
Update Note set IsTrash=1 where NoteId=@NoteId and UserId=@UserId
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH




