USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'ContactRoles')
BEGIN
	DROP TABLE dbo.ContactRoles;
END;

GO