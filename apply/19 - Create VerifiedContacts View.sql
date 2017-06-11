USE AddressBook;
GO

IF EXISTS (SELECT 1 FROM sys.views WHERE [Name] = 'VerifiedContacts')
BEGIN
	DROP VIEW dbo.VerifiedContacts;
END

GO

CREATE VIEW dbo.VerifiedContacts WITH SCHEMABINDING AS
	SELECT	C.ContactId,
			C.FirstName,
			C.Lastname,
			C.DateOfBirth,
			CASE C.AllowContactByPhone
				WHEN 1 THEN 'Yes'
				ELSE 'No'
			END AS AllowContactByPhone,
			CVD.DrivingLicenseNumber,
			CVD.PassportNumber
	FROM dbo.Contacts AS C
	INNER JOIN dbo.ContactVerificationDetails AS CVD
		ON C.ContactId = CVD.ContactID
	WHERE CVD.ContactVerified = 1;

GO