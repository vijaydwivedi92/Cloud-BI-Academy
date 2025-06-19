

---All Empoyees
Create Procedure GetAllEmployees
AS
BEGIN
SELECT * FROM Employees
End


Exec GetAllEmployees


---Case 2  with Input Parameter
CREATE Procedure GETEmployeeById
@EmpID Int---i/o 
AS
BEGIN
SELECT * FROM Employees where EmployeeID=@EmpID
End

Exec GETEmployeeById 999

--Case 3 
Create Proc UpdateEmployeeSalary
@EmpId int,
@newSalary Decimal(10,2)
AS
BEGIN
Update Employees
Set Salary=@newsalary
Where Employeeid=@EmpID
ENd

Exec UpdateEmployeeSalary 105,88000


SELECT * FROM Employees


--Case 3 Get Employee count outputparment
CREATE PROC GetEmployeecountByDept
@DeptName Varchar(30) --Input
,@EmpCount INT Output
AS
BEGIN
Select @empcount =Count(*) from Employees where department =@DeptName
ENd

Declare @total int
Exec GetEmployeecountByDept 'sales', @Total Output
PRint @total


--Try Catch

CREATE PRoc InsertEmployee
@empid int,
@name Varchar(100)
,@dept Varchar(50)
,@JobTittle varchar(10)
,@Salary Decimal (10,2)

AS
BEGIn
BEGIN try
insert into employees (Employeeid, name, department,jobtitle,
Salary)
values(@empid ,@name ,@dept ,@JobTittle ,@Salary)
END try
 BEGIN CATCH  
      PRINT 'Error: ' + ERROR_MESSAGE();  
   END CATCH  

End

EXEC InsertEmployee 
   @EmpID = 106, 
   @Name = 'Frank Turner', 
   @Dept = 'Finance', 
  @JobTittle = 'Analyst', 
   @Salary = 64000;

   Exec GetAllEmployees


   ---case 4
   alter PROCEDURE GetSalaryReport  
   @DeptName VARCHAR(50) = NULL  
AS  
BEGIN  
   IF @DeptName IS NULL  
   BEGIN  
      SELECT Department, SUM(Salary) AS TotalSalary  
      FROM Employees GROUP BY Department;  
   END  
   ELSE  
   BEGIN  
      SELECT Department, SUM(Salary) AS TotalSalary  
      FROM Employees  
      WHERE Department = @DeptName  
      GROUP BY Department;  
   END  
END;


EXEC GetSalaryReport;

EXEC GetSalaryReport @DeptName = 'sales';



Drop Proc GetSalaryReport








