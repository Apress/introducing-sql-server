USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'ContactPhoneNumbers')
BEGIN
	DROP TABLE dbo.ContactPhoneNumbers;
END;

GO