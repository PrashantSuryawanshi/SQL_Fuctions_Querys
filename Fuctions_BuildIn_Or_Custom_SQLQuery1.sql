--Fuctions
--Build in fuctions
--Customer Defind Fuctions

--------------------(1)Build In FUCNTIONS IN SQL----------------------------

--We have 'networking' we want 'working' name frome column so write SUBSTRING Query

select SUBSTRING(designation,1,3)as Test from EmployeeTable where id=104

--'CONCAT' used to two name add

select CONCAT(ename,'  ',designation) as ConcatData from EmployeeTable

--'len' used to count length of given column name string

select ename, len(ename) as 'length of name' from EmployeeTable

--'Rtrim' remove right space
--'Ltrim' remove right space

select Rtrim(ename) from EmployeeTable where id=113
select Ltrim(ename) from EmployeeTable where id=113

--remove space from left and right side

select trim(ename) from EmployeeTable

--REVERSE used to reverse string

select REVERSE(ename) from EmployeeTable

--REPLACE string alphabate given name

select*from EmployeeTable

select REPLACE(ename,'v','t') from EmployeeTable where id=104

-- instr is used to find the occourance of given char in a string

select charindex('i',ename) from EmployeeTable where id=104

--User defined functions in SQL
create function Addition(@a int,@b int)
returns int
as 
begin
declare @c int
set @c=@a+@b
return @c
end

select dbo.Addition(10,20) as result

---------Task Even Or Odd-----

create function EvenOrOdd(@num int)
returns varchar(10)
as begin
declare @functionIs varchar(10)
set @functionIs = ''
if( @num%2=0)
 set @functionIs='Even' 
else
 set @functionIs='odd'
return @functionIs
end

select dbo.EvenOrOdd(3) as result

--record set / returns the table / table valued function
create function getAllEmp(@id int)
returns table
as
return (select * from EmployeeTable where id=@id)
end
select * from TsystemDB.dbo.getallemp(103);

--scalar function
create function getnamefromemp2()
returns varchar(50)
as
begin
return (select ename from EmployeeTable where id=103)
end;

select TsystemDB.dbo.getnamefromemp2() as ename;

----------Task Find Greater Then or Less Then value using Gucntion

alter FUNCTION is_greater
	( 
		@a AS INT,
		@b AS INT
	)
	RETURNS VARCHAR(30)
	AS
	BEGIN
	RETURN( 'A is ' + 
	CASE
		-- Case 1
		WHEN @a > @b THEN 'Greater than'
		-- Case 2
		WHEN @a < @b THEN 'Smaller than'
		ELSE 'Equal to'
	END
	+ ' B')
	END;

select dbo.is_greater(23,33) as result;