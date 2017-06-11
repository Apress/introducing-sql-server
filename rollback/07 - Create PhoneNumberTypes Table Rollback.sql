USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'PhoneNumberTypes')
BEGIN
	DROP TABLE dbo.PhoneNumberTypes;
END;

GO