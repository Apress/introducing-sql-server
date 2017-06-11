USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'ContactNotes')
BEGIN
	DROP TABLE dbo.ContactNotes;
END;

GO