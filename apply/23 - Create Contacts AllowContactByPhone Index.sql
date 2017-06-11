USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.indexes WHERE [Name] = 'IX_NC_Contacts_AllowContactByPhone')
BEGIN
	DROP INDEX IX_NC_Contacts_AllowContactByPhone ON dbo.Contacts;
END;

CREATE NONCLUSTERED INDEX IX_NC_Contacts_AllowContactByPhone 
	ON dbo.Contacts (AllowContactByPhone)
	INCLUDE (ContactId, FirstName, LastName)
	WHERE AllowContactByPhone = 1;

GO