USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.types WHERE [name] = 'ContactNote')
BEGIN
	DROP TYPE dbo.ContactNote
END;

CREATE TYPE dbo.ContactNote
AS TABLE
(ContactId INT, Note VARCHAR(200));

GO