-- #################################################
-- Delete and drop user from all DBs
-- #################################################

DECLARE @username varchar(80)
DECLARE @cmd varchar(max)

SET @username = 'XXXXXXXXXXX'

SET @cmd = 'DROP LOGIN [' + @username + '];'
PRINT @cmd
EXEC (@cmd)

SET @cmd = 'USE [?]; IF  EXISTS (SELECT * FROM sys.schemas WHERE name = ''' + @username + ''') DROP SCHEMA [' + @username + ']; IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = ''' + @username + ''') DROP USER [' + @username + ']'
PRINT @cmd

EXEC master.sys.sp_MSforeachdb @cmd
