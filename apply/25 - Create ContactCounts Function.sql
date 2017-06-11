USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.objects WHERE [name] = 'ContactCounts' AND [type] = 'TF')
BEGIN
	DROP FUNCTION dbo.ContactCounts
END;

GO

-- Table-Valued function to return contact record counts
-- Acceptable values for @TableName are All, ContactAddresses, ContactNotes,
-- ContactPhoneNumbers, and ContactRoles.
CREATE FUNCTION dbo.ContactCounts
(
 @ContactId INT,
 @TableName VARCHAR(40)
)
RETURNS @CountsTable TABLE 
(
 ContactId INT, 
 AddressCount INT,
 NoteCount INT,
 PhoneNumberCount INT,
 RoleCount INT
)
AS BEGIN
	-- Variables to hold the counts
	DECLARE @AddressCount INT,
			@NoteCount INT,
			@PhoneNumberCount INT,
			@RoleCount INT;

	-- Return address count
	IF (@TableName IN ('All', 'ContactAddresses'))
	BEGIN
		SELECT @AddressCount = COUNT(1)
		FROM dbo.ContactAddresses AS CA
		WHERE CA.ContactId = @ContactId;
	END;

	-- Return note count
	IF (@TableName IN ('All', 'ContactNotes'))
	BEGIN
		SELECT @NoteCount = COUNT(1) FROM dbo.ContactNotes CN WHERE CN.ContactId = @ContactId;
	END;

	-- Return phone number count
	IF (@TableName IN ('All', 'ContactPhoneNumbers'))
	BEGIN
		SELECT @PhoneNumberCount = COUNT(1) FROM dbo.ContactPhoneNumbers CPN WHERE CPN.ContactId = @ContactId;
	END;

	-- Return role count
	IF (@TableName IN ('All', 'ContactRoles'))
	BEGIN
		SELECT @RoleCount = COUNT(1) FROM dbo.ContactRoles CR WHERE CR.ContactId = @ContactId;
	END;

	-- If we have at least one valud value, add the row
	IF (@AddressCount > 0 OR @NoteCount > 0 OR @PhoneNumberCount > 0 OR @RoleCount > 0)
	BEGIN
		INSERT INTO @CountsTable (ContactId, AddressCount, NoteCount, PhoneNumberCount, RoleCount)
			SELECT @ContactId, @AddressCount, @NoteCount, @PhoneNumberCount, @RoleCount;
	END;

	RETURN;
END;

GO