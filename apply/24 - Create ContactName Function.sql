USE AddressBook;

IF EXISTS(SELECT 1 FROM sys.objects WHERE [name] = 'ContactName' AND [type] = 'FN')
BEGIN
	DROP FUNCTION dbo.ContactName;
END;

GO

CREATE FUNCTION dbo.ContactName 
(
 @FirstName VARCHAR(40),
 @LastName VARCHAR(40)
) RETURNS VARCHAR(80)
AS BEGIN
	DECLARE @FullName VARCHAR(80);

	-- Replace NULL values with empty strings
	SELECT	@FirstName = COALESCE(@FirstName, ''),
			@LastName = COALESCE(@LastName, '');

	-- Capitalize the first letter of the first name and last name
	SELECT	@FirstName = 
			CASE
				WHEN LEN(@FirstName) > 0
					THEN UPPER(LEFT(@FirstName, 1)) + RIGHT(@FirstName, LEN(@FirstName) - 1)
				ELSE @FirstName
			END,
			@LastName = 
			CASE
				WHEN LEN(@LastName) > 0
					THEN UPPER(LEFT(@LastName, 1)) + RIGHT(@LastName, LEN(@LastName) - 1)
				ELSE @LastName
			END;
			

	SELECT @FullName = @FirstName + ' ' + @LastName;

	RETURN @FullName;
END;
GO