USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertContact')
BEGIN
	DROP PROCEDURE dbo.InsertContact;
END;

GO