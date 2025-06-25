CREATE FUNCTION fn_ActiveCustomersWithEmail()
RETURNS @Result TABLE (
  CustomerID INT,
  FullName NVARCHAR(100),
  Email NVARCHAR(100)
)
AS
BEGIN
  INSERT INTO @Result
  SELECT CustomerID, FirstName + ' ' + LastName, Email
  FROM Customers
  WHERE Email IS NOT NULL;

  RETURN;
END;


SELECT * FROM dbo.fn_ActiveCustomersWithEmail();
