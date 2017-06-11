USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'ContactAddresses')
BEGIN
	DROP TABLE dbo.ContactAddresses;
END;

GO