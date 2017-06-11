USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'Roles')
BEGIN
	DROP TABLE dbo.Roles;
END;

GO