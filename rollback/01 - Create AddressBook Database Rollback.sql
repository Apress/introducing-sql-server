USE MASTER;

IF EXISTS (SELECT 1 FROM sys.databases WHERE [name] = 'AddressBook')
BEGIN
DROP DATABASE AddressBook;
END;

GO