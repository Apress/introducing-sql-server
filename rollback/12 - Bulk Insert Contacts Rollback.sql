USE AddressBook;

DELETE FROM dbo.Contacts;
DBCC CHECKIDENT('dbo.Contacts', RESEED, 1);

GO