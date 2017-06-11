USE AddressBook;

BULK INSERT dbo.ContactPhoneNumbers FROM 'c:\temp\sqlbasics\importfiles\04_ContactPhoneNumbers.csv' WITH
	(ROWTERMINATOR = '\n', FIELDTERMINATOR = ',', FIRSTROW = 2,
	 ERRORFILE = 'c:\temp\sqlbasics\importfiles\04_ContactPhoneNumbers_Errors.csv',
	 CHECK_CONSTRAINTS);

GO