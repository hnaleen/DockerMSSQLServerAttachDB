USE [master]
GO
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'spider3') BEGIN
    CREATE LOGIN [spider3] WITH PASSWORD=N'spider3', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
    ALTER SERVER ROLE [sysadmin] ADD MEMBER [spider3]
END
GO
--With latest Dbase version this user no-longer need but as best practices create this user for backward compatibility
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'spider3_install') BEGIN
    CREATE LOGIN [spider3_install] WITH PASSWORD=N'spider3_install', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
END
GO 
