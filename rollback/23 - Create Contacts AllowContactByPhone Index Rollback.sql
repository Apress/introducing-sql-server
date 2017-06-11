USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.indexes WHERE [name] = 'IX_NC_Contacts_AllowContactByPhone')
BEGIN
	DROP INDEX IX_NC_Contacts_AllowContactByPhone ON dbo.Contacts;
END;

GO