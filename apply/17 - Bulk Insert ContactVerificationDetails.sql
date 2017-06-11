USE AddressBook;

BULK INSERT dbo.ContactVerificationDetails FROM 'c:\temp\sqlbasics\importfiles\06_ContactVerificationDetails.csv' WITH
	(ROWTERMINATOR = '\n', FIELDTERMINATOR = ',', FIRSTROW = 2,
	 ERRORFILE = 'c:\temp\sqlbasics\importfiles\06_ContactVerificationDetails_Errors.csv',
	 CHECK_CONSTRAINTS);

GO