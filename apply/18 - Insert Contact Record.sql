USE AddressBook;

DECLARE @ContactId INT,
		@DeveloperRoleId INT,
		@MobilePhoneNumberTypeId TINYINT,
		@WorkPhoneNumberTypeId TINYINT,
		@NumberOfVerificationRecords INT,
		@NumberOfContactRoleRecords INT,
		@NumberOfContactAddressRecords INT,
		@NumberOfContactNoteRecords INT,
		@NumberOfContactPhoneNumberRecords INT;

-- Obtain lookup values
SELECT @DeveloperRoleId = RoleId FROM dbo.Roles WHERE RoleTitle = 'Developer';
SELECT @MobilePhoneNumberTypeId = PhoneNumberTypeId FROM dbo.PhoneNumberTypes
	WHERE PhoneNumberType = 'Mobile';
SELECT @WorkPhoneNumberTypeId = PhoneNumberTypeId FROM dbo.PhoneNumberTypes
	WHERE PhoneNumberType = 'Work';

PRINT 'Developer Role ID: ' + CAST(@DeveloperRoleId AS VARCHAR(20));
PRINT 'Mobile Phone Number Type ID: ' + CAST(@MobilePhoneNumberTypeId AS VARCHAR(20));
PRINT 'Work Phone Number Type ID: ' + CAST(@WorkPhoneNumberTypeId AS VARCHAR(20));

IF NOT EXISTS (SELECT 1 FROM dbo.Contacts WHERE FirstName = 'Roald' AND LastName = 'Dahl')
BEGIN
-- No need to specify AllowContactByPhone or CreatedDate as they have defaults
-- and Roald has said we cannot contact him by phone
	INSERT INTO dbo.Contacts (FirstName, LastName, DateOfBirth) VALUES ('Roald', 'Dahl', '1916-09-13');
	SELECT @ContactId = @@IDENTITY;

	IF (@ContactId IS NOT NULL)
	BEGIN
		-- Add verification details
		INSERT INTO dbo.ContactVerificationDetails (ContactId, DrivingLicenseNumber, ContactVerified)
			VALUES (@ContactId, '1031', 0);
		SELECT @NumberOfVerificationRecords = @@ROWCOUNT;

		-- Add developer role to contact
		IF (@DeveloperRoleId IS NOT NULL)
		BEGIN
			INSERT INTO dbo.ContactRoles (ContactId, RoleId) VALUES (@ContactId, @DeveloperRoleId);
			SELECT @NumberOfContactRoleRecords = @@ROWCOUNT;
		END;

		-- Add an address
		INSERT INTO dbo.ContactAddresses (ContactId, HouseNumber, Street, City, Postcode)
			VALUES (@ContactId, '200', 'Shaftbury Avenue', 'Hastings', 'TN38 8EZ');
		SELECT @NumberOfContactAddressRecords = @@ROWCOUNT;

		-- Add a note
		INSERT INTO dbo.ContactNotes (ContactId, Notes)
			VALUES (@ContactId, 'Roald Dahl is a famous author. He is best known for books aimed at children, such as the BFG.');
		SELECT @NumberOfContactNoteRecords = @@ROWCOUNT;

		-- Add phone numbers
		IF (@MobilePhoneNumberTypeId IS NOT NULL AND @WorkPhoneNumberTypeId IS NOT NULL)
		BEGIN
			INSERT INTO dbo.ContactPhoneNumbers (ContactId, PhoneNumberTypeId, PhoneNumber)
				VALUES (@ContactId, @MobilePhoneNumberTypeId, '07100 988 199'),
					   (@ContactId, @WorkPhoneNumberTypeId, '01424 700 700');
			SELECT @NumberOfContactPhoneNumberRecords = @@ROWCOUNT;
		END;
	END;
END;

-- Return what we've done
--SELECT @ContactId AS ContactId,
--	@NumberOfVerificationRecords AS NumberOfVerificationRecordsAdded,
--	@NumberOfContactRoleRecords AS NumberOfContactRoleRecords,
--	@NumberOfContactAddressRecords AS NumberOfContactAddressRecords,
--	@NumberOfContactNoteRecords AS NumberOfContactNoteRecords,
--	@NumberOfContactPhoneNumberRecords AS NumberOfContactPhoneNumberRecords;

GO