CREATE TABLE [dbo].[Recipient]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [UserName] NCHAR(20) NULL, 
    [Email] NCHAR(50) NULL, 
    [Password] NCHAR(20) NULL 
)
