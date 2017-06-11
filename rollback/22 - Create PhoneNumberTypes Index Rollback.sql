USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.indexes WHERE [name] = 'IX_PhoneNumberTypes_PhoneNumberType')
BEGIN
	DROP INDEX IX_PhoneNumberTypes_PhoneNumberType ON dbo.PhoneNumberTypes;
END;

GO