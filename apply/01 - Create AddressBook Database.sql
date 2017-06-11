USE master;
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE [name] = 'AddressBook')
BEGIN

	CREATE DATABASE AddressBook
	ON PRIMARY
	(
		NAME = 'AddressBook',
		FILENAME = 'C:\Temp\sqlbasics\AddressBook.mdf',
		SIZE = 10MB,
		MAXSIZE = UNLIMITED,
		FILEGROWTH = 50%
	)
	LOG ON
	(
		NAME = 'AddressBook_Log',
		FILENAME = 'C:\Temp\sqlbasics\AddressBook_Log.mdf',
		SIZE = 2MB,
		MAXSIZE = 100MB,
		FILEGROWTH = 2MB
	);
END;

GO