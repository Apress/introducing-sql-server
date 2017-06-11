USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.objects WHERE [name] = 'ContactName' AND [type] = 'FN')
BEGIN
	DROP FUNCTION dbo.ContactName;
END;

GO