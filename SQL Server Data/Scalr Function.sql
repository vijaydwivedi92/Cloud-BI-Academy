-----Function

Create Function fn_GetFullname
(
@Firstname Nvarchar(50),
@LastName Nvarchar(50))
Returns Nvarchar(100)
AS
BEGIN
Return @firstname +''+@lastname
END


SELECT dbo.fn_GetFullname ('John','Doe')
