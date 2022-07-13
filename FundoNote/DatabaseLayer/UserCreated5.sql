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

--we can use 
select sysDatetime();
--or	
select GetDate();
--to Fetch system time


insert into Users(Firstname,Lastname,Email,password) values('suresh','kumar','suresh@gmail.com','suresh123')

--executing the spAddUser stored procedure
exec spAddUser 'Suresh','kumar','suresh@gmail.com','Suresh@123'

--to get all records from table
select * from Users



----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
----------------------------Note Table ----------------------------------------------

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



	



