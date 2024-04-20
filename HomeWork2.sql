

use Course



create table Students(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [Surname] nvarchar(50),
    [Age] int,
    [Email] nvarchar(100),
    [Address] nvarchar(100)
)

select * from Students



create table StudentArchives (
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50),
    [Surname] nvarchar(50),
    [Age] int,
    [Email] nvarchar(100),
    [Address] nvarchar(100)
)


select * from StudentArchives



create trigger trg_addStudentArchive on Students
after delete
as
begin
	insert into StudentArchives([Name],[Surname],[Age],[Email],[Address])
	select [Name],[Surname],[Age],[Email],[Address] from deleted
end



create procedure usp_deleteStudent
@studentId int 
as
begin 
	delete from Students where [Id] = @studentId
end



exec usp_deleteStudent 2



select * from StudentArchives
select * from Students



