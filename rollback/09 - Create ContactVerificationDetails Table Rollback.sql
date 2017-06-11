USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'ContactVerificationDetails')
BEGIN
	DROP TABLE dbo.ContactVerificationDetails;
END;

GO