USE AddressBook;

BULK INSERT dbo.ContactRoles FROM 'c:\temp\sqlbasics\importfiles\05_ContactRoles.csv' WITH
	(ROWTERMINATOR = '\n', FIELDTERMINATOR = ',', FIRSTROW = 2,
	 ERRORFILE = 'c:\temp\sqlbasics\importfiles\05_ContactRoles_Errors.csv',
	 CHECK_CONSTRAINTS);

GO