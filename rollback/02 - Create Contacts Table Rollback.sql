USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables where [Name] = 'Contacts')
BEGIN
	DROP TABLE dbo.Contacts;
END;

GO