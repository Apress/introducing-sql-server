USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.indexes WHERE [Name] = 'IX_NC_PhoneNumberTypes_PhoneNumberType')
BEGIN
	DROP INDEX IX_NC_PhoneNumberTypes_PhoneNumberType ON dbo.PhoneNumberTypes
END;

CREATE INDEX IX_NC_PhoneNumberTypes_PhoneNumberType ON dbo.PhoneNumberTypes (PhoneNumberType);

GO