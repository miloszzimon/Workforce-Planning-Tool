USE [master]
GO

CREATE LOGIN [wfpt] WITH PASSWORD=N'W0rkFPT00!', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [wfpt] ENABLE
GO

