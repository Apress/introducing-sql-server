USE AddressBook;

DECLARE @ContactId INT,
		@NumberOfVerificationRecords INT,
		@NumberOfContactRoleRecords INT,
		@NumberOfContactAddressRecords INT,
		@NumberOfContactNoteRecords INT,
		@NumberOfContactPhoneNumberRecords INT;

IF EXISTS (SELECT 1 FROM dbo.Contacts WHERE FirstName = 'Roald' AND LastName = 'Dahl')
BEGIN
	-- Obtain the contact ID value
	SELECT @ContactId = ContactId FROM dbo.Contacts WHERE FirstName = 'Roald' AND LastName = 'Dahl';

	-- Delete sub-records
	DELETE FROM dbo.ContactVerificationDetails WHERE ContactId = @ContactId;
	SELECT @NumberOfVerificationRecords = @@ROWCOUNT;

	DELETE FROM dbo.ContactRoles WHERE ContactId = @ContactId;
	SELECT @NumberOfContactRoleRecords = @@ROWCOUNT;

	DELETE FROM dbo.ContactAddresses WHERE ContactId = @ContactId;
	SELECT @NumberOfContactAddressRecords = @@ROWCOUNT;

	DELETE FROM dbo.ContactNotes WHERE ContactId = @ContactId;
	SELECT @NumberOfContactNoteRecords = @@ROWCOUNT;

	DELETE FROM dbo.ContactPhoneNumbers WHERE ContactId = @ContactId;
	SELECT @NumberOfContactPhoneNumberRecords = @@ROWCOUNT;

	-- Delete main record
	DELETE FROM dbo.Contacts WHERE ContactId = @ContactId;
END;

--SELECT @ContactId AS DeletedContactId,
--	@NumberOfVerificationRecords AS NumberOfVerificationRecordsAdded,
--	@NumberOfContactRoleRecords AS NumberOfContactRoleRecords,
--	@NumberOfContactAddressRecords AS NumberOfContactAddressRecords,
--	@NumberOfContactNoteRecords AS NumberOfContactNoteRecords,
--	@NumberOfContactPhoneNumberRecords AS NumberOfContactPhoneNumberRecords;
GO