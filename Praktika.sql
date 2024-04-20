use Course418


select [FullName] from Teachers
union
select [FullName] from Students



select [FullName] from Teachers
union all
select [FullName] from Students



select [FullName] from Teachers
intersect
select [FullName] from Students



select [FullName] from Teachers
except
select [FullName] from Students


create table Doctors(
    [Id] int primary key identity (1,1),
    [Name] nvarchar(50),
    [Address] nvarchar(100)
)


delete from Doctors


truncate table Doctors


select * from Students



select count(*) as 'Count' , Age from Students
group by Age 
order by Age DESC



declare @Count int = 1 
while (@Count <=10 )
BEGIN
    print 'The counter value is = ' + convert(varchar , @Count)
    set @Count = @Count + 1 
END



select getdate()



create table StudentLogs(
    [Id] int primary key identity(1,1),
    [StudentId] int,
    [Operation] nvarchar(20),
    [Date] datetime 
)


create table EmployeeLogs(
    [Id] int primary key identity(1,1),
    [EmployeeName] nvarchar(50),
    [OldEmail] nvarchar(100),
    [NewEmail] nvarchar(100),
    [Operation] nvarchar(20),
    [Date] datetime 
)

create trigger trg_writeLogAfterEditEmail on Employees
after UPDATE
as
BEGIN
    declare @oldEmail nvarchar(200) = (select [Email] from deleted)
    declare @fullName nvarchar(200) = (select [Name] from deleted)
    declare @newEmail nvarchar(200) = (select [Email] from inserted)
    insert into EmployeeLogs([EmployeeName],[OldEmail],[NewEmail],[Operation],[Date])
    values (@fullName,@oldEmail,@newEmail,'Update',getdate())
END


update Employees
set [Email] = 'salam@mail.ru'
where [Id]=6

select * from EmployeeLogs
select * from Employees


-- create trigger trg_writeLogAfterCreate on Students
-- after insert
-- as  
-- begin
--     insert into StudentLogs([StudentId],[Operation],[Date])
--     select [Id],'Insert',GETDATE() from inserted
-- end


-- insert into Students([FullName],[Address],[Age],[Email],[CityId])
-- values ('Omer Elesgerli' , 'omer@mail.ru',16,'Xetai',1)


select * from Students

select * from StudentLogs


-- create trigger trg_writeLogAfterEdit on Students
-- after update
-- as  
-- begin
--     insert into StudentLogs([StudentId],[Operation],[Date])
--     select [Id],'Update',GETDATE() from deleted
-- end;



-- update  Students
-- set [Email] = 'test@mail.com'
-- where [Id] = 13


-- select * from StudentLogs where [Operation]= 'Update'
-- order by [Date] desc



-- create trigger trg_writeLogAfterEditEmail on Students
-- after update
-- as  
-- begin
--     insert into StudentLogs([StudentId],[Operation],[Date])
--     select [Id],'Update',GETDATE() from deleted
-- end;




