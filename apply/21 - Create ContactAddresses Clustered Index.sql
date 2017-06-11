USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.indexes WHERE [Name] = 'IX_C_ContactAddresses_ContactIdPostcode')
BEGIN
	DROP INDEX IX_C_ContactAddresses_ContactIdPostcode ON dbo.ContactAddresses;
END;

CREATE CLUSTERED INDEX IX_C_ContactAddresses_ContactIdPostcode ON
	dbo.ContactAddresses(ContactId, Postcode);

GO