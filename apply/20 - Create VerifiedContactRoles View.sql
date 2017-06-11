USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.views WHERE [Name] = 'VerifiedContactRoles')
BEGIN
	DROP VIEW dbo.VerifiedContactRoles;
END;

GO

CREATE VIEW dbo.VerifiedContactRoles WITH SCHEMABINDING AS
	SELECT	VC.ContactId,
			VC.FirstName,
			VC.Lastname,
			VC.DateOfBirth,
			VC.AllowContactByPhone,
			VC.DrivingLicenseNumber,
			VC.PassportNumber,
			R.RoleTitle
	FROM dbo.VerifiedContacts AS VC
	INNER JOIN dbo.ContactRoles AS CR
		ON VC.ContactId = CR.ContactId
	INNER JOIN dbo.Roles AS R
		ON CR.RoleId = R.RoleId;

GO