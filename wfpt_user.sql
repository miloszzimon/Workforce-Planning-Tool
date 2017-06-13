USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [wfpt]    Script Date: 8/06/2017 14:31:43 ******/
CREATE LOGIN [wfpt] WITH PASSWORD=N'5L9bTGjxMmuedb3Dv0hSQcirncFmvaDw1iLz7xoB0bw=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [wfpt] ENABLE
GO

