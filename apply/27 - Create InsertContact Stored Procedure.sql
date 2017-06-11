USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.procedures WHERE [name] = 'InsertContact')
BEGIN
	DROP PROCEDURE dbo.InsertContact;
END;

GO

CREATE PROCEDURE dbo.InsertContact
(
 @FirstName VARCHAR(40),
 @LastName VARCHAR(40),
 @DateOfBirth DATE,
 @AllowContactByPhone BIT = 0,
 @Notes CONTACTNOTE READONLY,
 @ContactId INT = 0 OUTPUT
)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRANSACTION

INSERT INTO dbo.Contacts(FirstName, LastName, DateOfBirth, AllowContactByPhone) VALUES
	(@FirstName, @LastName, @DateOfBirth, @AllowContactByPhone);

SELECT @ContactId = SCOPE_IDENTITY();

PRINT 'Contact ID inserted: ' + CONVERT(VARCHAR(20), @ContactId);

INSERT INTO dbo.ContactNotes (ContactId, Notes)
	SELECT @ContactId, Note FROM @Notes;

COMMIT TRANSACTION;

SELECT @ContactId AS ContactId;

SET NOCOUNT OFF;

END;

GO