USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.objects WHERE [name] = 'ContactCounts' AND [type] = 'TF')
BEGIN
	DROP FUNCTION dbo.ContactCounts;
END;

GO