CREATE FUNCTION fn_GetCustomersByCity
(
  @City NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN (
  SELECT * FROM Customers WHERE City = @City
);
