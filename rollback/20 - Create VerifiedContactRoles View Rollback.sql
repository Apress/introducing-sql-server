USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.views WHERE [Name] = 'VerifiedContactRoles')
BEGIN
	DROP VIEW dbo.VerifiedContactRoles;
END;

GO