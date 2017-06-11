USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.views WHERE [Name] = 'VerifiedContacts')
BEGIN
	DROP VIEW dbo.VerifiedContacts;
END;

GO