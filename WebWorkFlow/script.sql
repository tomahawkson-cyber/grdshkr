/***bug free 1392-10-04***/
/***bug free 1392-10-01***/
/***bug free 1392-09-12***/
/***bug free 1392-08-20***/
if exists (select * from sysobjects where id = object_id(N'[SystemRowStates]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [SystemRowStates]
/************************************************************************************/	           
GO
/************************************************************************************/	           
if exists (select * from sysobjects where id = object_id(N'[SystemVersions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [SystemVersions]
/************************************************************************************/	           
GO
/************************************************************************************/	           
CREATE TABLE [SystemRowStates] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TableName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1256_CI_AS NULL ,
	[SystemID] [int] NULL ,
	[UserCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1256_CI_AS NULL ,
	[LockStart] [datetime] NULL CONSTRAINT [DF_SystemRowStates_LockStart] DEFAULT (getdate()),
	[LockExpire] [datetime] NULL CONSTRAINT [DF_SystemRowStates_LockExpire] DEFAULT (dateadd(day,1,getdate())),
	[KeysInfo] [ntext] COLLATE SQL_Latin1_General_CP1256_CI_AS NULL ,
	CONSTRAINT [PK_SystemRowStates] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[WFBase]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [WFBase] (
	[BaseId] [int] IDENTITY(1,1) NOT NULL,
	[BaseCode] [tinyint] NOT NULL,
	[BaseValue] [nvarchar](150) NOT NULL,
	[BaseGroup] [varchar](10) NOT NULL,
	CONSTRAINT [PK_WFBase] PRIMARY KEY  CLUSTERED 
	(
		[BaseId]
	)  ON [PRIMARY] 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF(NOT EXISTS(SELECT * FROM WFBase w WHERE w.BaseGroup='DIO' AND BaseCode=0))
	INSERT INTO WFBase( BaseCode,BaseValue,	BaseGroup)VALUES(0, N'نامعلوم',	'DIO')
IF(NOT EXISTS(SELECT * FROM WFBase w WHERE w.BaseGroup='DIO' AND BaseCode=1))	
	INSERT INTO WFBase(	BaseCode,BaseValue,	BaseGroup)VALUES(1, N'هواپیما',	'DIO')
IF(NOT EXISTS(SELECT * FROM WFBase w WHERE w.BaseGroup='DIO' AND BaseCode=2))	
	INSERT INTO WFBase(	BaseCode,BaseValue,	BaseGroup)VALUES(2, N'قطار',	'DIO')
IF(NOT EXISTS(SELECT * FROM WFBase w WHERE w.BaseGroup='DIO' AND BaseCode=3))
	INSERT INTO WFBase(	BaseCode,BaseValue,	BaseGroup)VALUES(3, N'اتوبوس',	'DIO')
IF(NOT EXISTS(SELECT * FROM WFBase w WHERE w.BaseGroup='DIO' AND BaseCode=4))	
	INSERT INTO WFBase(	BaseCode,BaseValue,	BaseGroup)VALUES(4, N'خودرو شخصی',	'DIO')
IF(NOT EXISTS(SELECT * FROM WFBase w WHERE w.BaseGroup='DIO' AND BaseCode=5))	
	INSERT INTO WFBase(	BaseCode,BaseValue,	BaseGroup)VALUES(5, N'خودرو شرکت',	'DIO')
IF(NOT EXISTS(SELECT * FROM WFBase w WHERE w.BaseGroup='DIO' AND BaseCode=6))	
	INSERT INTO WFBase(	BaseCode,BaseValue,	BaseGroup)VALUES(6, N'سایر',	'DIO')
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[WFParallelApprove]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [WFParallelApprove] (
	[CardNo] [int] NOT NULL ,
	[SecNo] [int] NOT NULL ,
	[EmpNo] [float] NOT NULL ,
	CONSTRAINT [PK_WFParallelApprove] PRIMARY KEY  CLUSTERED 
	(
		[CardNo],
		[EmpNo]
	)  ON [PRIMARY] 
) ON [PRIMARY]
/************************************************************************************/	
GO
/************************************************************************************/
IF COL_LENGTH('WFParallelApprove','DateModified') IS NULL
	ALTER TABLE WFParallelApprove ADD DateModified datetime NOT NULL DEFAULT getdate()
/************************************************************************************/	
GO
/************************************************************************************/
IF COL_LENGTH('WFParallelApprove','LimitDuration') IS NULL
	ALTER TABLE WFParallelApprove ADD LimitDuration INT NOT NULL DEFAULT(0)
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[News]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [News] (
	NewsId int NOT NULL IDENTITY (1, 1),
	Lead nvarchar(255) NOT NULL,
	News nvarchar(4000) NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL,
	IsActive bit NOT NULL,
	CONSTRAINT [PK_News] PRIMARY KEY  CLUSTERED 
	(
		NewsId
	)  ON [PRIMARY] 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[Quotation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[Quotation](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[Author] [nvarchar](200) NOT NULL,
	[QuotationBody] [nvarchar](4000) NOT NULL,
	 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
	(
		[Serial]
	) ON [PRIMARY]
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[WFRequestParallelApproval]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [WFRequestParallelApproval] (
	[RequestID] [int] NOT NULL ,
	[ParallelApprovalEmpNo] [float] NOT NULL ,
	[ParallelApprovalSecNo] [int] NOT NULL ,
	[ParallelApprovalCardNo] [int] NOT NULL ,
	[ChangeDate] [datetime] NULL ,
	CONSTRAINT [PK_WFRequestParallelApproval] PRIMARY KEY  CLUSTERED 
	(
		[RequestID],
		[ParallelApprovalEmpNo],
		[ParallelApprovalSecNo],
		[ParallelApprovalCardNo]
	)  ON [PRIMARY] 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF COL_LENGTH('WFRequestParallelApproval','IsApprove') IS NULL
	ALTER TABLE WFRequestParallelApproval ADD IsApprove bit DEFAULT(0)
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[Conferment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [Conferment] (
	[EmpManager] [int] NOT NULL ,
	[ActionID] [int] NOT NULL ,
	[EMP_NO] [float] NOT NULL ,
	[SEC_NO] [int] NOT NULL ,
	[PermitValue] [float] NOT NULL ,
	[StartDate] [datetime] NOT NULL ,
	[EndDate] [datetime] NOT NULL ,
	CONSTRAINT [PK_Conferment] PRIMARY KEY  CLUSTERED 
	(
		[EmpManager],
		[ActionID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
/************************************************************************************/	
GO
/************************************************************************************/	           
IF COL_LENGTH('PARMFILE','WFNeedDesc') IS NULL
	ALTER TABLE PARMFILE ADD WFNeedDesc BIT NOT NULL DEFAULT(0)
/************************************************************************************/	
GO
/************************************************************************************/	
IF COL_LENGTH('Conferment','IsDelete') IS NULL
ALTER TABLE Conferment ADD IsDelete BIT DEFAULT(0) NOT NULL		
/******************************************************************/
GO
/************************************************************************************/
ALTER TABLE dbo.Conferment
	DROP CONSTRAINT PK_Conferment	
/************************************************************************************/	 
GO
/************************************************************************************/
ALTER TABLE dbo.Conferment ADD CONSTRAINT
	PK_Conferment PRIMARY KEY CLUSTERED 
	(
	EmpManager,
	ActionID,
	EMP_NO,
	SEC_NO,
	IsDelete
	) ON [PRIMARY]

/************************************************************************************/	           
GO
/************************************************************************************/	           
CREATE TABLE [SystemVersions] (
	[SystemVersionID] [int] IDENTITY (1, 1) NOT NULL ,
	[SystemID] [int] NULL ,
	[VersionDate] [char] (10) COLLATE SQL_Latin1_General_CP1256_CI_AS NULL ,
	[InstallDate] [char] (10) COLLATE SQL_Latin1_General_CP1256_CI_AS NULL ,
	[UserCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1256_CI_AS NULL ,
	CONSTRAINT [PK_SystemVersions] PRIMARY KEY  CLUSTERED 
	(
		[SystemVersionID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[EmployeeManagers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE table [EmployeeManagers] (
	[ManagerEmp_No] [float] NOT NULL ,
	[OperationsID] [int] NOT NULL ,
	[Emp_No] [float] NOT NULL 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT EXISTS(SELECT * FROM sysobjects s WHERE s.[name] = 'PK_EmployeeManagers')
ALTER table [EmployeeManagers] ADD 
	CONSTRAINT [PK_EmployeeManagers] PRIMARY KEY  CLUSTERED 
	(
		[ManagerEmp_No],
		[OperationsID],
		[Emp_No]
	)  ON [PRIMARY] 	
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[ManagerAccess]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE table [ManagerAccess] (
	[SecNo] [float] NOT NULL ,
	[ActionNo] [int] NOT NULL 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[OperationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE table [OperationTypes] (
	[OperationsID] [int] NOT NULL ,
	[Name] [nvarchar] (50) COLLATE Arabic_CI_AS NULL 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT EXISTS(SELECT * FROM sysobjects s WHERE s.[name] = 'PK_OperationTypes')
ALTER table [OperationTypes] ADD 
	CONSTRAINT [PK_OperationTypes] PRIMARY KEY  CLUSTERED 
	(
		[OperationsID]
	)  ON [PRIMARY] 
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[Requests]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE table [Requests] (
	[RequestsID] [int] IDENTITY (1, 1) NOT NULL ,
	[WorkflowIdentifier] [uniqueidentifier] NULL ,
	[EMP_NO] [float] NULL ,
	[SubmittedDate] [datetime] NULL ,
	[Type] [smallint] NULL ,
	[StartDate] [datetime] NULL ,
	[EndDate] [datetime] NULL ,
	[StartHour] [int] NULL ,
	[EndHour] [int] NULL ,
	[Duration] [varchar] (10) COLLATE Arabic_CI_AS NULL ,
	[SubmittedByEmployeeID] [float] NULL ,
	[IsFinalApproved] [bit] NULL ,
	[ApprovalByManagerEmp_No] [float] NULL ,
	[ApprovalDate] [datetime] NULL ,
	[OperationsID] [int] NULL ,
	[Description] [nvarchar] (500) COLLATE Arabic_CI_AS NULL ,
	[CurEmp_NO] [float] NULL ,
	[ManagerIdea] [nvarchar] (500) COLLATE Arabic_CI_AS NULL ,
	[AcceptCode] [smallint] NULL ,
	[CurSection] [int] NULL 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/
IF NOT exists (select * from sysobjects where id = object_id(N'[Substitute]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [dbo].[Substitute](
		[SubstituteID] [int] IDENTITY(1,1) NOT NULL,
		[ManagerEmpNo] [float] NOT NULL,
		[SubstituteEmpNo] [float] NOT NULL,
		[StartDate] [datetime] NOT NULL,
		[EndDate] [datetime] NOT NULL,
		[IsActive] [bit] NOT NULL,
		[IsInsertByAdmin] [bit] NULL,
	 CONSTRAINT [PK_Substitute] PRIMARY KEY CLUSTERED 
	(
		[SubstituteID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO
IF OBJECT_ID('dbo.DF_Substitute_IsActive', 'D') IS NULL 
	ALTER TABLE [dbo].[Substitute] ADD  CONSTRAINT [DF_Substitute_IsActive]  DEFAULT ((1)) FOR [IsActive]
/************************************************************************************/	           
GO
/************************************************************************************/
IF NOT EXISTS(SELECT * FROM sysobjects s WHERE s.[name] = 'PK_Requests')
ALTER table [Requests] ADD 
	CONSTRAINT [DF__Requests__Accept__61B2F0E6] DEFAULT (0) FOR [AcceptCode],
	CONSTRAINT [PK_Requests] PRIMARY KEY  CLUSTERED 
	(
		[RequestsID]
	)  ON [PRIMARY] 
/************************************************************************************/	           
GO
/************************************************************************************/
IF COL_LENGTH('PARMFILE','WF_ParallelApprove') IS NULL
	ALTER TABLE PARMFILE ADD WF_ParallelApprove BIT DEFAULT(0)
/************************************************************************************/	           
GO
/************************************************************************************/
IF NOT  exists (select * from sysobjects where id = object_id(N'[Reviews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE table [Reviews] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[RequestID] [int] NULL ,
	[ReviewedByEmployeeID] [float] NULL ,
	[Description] [nvarchar] (500) COLLATE Arabic_CI_AS NULL ,
	[ReviewStatus] [smallint] NULL ,
	[ReviewDate] [datetime] NULL ,
	[Is_ShowPersonal] [bit] NOT NULL 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/
IF NOT EXISTS(SELECT * FROM sysobjects s WHERE s.[name] = 'PK_Reviews')
BEGIN
ALTER table [Reviews] ADD 
	CONSTRAINT [PK_Reviews] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
END
/************************************************************************************/
GO
/************************************************************************************/
IF NOT EXISTS(SELECT * FROM sysobjects s WHERE s.[name] = 'FK_EmployeeManagers_OperationTypes')
ALTER table [EmployeeManagers] ADD 
	CONSTRAINT [FK_EmployeeManagers_OperationTypes] FOREIGN KEY 
	(
		[OperationsID]
	) REFERENCES [OperationTypes] (
		[OperationsID]
	)
/************************************************************************************/	           
GO
/************************************************************************************/
IF NOT EXISTS(SELECT * FROM sysobjects s WHERE s.[name] = 'FK_Requests_OperationTypes')
ALTER table [Requests] ADD 
	CONSTRAINT [FK_Requests_OperationTypes] FOREIGN KEY 
	(
		[OperationsID]
	) REFERENCES [OperationTypes] (
		[OperationsID]
	)
/************************************************************************************/	           
GO
/************************************************************************************/
IF NOT EXISTS(SELECT * FROM sysobjects s WHERE s.[name] = 'FK_Reviews_Requests')
ALTER table [Reviews] ADD 
	CONSTRAINT [FK_Reviews_Requests] FOREIGN KEY 
	(
		[RequestID]
	) REFERENCES [Requests] (
		[RequestsID]
	)
/************************************************************************************/	           
GO
/************************************************************************************/
IF NOT EXISTS(SELECT * FROM CARDS c WHERE c.CARD_TYPE=11 AND c.CARD_NO=100)
INSERT INTO [CARDS]
([REPORT_NO],[PARM_NAME],[Karkerd_Name],[R2T_NAME],[CARD_NO],[OneTitle],[TITLE],[SUB_TITLE],[REP_ACTIVE],[SYS_ACTIVE]
,[CARD_TYPE],[IS_DAY],[R_S_TYPE],[SELECTED],[ROUNDED],[FirstTitle],[Amalkard],[IsAmalkard],[KarkerdName])
VALUES(NULL,NULL,NULL,NULL,100,NULL,'ورود و خروج فراموش شده',NULL,0,0,11,0,NULL,0,0,NULL,NULL,0,NULL)
/************************************************************************************/	           
GO
/************************************************************************************/
IF NOT EXISTS(SELECT * FROM CARDS c WHERE c.CARD_TYPE=11 AND c.CARD_NO=101)
INSERT INTO [CARDS]
([REPORT_NO],[PARM_NAME],[Karkerd_Name],[R2T_NAME],[CARD_NO],[OneTitle],[TITLE],[SUB_TITLE],[REP_ACTIVE],[SYS_ACTIVE]
,[CARD_TYPE],[IS_DAY],[R_S_TYPE],[SELECTED],[ROUNDED],[FirstTitle],[Amalkard],[IsAmalkard],[KarkerdName])
VALUES(NULL,NULL,NULL,NULL,101,NULL,'اصلاح ورود و خروج',NULL,0,0,11,0,NULL,0,0,NULL,NULL,0,NULL)
GO
IF NOT EXISTS(SELECT * FROM CARDS c WHERE c.CARD_TYPE=11 AND c.CARD_NO=105)
INSERT INTO [CARDS]
([REPORT_NO],[PARM_NAME],[Karkerd_Name],[R2T_NAME],[CARD_NO],[OneTitle],[TITLE],[SUB_TITLE],[REP_ACTIVE],[SYS_ACTIVE]
,[CARD_TYPE],[IS_DAY],[R_S_TYPE],[SELECTED],[ROUNDED],[FirstTitle],[Amalkard],[IsAmalkard],[KarkerdName])
VALUES(NULL,NULL,NULL,NULL,105,NULL,N'اصلاح نوع ورود و خروج',NULL,0,0,11,0,NULL,0,0,NULL,NULL,0,NULL)
GO
IF NOT EXISTS(SELECT * FROM CARDS c WHERE c.CARD_TYPE=11 AND c.CARD_NO=0 AND c.IS_DAY=0)
INSERT INTO [CARDS]
([REPORT_NO],[PARM_NAME],[Karkerd_Name],[R2T_NAME],[CARD_NO],[OneTitle],[TITLE],[SUB_TITLE],[REP_ACTIVE],[SYS_ACTIVE]
,[CARD_TYPE],[IS_DAY],[R_S_TYPE],[SELECTED],[ROUNDED],[FirstTitle],[Amalkard],[IsAmalkard],[KarkerdName])
VALUES(NULL,NULL,NULL,NULL,0,NULL,'عادي',NULL,0,1,11,0,NULL,0,0,NULL,NULL,0,NULL)
GO
IF NOT EXISTS(SELECT * FROM CARDS c WHERE c.CARD_TYPE=11 AND c.CARD_NO=0 AND c.IS_DAY=1)
INSERT INTO [CARDS]
([REPORT_NO],[PARM_NAME],[Karkerd_Name],[R2T_NAME],[CARD_NO],[OneTitle],[TITLE],[SUB_TITLE],[REP_ACTIVE],[SYS_ACTIVE]
,[CARD_TYPE],[IS_DAY],[R_S_TYPE],[SELECTED],[ROUNDED],[FirstTitle],[Amalkard],[IsAmalkard],[KarkerdName])
VALUES(NULL,NULL,NULL,NULL,0,NULL,'عادي',NULL,0,1,11,1,NULL,0,0,NULL,NULL,0,NULL)                              
GO
IF NOT EXISTS(SELECT * FROM CARDS c WHERE c.CARD_TYPE=11 AND c.CARD_NO=102)
INSERT INTO [CARDS]
([REPORT_NO],[PARM_NAME],[Karkerd_Name],[R2T_NAME],[CARD_NO],[OneTitle],[TITLE],[SUB_TITLE],[REP_ACTIVE],[SYS_ACTIVE]
,[CARD_TYPE],[IS_DAY],[R_S_TYPE],[SELECTED],[ROUNDED],[FirstTitle],[Amalkard],[IsAmalkard],[KarkerdName])
VALUES(NULL,NULL,NULL,NULL,102,NULL,'جابجایی در شیفت',NULL,0,0,11,0,NULL,0,0,NULL,NULL,0,NULL)
GO
IF NOT EXISTS(SELECT * FROM CARDS c WHERE c.CARD_TYPE=11 AND c.CARD_NO=103)
INSERT INTO [CARDS]
([REPORT_NO],[PARM_NAME],[Karkerd_Name],[R2T_NAME],[CARD_NO],[OneTitle],[TITLE],[SUB_TITLE],[REP_ACTIVE],[SYS_ACTIVE]
,[CARD_TYPE],[IS_DAY],[R_S_TYPE],[SELECTED],[ROUNDED],[FirstTitle],[Amalkard],[IsAmalkard],[KarkerdName])
VALUES(NULL,NULL,NULL,NULL,103,NULL,'اضافه کار',NULL,0,0,11,0,NULL,0,0,NULL,NULL,0,NULL)
GO 
IF NOT EXISTS(SELECT * FROM CARDS c WHERE c.CARD_TYPE=11 AND c.CARD_NO=104)
INSERT INTO [CARDS]
([REPORT_NO],[PARM_NAME],[Karkerd_Name],[R2T_NAME],[CARD_NO],[OneTitle],[TITLE],[SUB_TITLE],[REP_ACTIVE],[SYS_ACTIVE]
,[CARD_TYPE],[IS_DAY],[R_S_TYPE],[SELECTED],[ROUNDED],[FirstTitle],[Amalkard],[IsAmalkard],[KarkerdName])
VALUES(NULL,NULL,NULL,NULL,104,NULL,'افزایش یا کاهش مرخصی',NULL,0,0,11,0,NULL,0,0,NULL,NULL,0,NULL)
GO
IF NOT EXISTS(SELECT * FROM OperationTypes ot WHERE ot.OperationsID=1)
INSERT INTO [OperationTypes]([OperationsID],[Name])
VALUES(1,N'اضافه کار')
GO 
IF NOT EXISTS(SELECT * FROM OperationTypes ot WHERE ot.OperationsID=2)
INSERT INTO [OperationTypes]([OperationsID],[Name])
VALUES(2,N'تردد')
GO 
IF NOT EXISTS(SELECT * FROM OperationTypes ot WHERE ot.OperationsID=3)
INSERT INTO [OperationTypes]([OperationsID],[Name])
VALUES(3,N'ماموریت')
GO 
IF NOT EXISTS(SELECT * FROM OperationTypes ot WHERE ot.OperationsID=5)
INSERT INTO [OperationTypes]([OperationsID],[Name])
VALUES(5,N'مرخصی')
GO
IF NOT EXISTS(SELECT * FROM OperationTypes ot WHERE ot.OperationsID=6)
INSERT INTO [OperationTypes]([OperationsID],[Name])
VALUES(6,N'ثبت درخواست')           
GO
IF NOT EXISTS(SELECT * FROM OperationTypes ot WHERE ot.OperationsID=7)
INSERT INTO [OperationTypes]([OperationsID],[Name])
VALUES(7,N'چاپ احکام')           
GO
IF NOT exists (select * from sysobjects where id = object_id(N'[ManagerAccess]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE table [ManagerAccess] (
	[SecNo] [float] NOT NULL ,
	[ActionNo] [int] NOT NULL 
) ON [PRIMARY]
END

GO
IF COL_LENGTH('Requests','MoveUpCnt')  IS NULL
ALTER TABLE [Requests] ADD MoveUpCnt INT NULL
GO
IF COL_LENGTH('EMPLOYEE','IsWarden') IS NULL
	ALTER TABLE EMPLOYEE ADD IsWarden BIT DEFAULT 0
GO
IF COL_LENGTH('EMPLOYEE','IsPrintViewer') IS NULL
	ALTER TABLE EMPLOYEE ADD IsPrintViewer BIT DEFAULT 0
GO
IF COL_LENGTH('Requests','ManagerIdea') IS NULL
	ALTER TABLE Requests ADD ManagerIdea NVARCHAR(500) NULL
GO
IF COL_LENGTH('Requests','IsFirstTimeShift') IS NULL
	ALTER TABLE Requests ADD IsFirstTimeShift BIT NOT NULL DEFAULT(0)	
GO
IF COL_LENGTH('Requests','AcceptCode') IS NULL
	ALTER TABLE Requests ADD AcceptCode SMALLINT DEFAULT 0
GO
IF COL_LENGTH('Requests','CurSection') IS NULL
	ALTER TABLE Requests ADD CurSection INT NULL
GO
IF COL_LENGTH('SECTIONS','EmpManager') IS NULL
	ALTER TABLE SECTIONS ADD EmpManager FLOAT DEFAULT 0
GO
IF COL_LENGTH('SECTIONS','SEmp_No') IS NULL
	ALTER TABLE SECTIONS ADD SEmp_No FLOAT NULL
GO
IF COL_LENGTH('SECTIONS','S_FDate') IS NULL
	ALTER TABLE SECTIONS ADD S_FDate NVARCHAR(10) NULL
GO
IF COL_LENGTH('SECTIONS','S_TDate') IS NULL
	ALTER TABLE SECTIONS ADD S_TDate NVARCHAR(10) NULL
GO
IF COL_LENGTH('SECTIONS','LEAVE') IS NULL
	ALTER TABLE SECTIONS ADD LEAVE INT NULL
GO
IF COL_LENGTH('SECTIONS','DUTY') IS NULL
	ALTER TABLE SECTIONS ADD DUTY INT NULL
GO
IF COL_LENGTH('SECTIONS','LeaveOut') IS NULL
	ALTER TABLE SECTIONS ADD LeaveOut INT NULL	
GO
IF COL_LENGTH('EMPLOYEE','EmpNo_Emgr') IS NULL
	ALTER TABLE EMPLOYEE ADD EmpNo_Emgr FLOAT DEFAULT 0	
GO
IF COL_LENGTH('EMPLOYEE','EmpMngr') IS NULL
	ALTER TABLE EMPLOYEE ADD EmpMngr FLOAT
GO
IF COL_LENGTH('EMPLOYEE','LEAVE') IS NULL
	ALTER TABLE EMPLOYEE ADD LEAVE INT
GO
IF COL_LENGTH('EMPLOYEE','DUTY') IS NULL
	ALTER TABLE EMPLOYEE ADD DUTY INT  
GO
IF COL_LENGTH('EMPLOYEE','LeaveOut') IS NULL
	ALTER TABLE EMPLOYEE ADD LeaveOut INT 
GO
IF COL_LENGTH('Requests','CurEmp_NO') IS NULL
	ALTER TABLE Requests ADD CurEmp_NO FLOAT
GO
IF COL_LENGTH('Requests','Requested_Time') IS NULL
	ALTER TABLE Requests ADD Requested_Time NVARCHAR(10) NULL
GO
IF COL_LENGTH('EMPLOYEE','WardenDayCount') IS NULL
	ALTER TABLE EMPLOYEE ADD WardenDayCount INT NULL
GO
IF COL_LENGTH('EMPLOYEE','WardenJustInShift') IS NULL
	ALTER TABLE EMPLOYEE ADD WardenJustInShift BIT NULL
/************************************************************************************/		
GO
/***********************************ScriptData=1393-8-20 14:28*************************************************/
IF COL_LENGTH('EMPLOYEE','WFUserName') IS NULL
	ALTER TABLE EMPLOYEE ADD WFUserName NVARCHAR(25) NULL
/************************************************************************************/		
GO
/************************************************************************************/
IF COL_LENGTH('EMPLOYEE','WFUserPass') IS NULL
BEGIN
	ALTER TABLE EMPLOYEE ADD WFUserPass NVARCHAR(15) NULL	
	EXEC('UPDATE EMPLOYEE SET WFUserPass=P11,WFUserName=P10')
END
/************************************************************************************/		
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[ConvertToTimeFormat]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [ConvertToTimeFormat]
/************************************************************************************/		
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[MiladyCount]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [MiladyCount]
GO

/****** Object:  UserDefinedFunction [ShamsyDate]    Script Date: 11/24/2009 17:57:05 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[ShamsyDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [ShamsyDate]
GO

/****** Object:  UserDefinedFunction [ConvertToTimeFormat]    Script Date: 11/24/2009 17:57:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [ConvertToTimeFormat](@strHour NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
IF (LEN(@strHour) = 1)
    SET @strHour = '000' + @strHour
ELSE 
IF (LEN(@strHour) = 2)
    SET @strHour = '00' + @strHour
ELSE 
IF (LEN(@strHour) = 3)
    SET @strHour = '0' + @strHour

IF (LEN(@strHour) = 4)
    SET @strHour = SUBSTRING(@strHour, 0, 3) + ':' + SUBSTRING(@strHour, 3, LEN(@strHour))
ELSE
    SET @strHour = SUBSTRING(@strHour, 0, 5) + ':' + SUBSTRING(@strHour, 5, LEN(@strHour))

RETURN @strHour    

END

GO

/****** Object:  UserDefinedFunction [MiladyCount]    Script Date: 11/24/2009 17:57:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Function [MiladyCount](@PrYear Int, @PrMnth  Int, @PrDay Int) 
Returns bigint as
  begin
    declare
      @i int,
      @j Int,
      @Result bigint
    set @Result = 0
    --numdaymonthsM = Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
    set @i = 0 
    set @j = @PrYear - 1900
    while @i  <=  @j
      begin    
         If @i = @j break
         If @i % 4 = 0 
            set @Result = @Result + 366
         else
            set @Result = @Result + 365
         set @i = @i + 1
      end--while
    set @j = @PrMnth - 1
    set @i = 0
    while @i <= @j
      begin
         If @i = @j break
         --(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
         if @i = 0  set @Result = @Result + 31
         if @i = 1  set @Result = @Result + 28
         if @i = 2  set @Result = @Result + 31
         if @i = 3  set @Result = @Result + 30
         if @i = 4  set @Result = @Result + 31
         if @i = 5  set @Result = @Result + 30
         if @i = 6  set @Result = @Result + 31
         if @i = 7  set @Result = @Result + 31
         if @i = 8  set @Result = @Result + 30
         if @i = 9  set @Result = @Result + 31
         if @i = 10 set @Result = @Result + 30
         if @i = 11 set @Result = @Result + 31
         --@Result = @Mdate_Nday + numdaymonthsM(i)
         set @i = @i + 1
      end
    If (@PrYear % 4 = 0) And @PrMnth > 2 
       set @Result  = @Result + 1
    set @Result = @Result + @PrDay
    Return @result
  end
GO

/****** Object:  UserDefinedFunction [ShamsyDate]    Script Date: 11/24/2009 17:57:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   Function [ShamsyDate](@MiladyDate As Datetime) 
Returns char(10) As 
begin
  Declare 
    @yy        bigint,
    @mm      bigint,
    @j           Int,
    @dd        Int,
    @SDay   char(2),
    @SMon   char(2),
    @SYer    char(4),
    @Result char(10),
    @Res    char(10),
    @nDay  bigint,
    @TD  bigint,
    @TM  bigint,
    @TY  bigint
  Set @MiladyDate = IsNull(@MiladyDate,'2000/01/01')
  Set @TD = Day(@MiladyDate)
  Set @TM = Month(@MiladyDate)
  Set @TY = Year(@MiladyDate)
  Set @nday = dbo.MiladyCount(@TY,@TM,@TD)-7750 
  Set @yy = 1300
  Set @mm = 0
  While 1<2 --True
    begin    
        If (@yy < 1374 And @yy % 4 = 2) Or (@yy > 1374 And @yy % 4 = 3) 
          begin
             If    @nDay < 367  break
             set @nDay = @nDay - 366
          end 
        else
          begin  
             If    @nDay < 366  break
             set @nDay = @nDay - 365
          end 
        set @yy = @yy + 1
    end--While 
  set @j = 12
  set @mm = 1
  while @mm <=  @j
    begin
      If @mm =@j  break
      If @mm < 7 
         begin
            If    @nDay < 32 break
            set @nDay = @nDay - 31
         end
      else
         begin   
            If    @nDay < 31 break
            set @nDay = @nDay - 30
         end     
      set  @mm = @mm + 1
    end--while 
  set @dd = @nDay
  set @SYer =  Cast(@yy as Char(4))
  if @mm >= 10 
     set @SMon = Cast(@mm as char(2))
  else
     set @SMon = '0' + Cast(@mm as char(2))
  if @dd >= 10 
    set @SDay = Cast(@dd as char(2))
  else
    set @SDay = '0' + Cast(@dd as char(2))
  --set @Result = Cast(@yy as Char(4)) + cast(@mm as char(2)) + cast(@dd as char(2))
  set @Res = @SYer +'/'+ @SMon +'/'+ @SDay
  --Set @Res = Cast(@Result as Bigint)
return @Res
end --Function
GO

/****** Object:  View WHERE id = [WF_Cards_VI]    Script Date: 11/24/2009 17:32:23 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_Cards_VI]'))
DROP VIEW [WF_Cards_VI]
GO

/****** Object:  View WHERE id = [WF_CardsStr_VI]    Script Date: 11/24/2009 17:32:23 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_CardsStr_VI]'))
DROP VIEW [WF_CardsStr_VI]
GO

/****** Object:  View WHERE id = [WF_GetEmployee_VI]    Script Date: 11/24/2009 17:32:23 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetEmployee_VI]'))
DROP VIEW [WF_GetEmployee_VI]
GO

/****** Object:  View WHERE id = [WF_GetEmployeeKind_VI]    Script Date: 11/24/2009 17:32:23 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetEmployeeKind_VI]'))
DROP VIEW [WF_GetEmployeeKind_VI]
GO

/****** Object:  View WHERE id = [WF_SelectEmploye_VI]    Script Date: 11/24/2009 17:32:23 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SelectEmploye_VI]'))
DROP VIEW [WF_SelectEmploye_VI]
GO
/****** Object:  View WHERE id = [WF_Cards_VI]    Script Date: 11/24/2009 17:32:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [WF_Cards_VI]
AS
SELECT     CARDS.*
FROM         CARDS
WHERE     (CARD_TYPE IN (3, 5)) AND (SYS_ACTIVE = 1) OR
                      (SYS_ACTIVE = 1) AND (CARD_NO IN (30, 5, 2, 0))
GO

/****** Object:  View WHERE id = [WF_CardsStr_VI]    Script Date: 11/24/2009 17:32:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [WF_CardsStr_VI]
AS
SELECT     CARDS.*, LTRIM(CARD_NO) AS CARD_NOStr
FROM         CARDS
/************************************************************************************/	           
GO
/************************************************************************************/	           
if exists (select * from dbo.sysobjects where id = object_id(N'[WF_GetEmployee_VI]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [WF_GetEmployee_VI]
/************************************************************************************/	           
GO
/************************************************************************************/	           
CREATE VIEW dbo.WF_GetEmployee_VI
AS
SELECT	e.EMP_NO, e.NAME + ' ' + e.FAMILY AS FullName, 
		CASE ISNULL(e.IS_KARMAND, 0) WHEN 0 THEN 'کاربر معمولي' WHEN 1 THEN 'مدير' ELSE 'سرپرست' END AS IS_KARMAND,
		e.SEC_NO, e.IsWarden, e.NAME, e.FAMILY, dbo.SECTIONS.TITLE,e.IS_KARMAND AS Status, e.EmpMngr, 
		e.LEAVE, e.DUTY, e.LeaveOut, e.IsPrintViewer, e.POS_NO
FROM            dbo.EMPLOYEE AS e LEFT OUTER JOIN
                         dbo.SECTIONS ON e.SEC_NO = dbo.SECTIONS.SEC_NO
WHERE        (e.IsCut = 0) AND (e.END_DATE >= GETDATE())
/************************************************************************************/	           
GO
/************************************************************************************/	           
/****** Object:  View WHERE id = [WF_GetEmployeeKind_VI]    Script Date: 11/24/2009 17:32:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [WF_GetEmployeeKind_VI]
AS
SELECT e.EMP_NO, e.PERS_NO, e.NAME, e.FAMILY, e.NAME + ' ' + e.FAMILY AS 
       FullName, e.IS_KARMAND, e.SEC_NO, e.SYS_ACTIVE, s.TITLE AS Sections, s.EmpManager, 
       s.SEmp_No, CAST(
           (
               CASE 
                    WHEN e.IS_KARMAND = 2 THEN 1
                    WHEN ((e.IS_KARMAND=2) AND (EXISTS
                         (
                             SELECT *
                             FROM   EmployeeManagers em
                             WHERE  em.ManagerEmp_No = e.EMP_NO
                                    AND em.OperationsID = 6
                         ))) THEN 1
                    ELSE 0
               END
           ) AS BIT
       ) AS Supervisor, CAST(
           (
               SELECT TOP 1 COUNT(1)
               FROM   SECTIONS s2
               WHERE  s2.EmpManager = e.EMP_NO
           ) AS BIT
       ) AS Manager, CAST(
           (
               SELECT TOP 1 COUNT(1)
               FROM   SECTIONS s3
               WHERE  s3.SEmp_No = e.EMP_NO
                      AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
                      AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
           ) AS BIT
       ) AS Substitute,e.IsPrintViewer
FROM   EMPLOYEE e
       INNER JOIN SECTIONS s
            ON  s.SEC_NO = e.SEC_NO
WHERE  (e.IsCut = 0)
       AND (e.END_DATE >= GETDATE())
GO

/****** Object:  View WHERE id = [WF_SelectEmploye_VI]    Script Date: 11/24/2009 17:32:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [WF_SelectEmploye_VI]
AS
SELECT     TOP 100 PERCENT em.ManagerEmp_No AS Supervisor, s.EmpManager, e.NAME + ' ' + e.FAMILY AS FullName, s.SEC_NO, e.EMP_NO, 
                      em.OperationsID, s.TITLE, s.SEmp_No, CAST(ISNULL(REPLACE(s.S_FDate, '/', ''), 0) AS INT) AS S_FDate, CAST(ISNULL(REPLACE(s.S_TDate, '/', ''), 0) 
                      AS INT) AS S_TDate, e.GRP_NO
FROM         SECTIONS s INNER JOIN
                      EMPLOYEE e ON s.SEC_NO = e.SEC_NO LEFT OUTER JOIN
                      EmployeeManagers em ON e.EMP_NO = em.Emp_No
WHERE     (e.IsCut = 0) AND (e.END_DATE >= GETDATE()) AND (e.SYS_ACTIVE = 1)
ORDER BY e.EMP_NO
GO
/****** Object:  StoredProcedure [WF_CARDSGetCardsData]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_CARDSGetCardsData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_CARDSGetCardsData]
GO

/****** Object:  StoredProcedure [WF_CARDSGetData]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_CARDSGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_CARDSGetData]
GO

/****** Object:  StoredProcedure [WF_CARDSIsDayByCardNo]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_CARDSIsDayByCardNo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_CARDSIsDayByCardNo]
GO

/****** Object:  StoredProcedure [WF_DataFileDelete]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DataFileDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DataFileDelete]
GO

/****** Object:  StoredProcedure [WF_DataFileGetData]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DataFileGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DataFileGetData]
GO

/****** Object:  StoredProcedure [WF_DataFileGetDataByDateAndAroundTime]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DataFileGetDataByDateAndAroundTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DataFileGetDataByDateAndAroundTime]
GO

/****** Object:  StoredProcedure [WF_DataFileGetDataByDateAndTime]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DataFileGetDataByDateAndTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DataFileGetDataByDateAndTime]
GO

/****** Object:  StoredProcedure [WF_GetLimitManager]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetLimitManager]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GetLimitManager]
GO
/****** Object:  StoredProcedure [WF_DataFileGetDataByEmpNO]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DataFileGetDataByEmpNO]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DataFileGetDataByEmpNO]
GO

/****** Object:  StoredProcedure [WF_DataFileGetStartTime]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DataFileGetStartTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DataFileGetStartTime]
GO

/****** Object:  StoredProcedure [WF_RequestsIsExistDaily]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsIsExistDaily]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsIsExistDaily]
GO

/****** Object:  StoredProcedure [WF_DataFileInsert]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DataFileInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DataFileInsert]
GO

/****** Object:  StoredProcedure [WF_DataFileUpdate]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DataFileUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DataFileUpdate]
GO

/****** Object:  StoredProcedure [WF_DataFileUpdateByModify]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DataFileUpdateByModify]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DataFileUpdateByModify]
GO

/****** Object:  StoredProcedure [WF_Emp_GrpsGetData]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_Emp_GrpsGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_Emp_GrpsGetData]
GO

/****** Object:  StoredProcedure [WF_Emp_GrpsInsert]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_Emp_GrpsInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_Emp_GrpsInsert]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEE_ChangeLogin]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEE_ChangeLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEE_ChangeLogin]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEE_GetSubstitute]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEE_GetSubstitute]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEE_GetSubstitute]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEE_SetISKARMAND]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEE_SetISKARMAND]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEE_SetISKARMAND]
GO

/****** Object:  StoredProcedure [WF_EmployeeBySupervisor]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EmployeeBySupervisor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EmployeeBySupervisor]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEChangeActive]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEChangeActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEChangeActive]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetData]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEGetData]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetDataByEmpNO]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetDataByEmpNO]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEGetDataByEmpNO]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetDataByIdAndPassword]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetDataByIdAndPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEGetDataByIdAndPassword]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetManagersData]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetManagersData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEGetManagersData]
GO

/****** Object:  StoredProcedure [WF_EmployeeGetPerson]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EmployeeGetPerson]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EmployeeGetPerson]
GO

IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetPersonelData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEGetPersonelData]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetUnSelect]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetUnSelect]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEGetUnSelect]
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersDelete]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EmployeeManagersDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EmployeeManagersDelete]
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersDeleteAll]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EmployeeManagersDeleteAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EmployeeManagersDeleteAll]
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersGetData]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EmployeeManagersGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EmployeeManagersGetData]
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersGetDataByManager]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EmployeeManagersGetDataByManager]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EmployeeManagersGetDataByManager]
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersInsert]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EmployeeManagersInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EmployeeManagersInsert]
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersInsertAll]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EmployeeManagersInsertAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EmployeeManagersInsertAll]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEESetPasword]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEESetPasword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEESetPasword]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEESetSEmp]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEESetSEmp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEESetSEmp]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetDataByEmpNoForLogin]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetDataByEmpNoForLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEGetDataByEmpNoForLogin]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetDataByIdForLogin]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetDataByIdForLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEGetDataByIdForLogin]
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEUpdateEmployeeUserData]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEUpdateEmployeeUserData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEUpdateEmployeeUserData]
GO

/****** Object:  StoredProcedure [WF_FindShift]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_FindShift]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_FindShift]
GO

/****** Object:  StoredProcedure [WF_GetManagerReviewsByRequestID]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetManagerReviewsByRequestID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GetManagerReviewsByRequestID]
GO

/****** Object:  StoredProcedure [WF_GetRequestInfo]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetRequestInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GetRequestInfo]
GO

/****** Object:  StoredProcedure [WF_GetShiftIsHoliday]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetShiftIsHoliday]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GetShiftIsHoliday]
GO

/****** Object:  StoredProcedure [WF_GROUPSGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GROUPSGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GROUPSGetData]
GO

/****** Object:  StoredProcedure [WF_GROUPSGetDataByGrpNo]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GROUPSGetDataByGrpNo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GROUPSGetDataByGrpNo]
GO

/****** Object:  StoredProcedure [WF_ManagerAccessDelete]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ManagerAccessDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ManagerAccessDelete]
GO

/****** Object:  StoredProcedure [WF_ManagerAccessDeleteSection]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ManagerAccessDeleteSection]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ManagerAccessDeleteSection]
GO

/****** Object:  StoredProcedure [WF_ManagerAccessGetAcction]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ManagerAccessGetAcction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ManagerAccessGetAcction]
GO

/****** Object:  StoredProcedure [WF_ManagerAccessGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ManagerAccessGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ManagerAccessGetData]
GO

/****** Object:  StoredProcedure [WF_ManagerAccessGetDataBySec]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ManagerAccessGetDataBySec]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ManagerAccessGetDataBySec]
GO

/****** Object:  StoredProcedure [WF_ManagerAccessInsert]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ManagerAccessInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ManagerAccessInsert]
GO

/****** Object:  StoredProcedure [WF_MixFindShift]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MixFindShift]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_MixFindShift]
GO

/****** Object:  StoredProcedure [WF_MOR_MAMGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MOR_MAMGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_MOR_MAMGetData]
GO

/****** Object:  StoredProcedure [WFUserAccessTime_Insert]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WFUserAccessTime_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WFUserAccessTime_Insert]
GO

/****** Object:  StoredProcedure [WFAccessTimeGroup_Delete]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WFAccessTimeGroup_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WFAccessTimeGroup_Delete]
GO

IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetTimeTypeByEmpNo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GetTimeTypeByEmpNo]
GO

/****** Object:  StoredProcedure [WFAccessTimeGroup_Update]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WFAccessTimeGroup_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WFAccessTimeGroup_Update]
GO

/****** Object:  StoredProcedure [WF_MOR_MAMGetDataByEmpNo]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MOR_MAMGetDataByEmpNo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_MOR_MAMGetDataByEmpNo]
GO

/****** Object:  StoredProcedure [WF_MOR_MAMInsert]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MOR_MAMInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_MOR_MAMInsert]
GO

/****** Object:  StoredProcedure [WF_MorMamGetDataByM_M_Date]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MorMamGetDataByM_M_Date]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_MorMamGetDataByM_M_Date]
GO

/****** Object:  StoredProcedure [WF_MorMamGetDataByM_M_Date_Main]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MorMamGetDataByM_M_Date_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_MorMamGetDataByM_M_Date_Main]
GO

/****** Object:  StoredProcedure [WF_MorMamGetRemedialDataByEmpNo]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MorMamGetRemedialDataByEmpNo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_MorMamGetRemedialDataByEmpNo]
GO

/****** Object:  StoredProcedure [WF_SubstituteInsert]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SubstituteInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SubstituteInsert]
GO

/****** Object:  StoredProcedure [WF_MorMamIsExist]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MorMamIsExist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_MorMamIsExist]
GO

/****** Object:  StoredProcedure [WF_MorTimeGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MorTimeGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_MorTimeGetData]
GO

/****** Object:  StoredProcedure [WF_OperationTypesGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_OperationTypesGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_OperationTypesGetData]
GO

/****** Object:  StoredProcedure [WF_OperationTypesInsert]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_OperationTypesInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_OperationTypesInsert]
GO

/****** Object:  StoredProcedure [WF_OVERSGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_OVERSGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_OVERSGetData]
GO

/****** Object:  StoredProcedure [WF_OVERSGetDataByEmpNo]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_OVERSGetDataByEmpNo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_OVERSGetDataByEmpNo]
GO

/****** Object:  StoredProcedure [WF_OVERSInsert]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_OVERSInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_OVERSInsert]
GO

/****** Object:  StoredProcedure [WF_OVERSUpdate]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_OVERSUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_OVERSUpdate]
GO

/****** Object:  StoredProcedure [WF_PARMFILEGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_PARMFILEGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_PARMFILEGetData]
GO

/****** Object:  StoredProcedure [WF_RequestChangeCurEmp_NO]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestChangeCurEmp_NO]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestChangeCurEmp_NO]
GO

/****** Object:  StoredProcedure [WF_RequestGetByManagerEmpNo]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestGetByManagerEmpNo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestGetByManagerEmpNo]
GO

IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_UsersGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_UsersGetById]
GO

/****** Object:  StoredProcedure [WF_RequestsAcceptRequest]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsAcceptRequest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsAcceptRequest]
GO

/****** Object:  StoredProcedure [WFAccessTimeGroup_Select]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WFAccessTimeGroup_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WFAccessTimeGroup_Select]
GO

/****** Object:  StoredProcedure [WFUserAccessTime_Select]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WFUserAccessTime_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WFUserAccessTime_Select]
GO

/****** Object:  StoredProcedure [WFAccessTimeGroup_Insert]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WFAccessTimeGroup_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WFAccessTimeGroup_Insert]
GO

/****** Object:  StoredProcedure [WF_RequestsDelete]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsDelete]
GO

/****** Object:  StoredProcedure [WF_RequestsGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsGetData]
GO

/****** Object:  StoredProcedure [WF_RequestsGetDataByDate]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsGetDataByDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsGetDataByDate]
GO

/****** Object:  StoredProcedure [WF_UpdatePARMFILE]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_UpdatePARMFILE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_UpdatePARMFILE]
GO

/****** Object:  StoredProcedure [WF_GetSubmitCountRequest]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetSubmitCountRequest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GetSubmitCountRequest]
GO

/****** Object:  StoredProcedure [WF_FindNearDataFile]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_FindNearDataFile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_FindNearDataFile]
GO

/****** Object:  StoredProcedure [WF_RequestsGetDataByDateAndTime]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsGetDataByDateAndTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsGetDataByDateAndTime]
GO

/****** Object:  StoredProcedure [WF_RequestsGetDataByEmployeeNumber]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsGetDataByEmployeeNumber]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsGetDataByEmployeeNumber]
GO

/****** Object:  StoredProcedure [WF_RequestsGetDataByID]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsGetDataByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsGetDataByID]
GO

/****** Object:  StoredProcedure [WF_RequestsGetDataByStartDateAndEndDate]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsGetDataByStartDateAndEndDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsGetDataByStartDateAndEndDate]
GO

/****** Object:  StoredProcedure [WF_GetTimeType]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetTimeType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GetTimeType]
GO

/****** Object:  StoredProcedure [WF_RequestsGetDataBySupervisor]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsGetDataBySupervisor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsGetDataBySupervisor]
GO

/****** Object:  StoredProcedure [WF_RequestsInsert]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsInsert]
GO

/****** Object:  StoredProcedure [WF_RequestsIsExist]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsIsExist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsIsExist]
GO

/****** Object:  StoredProcedure [WF_RequestsUpdate]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsUpdate]
GO

/****** Object:  StoredProcedure [WF_ReviewsGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ReviewsGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ReviewsGetData]
GO

/****** Object:  StoredProcedure [WF_ReviewsGetDataByID]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ReviewsGetDataByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ReviewsGetDataByID]
GO

/****** Object:  StoredProcedure [WF_ReviewsInsert]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ReviewsInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ReviewsInsert]
GO

/****** Object:  StoredProcedure [WF_ReviewsUpdate]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ReviewsUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ReviewsUpdate]
GO

/****** Object:  StoredProcedure [WF_SECTIONS_GetSubstitute]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SECTIONS_GetSubstitute]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SECTIONS_GetSubstitute]
GO

/****** Object:  StoredProcedure [WF_SECTIONS_IsSubstitute]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SECTIONS_IsSubstitute]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SECTIONS_IsSubstitute]
GO

/****** Object:  StoredProcedure [WF_SECTIONS_Update]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SECTIONS_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SECTIONS_Update]
GO

/****** Object:  StoredProcedure [WF_SECTIONSGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SECTIONSGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SECTIONSGetData]
GO

/****** Object:  StoredProcedure [WF_SectionsGetManagerBySubstitute]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SectionsGetManagerBySubstitute]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SectionsGetManagerBySubstitute]
GO

/****** Object:  StoredProcedure [WF_SECTIONSSetSEmp]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SECTIONSSetSEmp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SECTIONSSetSEmp]
GO

/****** Object:  StoredProcedure [WF_SelectManager]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SelectManager]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SelectManager]
GO

/****** Object:  StoredProcedure [WF_SelectOperationTypes]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SelectOperationTypes]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SelectOperationTypes]
GO

/****** Object:  StoredProcedure [WF_SHIFTSGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SHIFTSGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SHIFTSGetData]
GO

/****** Object:  StoredProcedure [WF_SHIFTSGetDataByShiftNo]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SHIFTSGetDataByShiftNo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SHIFTSGetDataByShiftNo]
GO

/****** Object:  StoredProcedure [WF_UsersGetData]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_UsersGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_UsersGetData]
GO

/****** Object:  StoredProcedure [WF_UsersGetDataByIdAndPassword]    Script Date: 11/24/2009 17:29:09 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_UsersGetDataByIdAndPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_UsersGetDataByIdAndPassword]
GO
/****** Object:  StoredProcedure [FindGrpShift]    Script Date: 11/24/2009 17:42:01 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[FindGrpShift]') AND type in (N'P', N'PC'))
DROP PROCEDURE [FindGrpShift]
GO

/****** Object:  StoredProcedure [GetRemainKardex]    Script Date: 11/24/2009 17:42:01 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[GetRemainKardex]') AND type in (N'P', N'PC'))
DROP PROCEDURE [GetRemainKardex]
GO

/****** Object:  StoredProcedure [Mor_Time]    Script Date: 11/24/2009 17:42:01 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[Mor_Time]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mor_Time]
GO

/****** Object:  StoredProcedure [MorTime]    Script Date: 11/24/2009 17:42:01 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[MorTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [MorTime]
GO

/****** Object:  StoredProcedure [sp_FindGrpShift]    Script Date: 11/24/2009 17:42:01 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[sp_FindGrpShift]') AND type in (N'P', N'PC'))
DROP PROCEDURE [sp_FindGrpShift]
GO

/****** Object:  StoredProcedure [Sp_MixFindShift]    Script Date: 11/24/2009 17:42:01 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[Sp_MixFindShift]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Sp_MixFindShift]
GO

/****** Object:  StoredProcedure [UsedMorMam]    Script Date: 11/24/2009 17:42:01 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[UsedMorMam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [UsedMorMam]
GO

/****** Object:  StoredProcedure [FindGrpShift]    Script Date: 11/24/2009 17:42:01 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

/****** Object:  StoredProcedure [Sp_MixFindShift]    Script Date: 11/24/2009 17:42:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Sp_MixFindShift]
    @GroupFirst int output,
    @Emp_No bigint,
    @DateStart Float,
    @Year_ int,
    @Month_ int,
    @Day_ int,
    @ShiftNew int output,
    @Calen_T int output
AS
if (select is_uniq from employee where emp_no=@emp_no) = 0
begin
  Declare @Tat int
  set @ShiftNew   = 0
  set @Calen_T    = 0 
  set @Tat            = 0
  if ((SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (Date_<= @DateStart)  order by Date_ DESC)>0)  
    set @GroupFirst = (SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (Date_<= @DateStart)  order by Date_ desc)
 ELSE SET @GroupFirst= (SELECT e.GRP_NO FROM EMPLOYEE e WHERE e.EMP_NO=@Emp_No)

    set @Calen_T = isnull((Select P_Tat from Groups where Grp_No=@GroupFirst),0)

    EXEC ('DECLARE GrpShift_Cur CURSOR FOR SELECT GrpShift_Day' + @Day_ +
         ' From GrpShift Where GrpShift_Year=' + @Year_ + ' and GrpShift_Month='+@Month_+' and GrpShift_GrpNo='+@GroupFirst
         + ' OPEN GrpShift_Cur')
    FETCH NEXT FROM GrpShift_Cur into @ShiftNew


    CLOSE GrpShift_Cur
    DEALLOCATE GrpShift_Cur
end
else
begin
   set @ShiftNew   = -3
    EXEC ('DECLARE Emp_Shif_Cur CURSOR FOR SELECT S' + @Day_ +
         ' From Emp_Shif Where Year_=' + @Year_ + ' and Month_='+@Month_+' and Emp_no='+@Emp_No
         + ' OPEN Emp_Shif_Cur')
    FETCH NEXT FROM Emp_Shif_Cur into @ShiftNew

    CLOSE Emp_Shif_Cur
    DEALLOCATE Emp_Shif_Cur
end
GO

CREATE PROCEDURE [FindGrpShift]
    @GroupFirst int output,
    @Emp_No float,
    @DateStart Float,
    @Year_ int,
    @Month_ int,
    @Day_ int,
   @ShiftNew int output,
   @Calen_T int output
AS
  Declare @Tat int
  set @ShiftNew   = 0
  set @Calen_T    = 0 
  set @Tat        = 0
  SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (Date_<= @DateStart)  order by Date_ desc

  if (@@ROWCOUNT<>0)  
    set @GroupFirst = (SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (Date_<= @DateStart)  order by Date_ desc)


    set @Calen_T = isnull((Select P_Tat from Groups where Grp_No=@GroupFirst),0)

    EXEC ('DECLARE GrpShift_Cur CURSOR FOR SELECT GrpShift_Day' + @Day_ +
         ' From GrpShift Where GrpShift_Year=' + @Year_ + ' and GrpShift_Month='+@Month_+' and GrpShift_GrpNo='+@GroupFirst
         + ' OPEN GrpShift_Cur')
    FETCH NEXT FROM GrpShift_Cur into @ShiftNew


    CLOSE GrpShift_Cur
    DEALLOCATE GrpShift_Cur
/*
    if (@shiftNew<>0)  
    begin
      if not (@ShiftNew>=50) and (@ShiftNew<=52)
        if @Calen_T = 1 
        begin
          EXEC ('DECLARE Calen_Cur CURSOR FOR SELECT D' + @Day_ +
                ' From CALEN Where Year_=' + @Year_ + ' And Month_=' + @Month_
              + ' OPEN Calen_Cur')
          FETCH NEXT FROM Calen_Cur into @Tat
          CLOSE Calen_Cur
          DEALLOCATE Calen_Cur
          if (@Tat =3) or (@Tat=2)
            set @ShiftNew = 50 
      end
    end
*/
--RETURN @ShiftNew


GO

/****** Object:  StoredProcedure [GetRemainKardex]    Script Date: 11/24/2009 17:42:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [GetRemainKardex]
	@Emp_No FLOAT
AS
	IF ((SELECT TOP 1 ISNULL(p.IS_MOR_DAY, 0) FROM   PARMFILE p) = 0)
	BEGIN
	    SELECT dbo.Min2Time(SUM(CASE WHEN mm.INC_TYP >= 6 THEN dbo.Time2Min(mm.REQUESTED)
	                        ELSE - 1 * dbo.Time2Min(mm.REQUESTED)END)) RemainKardex,0 IS_MOR_DAY
	    FROM   (SELECT e.EMP_NO, CAST(GETDATE() AS FLOAT) S_DATE, 7 AS INC_TYP, ISNULL(e.ESTEH_SAVE,0) REQUESTED, 57 TYP
	               FROM   EMPLOYEE e WHERE  e.EMP_NO = @Emp_No
	                UNION ALL
	               SELECT mm.EMP_NO, mm.S_DATE, mm.INC_TYP, mm.REQUESTED, mm.TYP FROM   MOR_MAM mm
	               WHERE  mm.EMP_NO = @Emp_No AND mm.S_DATE >= (SELECT p.M_M_DATE FROM   PARMFILE p)AND mm.TYP = 57
	    	    ) mm
	END
	ELSE
	BEGIN
	    SELECT (SUM(CASE WHEN mm.INC_TYP >= 6 THEN (mm.REQUESTED)ELSE - 1 * (mm.REQUESTED)END)) RemainKardex,1 IS_MOR_DAY
	    FROM   (SELECT e.EMP_NO, CAST(GETDATE() AS FLOAT) S_DATE, 7 AS INC_TYP, ISNULL(e.ESTEH_SAVE,0) REQUESTED, 57 TYP
	               FROM   EMPLOYEE e WHERE  e.EMP_NO = @Emp_No
	               UNION ALL
	               SELECT mm.EMP_NO, mm.S_DATE, mm.INC_TYP, mm.REQUESTED, mm.TYP  FROM   MOR_MAM mm
	               WHERE  mm.EMP_NO = @Emp_No AND mm.S_DATE >= (SELECT p.M_M_DATE FROM   PARMFILE p)AND mm.TYP = 57
	           ) mm
	END
GO

/****** Object:  StoredProcedure [Mor_Time]    Script Date: 11/24/2009 17:42:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE procedure [Mor_Time](@Emp_no bigint,@DateS float, @DateE float, @ShamsiDate nvarchar(10),@ISKabise bit)
As
Begin
--  declare  @DateS float
--  declare  @DateE float
--  declare  @ShamsiDate nvarchar(10)
--  declare  @Emp_no  bigint 
  declare  @Grp_No int
  declare  @Shift_No int
  declare  @Is_uniq bit
  declare  @TAT_RASMI int
  declare  @TAT_RASMI2 int
  declare  @TmpD Real
  declare  @NumDay int
  declare  @T1 int
  declare  @T2 int
  declare  @Ti_ int
  declare  @Mor_Kasr int
  declare  @Kasr_Esth int
  declare  @Kasr_Gh int
  declare  @Hs_KasrEsth int
  declare  @RAMEZAN_T int
  declare  @RAMEZAN_E5 int
  declare  @RAMEZAN_S int
  declare  @End5_Time int
  declare  @Start_Time int
  declare  @Shif_Time int
  declare  @DateCur Float
  declare  @SumMorTime Int
  declare  @Year_  int
  declare  @Month_ int
  declare  @Day_ int
  declare  @Calen_T int
  set  @TAT_RASMI = 50
  set  @TAT_RASMI2 = 52
  set  @SumMorTime=0
--  set  @DateS = 39719
--  set  @DateE = 39720
--  set  @Emp_no  = 10412820
--  set  @ShamsiDate = '13870707'
  set  @DateCur = @DateS
  DECLARE Employee_Cursor CURSOR FOR
  SELECT  Grp_No,Is_uniq FROM Employee where Emp_No=@Emp_No
  OPEN Employee_Cursor
  FETCH NEXT FROM Employee_Cursor into @Grp_No,@Is_uniq
  while (@DateCur<=@DateE)
  begin
    set  @Year_  = Cast(SubString(@ShamsiDate,1,4) as int)
    set  @Month_ = Cast(SubString(@ShamsiDate,5,2) as int)
    set  @Day_ = Cast(SubString(@ShamsiDate,7,2) as int)
    exec Sp_MixFindShift @Grp_No out,@Emp_No,@DateCur,@Year_,@Month_,@Day_,@Shift_No out,@Calen_T
    if @Shift_No=0 
    begin
     set @SumMorTime = -2
      break
    end
    else if @Shift_No=-3 
    begin
     set @SumMorTime = -3
      break
    end
    set  @numDay = DATEPART(dw, @DateCur-2)
    set @Ti_ = 0 
    set @TmpD = @DateCur
    if (@Is_uniq=0) 
    begin
      DECLARE Group_Cursor CURSOR FOR
      SELECT  Mor_Kasr,Kasr_Esth,Hs_KasrEsth FROM Groups where Grp_No=@Grp_No
      OPEN Group_Cursor
      FETCH NEXT FROM Group_Cursor into @Mor_Kasr,@Kasr_Esth,@Hs_KasrEsth
    end  
    else
    begin
      DECLARE Group_Cursor CURSOR FOR
      SELECT  Mor_Kasr,Kasr_Esth,Hs_KasrEsth FROM Employee where Emp_No=@Emp_No
      OPEN Group_Cursor
      FETCH NEXT FROM Group_Cursor into @Mor_Kasr,@Kasr_Esth,@Hs_KasrEsth
    end
    DECLARE Shift_Cursor CURSOR FOR
    SELECT  Kasr_Gh,RAMEZAN_T,RAMEZAN_E5,RAMEZAN_S,End5_Time,Start_Time,Shif_Time FROM Shifts where Shift_No=@Shift_No
    OPEN Shift_Cursor
    FETCH NEXT FROM Shift_Cursor into @Kasr_Gh,@RAMEZAN_T,@RAMEZAN_E5,@RAMEZAN_S,@End5_Time,@Start_Time,@Shif_Time
    if  (dbo._IsRamezan(@TMPD+2)=1) and (@NumDay <> 5) and (dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=0) 
    begin
      if @Mor_Kasr = 3 
        set @Ti_ = @Kasr_Esth
      else if @Mor_Kasr= 2 
        set @Ti_ = @Kasr_Gh
      else if @Mor_Kasr = 1 
        set @Ti_ = @RAMEZAN_T
    end
    else if (@NumDay=5) and (dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=0) 
    begin
      if dbo._IsRamezan(@TMPD+2)=1
      begin 
        set @T2 = @RAMEZAN_E5
        set @T1 = @RAMEZAN_S
      end
      else
      begin 
        set @T2= @End5_Time
        set @T1= @Start_Time
      end
      if @Mor_Kasr = 3 
        set @Ti_ = @Kasr_Esth
      else if @Mor_Kasr = 2 
        set @Ti_ = dbo.TimeSub (@T2,@T1)
      else if @Mor_Kasr = 1 
        set @Ti_ = dbo.TimeSub (@T2,@T1)
      end--if
    else if (dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=1)
    and (dbo.BainEsteh(@Is_uniq,@Grp_No)=1) 
      set @Ti_ = 0
    else if (dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=1)
    and (dbo.BainEsteh(@Is_uniq,@Grp_No)=0) 
      set @Ti_ = @Hs_KasrEsth
    else
    begin
      set @Ti_=0
      if @Mor_Kasr = 3 
        set @Ti_ = @Kasr_Esth
      else if (@Mor_Kasr = 2) and (@NumDay=5) 
        set @Ti_ = @Shif_Time  
      else if @Mor_Kasr = 2 
        set @Ti_ = @Kasr_Gh
      else if @Mor_Kasr = 1 
        set @Ti_ = @Shif_Time
    end
    CLOSE Group_Cursor
    DEALLOCATE Group_Cursor
    CLOSE Shift_Cursor
    DEALLOCATE Shift_Cursor
    set @ShamsiDate = dbo.AddDate(@ShamsiDate,@ISKabise)
    set @DateCur = @DateCur + 1
    set @SumMorTime=dbo.TimePlus(@SumMorTime,@Ti_)
  end 
  CLOSE Employee_Cursor
  DEALLOCATE Employee_Cursor
  return(@SumMorTime)
end

GO

/****** Object:  StoredProcedure [MorTime]    Script Date: 11/24/2009 17:42:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [MorTime]
(
	@Emp_no bigint,
	@DateS float,
	@DateE float,
	@ShamsiDate nvarchar(10),
	@ISKabise bit
)
AS
BEGIN
    DECLARE @Grp_No int,
            @Shift_No int,
            @Is_uniq bit,
            @TAT_RASMI int,
            @TAT_RASMI2 int,
            @NumDay int,
            @T1 int,
            @T2 int,
            @Ti_ int,
            @Mor_Kasr int,
            @Kasr_Esth int,
            @Kasr_Gh int,
            @Hs_KasrEsth int,
            @RAMEZAN_T int,
            @RAMEZAN_E5 int,
            @RAMEZAN_S int,
            @End5_Time int,
            @Start_Time int,
            @Shif_Time int,
            @SumMorTime Int,
            @Year_  int,
            @Month_ int,
            @Day_ int,
            @Calen_T int            
    DECLARE @DateCur Float
    DECLARE @TmpD Real    
    
    SET @TAT_RASMI = 50
    SET @TAT_RASMI2 = 52
    SET @SumMorTime = 0
    SET @DateCur = @DateS
    
    DECLARE Employee_Cursor CURSOR  
    FOR
        SELECT Grp_No,
               Is_uniq
        FROM   Employee
        WHERE  Emp_No = @Emp_No
    OPEN Employee_Cursor
    FETCH NEXT FROM Employee_Cursor INTO @Grp_No,@Is_uniq
    WHILE (@DateCur<=@DateE)
    BEGIN
        SET @Year_ = Cast(SubString(@ShamsiDate,1,4) AS int)
        SET @Month_ = Cast(SubString(@ShamsiDate,5,2) AS int)
        SET @Day_ = Cast(SubString(@ShamsiDate,7,2) AS int)
        EXEC Sp_MixFindShift @Grp_No out,@Emp_No,@DateCur,@Year_,@Month_,@Day_,@Shift_No out,@Calen_T
        IF @Shift_No=0
        BEGIN
            SET @SumMorTime = -2
            BREAK
        END
        ELSE 
            IF @Shift_No=-3
            BEGIN
                SET @SumMorTime = -3
                BREAK
            END
        SET @numDay = DATEPART(dw, @DateCur-2)
        SET @Ti_ = 0 
        SET @TmpD = @DateCur
        IF (@Is_uniq=0 )
        BEGIN
            DECLARE Group_Cursor CURSOR  
            FOR
                SELECT Mor_Kasr,
                       Kasr_Esth,
                       Hs_KasrEsth
                FROM   Groups
                WHERE  Grp_No = @Grp_No
            OPEN Group_Cursor
            FETCH NEXT FROM Group_Cursor INTO @Mor_Kasr,@Kasr_Esth,@Hs_KasrEsth
        END
        ELSE 
        BEGIN
            DECLARE Group_Cursor CURSOR  
            FOR
                SELECT Mor_Kasr,
                       Kasr_Esth,
                       Hs_KasrEsth
                FROM   Employee
                WHERE  Emp_No = @Emp_No
            OPEN Group_Cursor
            FETCH NEXT FROM Group_Cursor INTO @Mor_Kasr,@Kasr_Esth,@Hs_KasrEsth
        END
        DECLARE Shift_Cursor CURSOR  
        FOR
            SELECT Kasr_Gh,
                   RAMEZAN_T,
                   RAMEZAN_E5,
                   RAMEZAN_S,
                   End5_Time,
                   Start_Time,
                   Shif_Time
            FROM   Shifts
            WHERE  Shift_No = @Shift_No
        OPEN Shift_Cursor
        FETCH NEXT FROM Shift_Cursor INTO @Kasr_Gh,@RAMEZAN_T,@RAMEZAN_E5,@RAMEZAN_S,@End5_Time,@Start_Time,@Shif_Time
        IF (dbo._IsRamezan(@TMPD+2)=1 )
           AND (@NumDay <> 5 )
           AND (
                   dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=0
               )
        BEGIN
            IF @Mor_Kasr = 3
                SET @Ti_ = @Kasr_Esth
            ELSE 
                IF @Mor_Kasr= 2
                    SET @Ti_ = @Kasr_Gh
                ELSE 
                    IF @Mor_Kasr = 1
                        SET @Ti_ = @RAMEZAN_T
        END
        ELSE 
            IF (@NumDay=5 )
               AND (
                       dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=0
                   )
            BEGIN
                IF dbo._IsRamezan(@TMPD+2)=1
                BEGIN
                    SET @T2 = @RAMEZAN_E5
                    SET @T1 = @RAMEZAN_S
                END
                ELSE 
                BEGIN
                    SET @T2 = @End5_Time
                    SET @T1 = @Start_Time
                END
                IF @Mor_Kasr = 3
                    SET @Ti_ = @Kasr_Esth
                ELSE 
                    IF @Mor_Kasr = 2
                        SET @Ti_ = dbo.TimeSub (@T2,@T1)
                    ELSE 
                        IF @Mor_Kasr = 1
                            SET @Ti_ = dbo.TimeSub (@T2,@T1)
            END--if
            
            ELSE 
                IF (
                           dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=1
                       )
                   AND (dbo.BainEsteh(@Is_uniq,@Grp_No)=1 )
                    SET @Ti_ = 0
                ELSE 
                    IF (
                               dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=1
                           )
                       AND (dbo.BainEsteh(@Is_uniq,@Grp_No)=0 )
                        SET @Ti_ = @Hs_KasrEsth
                    ELSE 
                    BEGIN
                        SET @Ti_ = 0
                        IF @Mor_Kasr = 3
                            SET @Ti_ = @Kasr_Esth
                        ELSE 
                            IF (@Mor_Kasr = 2 )
                               AND (@NumDay=5 )
                                SET @Ti_ = @Shif_Time
                            ELSE 
                                IF @Mor_Kasr = 2
                                    SET @Ti_ = @Kasr_Gh
                                ELSE 
                                    IF @Mor_Kasr = 1
                                        SET @Ti_ = @Shif_Time
                    END
        CLOSE Group_Cursor
        DEALLOCATE Group_Cursor
        CLOSE Shift_Cursor
        DEALLOCATE Shift_Cursor
        SET @ShamsiDate = dbo.AddDate(@ShamsiDate,@ISKabise)
        SET @DateCur = @DateCur + 1
        SET @SumMorTime = dbo.TimePlus(@SumMorTime,@Ti_)
    END 
    CLOSE Employee_Cursor
    DEALLOCATE Employee_Cursor
SELECT @SumMorTime SumMorTime,ISNULL(@Grp_No,0) Grp_No,@Shift_No Shift_No
END
GO
/****** Object:  StoredProcedure [sp_FindGrpShift]    Script Date: 11/24/2009 17:42:02 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [sp_FindGrpShift]
    @GroupFirst int output,
    @Emp_No float,
    @DateStart nvarchar(10),
    @Year_ int,
    @Month_ int,
    @Day_ int,
   @ShiftNew int output,
    @Calen_T int output
AS
  Declare @Tat int
  set @ShiftNew   = 0
  set @Calen_T    = 0 
  set @Tat        = 0
  SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (cast(Date_ as DateTime ) - 2 <= @DateStart)  order by Date_  desc

  if (@@ROWCOUNT<>0)   
  set @GroupFirst = (SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (cast(Date_ as DateTime ) - 2<= @DateStart)  order by Date_  desc)

    EXEC ('DECLARE GrpShift_Cur CURSOR FOR SELECT GrpShift_Day' + @Day_ +
         ' From GrpShift Where GrpShift_Year=' + @Year_ + ' and GrpShift_Month='+@Month_+' and GrpShift_GrpNo='+@GroupFirst
         + ' OPEN GrpShift_Cur')
    FETCH NEXT FROM GrpShift_Cur into @ShiftNew


    CLOSE GrpShift_Cur
    DEALLOCATE GrpShift_Cur


GO


/****** Object:  StoredProcedure [UsedMorMam]    Script Date: 11/24/2009 17:42:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [UsedMorMam] 
  @Emp_No float, @typ int,
  @S_date float,@E_date float
AS
--old  calc
  --select ISNULL(sum((E_Date-S_Date)+1),0) Remain from mor_mam where typ=@typ and Emp_No=@Emp_No AND (S_DATE BETWEEN @S_date AND @E_date OR E_DATE BETWEEN @S_date AND @E_date) and E_date <> 0
  
--new  calc form multi years
SELECT ISNULL(sum((E_Date-S_Date)+1),0) Remain  FROM (
SELECT	CASE when S_DATE<@S_date THEN @S_date ELSE S_DATE END S_DATE,
		CASE when e_date>@E_date THEN @E_date ELSE E_DATE END E_DATE
  from mor_mam where typ=@typ and Emp_No=@Emp_No AND (S_DATE BETWEEN @S_date AND @E_date OR E_DATE BETWEEN @S_date AND @E_date) and E_date <> 0
  )dt
GO

/****** Object:  StoredProcedure [WF_MixFindShift]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_MixFindShift]
    @GroupFirst int output,
    @Emp_No bigint,
    @DateStart Float,
    @Year_ int,
    @Month_ int,
    @Day_ int,
    @ShiftNew int output,
    @Calen_T int output
AS
if (select is_uniq from employee where emp_no=@emp_no) = 0
begin
  Declare @Tat int
  set @ShiftNew   = 0
  set @Calen_T    = 0 
  set @Tat            = 0

  if ((SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (Date_<= @DateStart)  order by Date_ DESC)>0)  
    set @GroupFirst = (SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (Date_<= @DateStart)  order by Date_ desc)


    set @Calen_T = isnull((Select P_Tat from Groups where Grp_No=@GroupFirst),0)

    EXEC ('DECLARE GrpShift_Cur CURSOR FOR SELECT GrpShift_Day' + @Day_ +
         ' From GrpShift Where GrpShift_Year=' + @Year_ + ' and GrpShift_Month='+@Month_+' and GrpShift_GrpNo='+@GroupFirst
         + ' OPEN GrpShift_Cur')
    FETCH NEXT FROM GrpShift_Cur into @ShiftNew


    CLOSE GrpShift_Cur
    DEALLOCATE GrpShift_Cur
end
else
begin
   set @ShiftNew   = -3
    EXEC ('DECLARE Emp_Shif_Cur CURSOR FOR SELECT S' + @Day_ +
         ' From Emp_Shif Where Year_=' + @Year_ + ' and Month_='+@Month_+' and Emp_no='+@Emp_No
         + ' OPEN Emp_Shif_Cur')
    FETCH NEXT FROM Emp_Shif_Cur into @ShiftNew

    CLOSE Emp_Shif_Cur
    DEALLOCATE Emp_Shif_Cur
end
GO
/****** Object:  StoredProcedure [WF_CARDSGetCardsData]    Script Date: 11/24/2009 17:29:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_CARDSGetCardsData]
@is_day	BIT
AS
SELECT ID,
       REPORT_NO,
       PARM_NAME,
       Karkerd_Name,
       R2T_NAME,
       CARD_NO,
       OneTitle,
       TITLE,
       SUB_TITLE,
       REP_ACTIVE,
       SYS_ACTIVE,
       CARD_TYPE,
       IS_DAY,
       R_S_TYPE,
       SELECTED,
       ROUNDED,
       FirstTitle,
       Amalkard,
       IsAmalkard,
       KarkerdName
FROM   CARDS
WHERE  (
           (IS_DAY = @is_day)
           AND (CARD_TYPE IN (3, 5))
           OR (IS_DAY = @is_day)
           AND (CARD_NO IN (30, 5, 2))
       )
       AND (SYS_ACTIVE = 1)
GO

/****** Object:  StoredProcedure [WF_CARDSGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_CARDSGetData]
@card_type SMALLINT,
@is_day	BIT
AS
SELECT ID,
       REPORT_NO,
       PARM_NAME,
       Karkerd_Name,
       R2T_NAME,
       CARD_NO,
       OneTitle,
       TITLE,
       SUB_TITLE,
       REP_ACTIVE,
       SYS_ACTIVE,
       CARD_TYPE,
       IS_DAY,
       R_S_TYPE,
       SELECTED,
       ROUNDED,
       FirstTitle,
       Amalkard,
       IsAmalkard,
       KarkerdName
FROM   CARDS
WHERE  (CARD_TYPE = @card_type)
       AND (IS_DAY = @is_day)
       AND (SYS_ACTIVE = 1)
GO

/****** Object:  StoredProcedure [WF_CARDSIsDayByCardNo]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_CARDSIsDayByCardNo]
@card_no SMALLINT
AS
SELECT     IS_DAY
FROM         CARDS
WHERE     (CARD_NO = @card_no)
GO

/****** Object:  StoredProcedure [WF_DataFileDelete]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_DataFileDelete]
@Date FLOAT,
@Time SMALLINT,
@Emp_NO	FLOAT
AS
DELETE FROM DataFile WHERE DATE_=@Date AND TIME_=@Time AND EMP_NO=@Emp_NO
GO

/****** Object:  StoredProcedure [WF_DataFileGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_DataFileGetData]
AS
SELECT     STATUS, DATE_, TIME_, EMP_NO, MODIFY, Clock_No, SR_Type, Direction
FROM         DataFile
GO

/****** Object:  StoredProcedure [WF_DataFileGetDataByDateAndAroundTime]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_DataFileGetDataByDateAndAroundTime]
@Emp_No FLOAT,
@Date_	FLOAT,
@StartTime SMALLINT,
@EndTime SMALLINT
AS
SELECT DISTINCT DataFile.Clock_No, DataFile.Direction, DataFile.EMP_NO, DataFile.MODIFY, 
       DataFile.SR_Type, DataFile.STATUS, DataFile.TIME_, CAST(DataFile.DATE_ AS DATETIME) 
       - 2 AS DATE_, CARDS.TITLE AS CARDSTITLE
FROM   DataFile
       LEFT OUTER JOIN CARDS
            ON  DataFile.STATUS = CARDS.CARD_NO
WHERE  (DataFile.EMP_NO = @Emp_No)
       AND (DataFile.DATE_ = @Date_)
       AND dbo.Time2Min(DataFile.TIME_) BETWEEN dbo.Time2Min(@StartTime)AND dbo.Time2Min(@EndTime)
ORDER BY
       DataFile.TIME_
GO

/****** Object:  StoredProcedure [WF_DataFileGetDataByDateAndTime]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/************************************************************
 * Code formatted by SoftTree SQL Assistant © v4.1.8
 * Time: 2008/12/31 04:34:34 ق.ظ
 ************************************************************/

CREATE PROC [WF_DataFileGetDataByDateAndTime]
@emp_no FLOAT,
@Date_	FLOAT,
@Time_	SMALLINT
AS
SELECT DataFile.Clock_No,
       DataFile.Direction,
       DataFile.EMP_NO,
       DataFile.MODIFY,
       DataFile.SR_Type,
       DataFile.STATUS,
       DataFile.TIME_,
       CAST(DataFile.DATE_ AS DATETIME) -2 AS DATE_,
       CARDS.TITLE AS CARDSTITLE
FROM   DataFile
       LEFT OUTER JOIN CARDS
            ON  DataFile.STATUS = CARDS.CARD_NO
WHERE  (DataFile.EMP_NO = @emp_no)
       AND (DataFile.DATE_ = @Date_)
       AND (DataFile.Time_ = @Time_)
GO

/****** Object:  StoredProcedure [WF_DataFileGetDataByEmpNO]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_DataFileGetDataByEmpNO]
@emp_no FLOAT,
@Date_	FLOAT
AS
SELECT DISTINCT DataFile.Clock_No,
       DataFile.Direction,
       DataFile.EMP_NO,
       DataFile.MODIFY,
       DataFile.SR_Type,
       DataFile.STATUS,
       DataFile.TIME_,
       CAST(DataFile.DATE_ AS DATETIME) -2 AS DATE_,
       CARDS.TITLE AS CARDSTITLE
FROM   DataFile
       LEFT OUTER JOIN CARDS
            ON  DataFile.STATUS = CARDS.CARD_NO
WHERE  (DataFile.EMP_NO = @emp_no)
       AND (DataFile.DATE_ = @Date_)
ORDER BY DataFile.TIME_
GO

/****** Object:  StoredProcedure [WF_DataFileGetStartTime]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/************************************************************
 * Code formatted by Maysam.Chegini@gmil.com
 * Time: 2009/07/04 05:04:12 ب.ظ
 ************************************************************/

CREATE PROCEDURE [WF_DataFileGetStartTime]
	@Shift_No NVARCHAR(10),
	@Emp_no BIGINT,
	@DateS FLOAT
AS
	
	IF EXISTS(SELECT * FROM   SHIFTS s WHERE  s.SHIFT_NO = @Shift_No AND s.END_TIME > 2400)
	
		SELECT TOP 1 * FROM (SELECT *,
		NewTime = CASE df.DATE_ WHEN @DateS + 1 THEN df.TIME_+2400 ELSE df.TIME_ END  FROM DataFile df 
		WHERE df.EMP_NO=@Emp_no AND df.[STATUS]<>100 AND( df.DATE_=@DateS OR df.DATE_ = @DateS + 1) ) DF
		WHERE DF.NewTime > (SELECT TOP 1 s.START_TIME FROM   SHIFTS s WHERE  s.SHIFT_NO = @Shift_No) 
		ORDER BY DF.DATE_,DF.TIME_
	           
	ELSE
		SELECT TOP 1 * FROM DataFile df WHERE  df.EMP_NO = @Emp_no AND df.[STATUS] <> 100 
		AND (df.DATE_ = @DateS) AND df.TIME_>(SELECT TOP 1 s.START_TIME
	        FROM   SHIFTS s WHERE  s.SHIFT_NO = @Shift_No)
GO

/****** Object:  StoredProcedure [WF_DataFileInsert]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_DataFileInsert]
	@STATUS	smallint,
	@DATE_	float,
	@TIME_	smallint,
	@EMP_NO	float,
	@MODIFY	bit,
	@Clock_No	smallint
AS
	INSERT INTO [DataFile]
	(
		[STATUS],
		[DATE_],
		[TIME_],
		[EMP_NO],
		[MODIFY],
		[Clock_No]
	)VALUES(
		@STATUS,
		@DATE_,
		@TIME_,
		@EMP_NO,
		@MODIFY,
		@Clock_No
	)
GO

/****** Object:  StoredProcedure [WF_DataFileUpdate]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_DataFileUpdate]
	@DATE FLOAT,
	@TIME SMALLINT,
	@EMP_NO FLOAT,
	@STATUS SMALLINT,
	@MODIFY BIT
AS
	UPDATE DataFile
	SET    [STATUS] = @STATUS,
	       [MODIFY] = @MODIFY
	WHERE  DATE_ = @DATE
	       AND TIME_ = @TIME
	       AND EMP_NO = @EMP_NO
GO

/****** Object:  StoredProcedure [WF_DataFileUpdateByModify]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_DataFileUpdateByModify]
	@DATE	float,
	@OldTIME smallint,
	@NewTIME smallint,	
	@EMP_NO	float,
	@STATUS	smallint,
	@MODIFY	bit
AS
	UPDATE DataFile
	Set
		[STATUS]=@STATUS,
		[TIME_]=@NewTIME,
		[MODIFY]=@MODIFY
	Where
	(
		[DATE_]=@DATE
		And
		[TIME_]=@OldTIME
		And
		[EMP_NO]=@EMP_NO
	)
GO

/****** Object:  StoredProcedure [WF_Emp_GrpsGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_Emp_GrpsGetData]
AS
SELECT     Emp_No, Date_, Grp_No, Prev_Grp
FROM         Emp_Grps
GO

/****** Object:  StoredProcedure [WF_Emp_GrpsInsert]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_Emp_GrpsInsert]
	@Emp_No FLOAT,
	@Date_ FLOAT,
	@Grp_No SMALLINT,
	@Prev_Grp SMALLINT
AS
    DELETE 
    FROM   Emp_Grps
    WHERE  Emp_No = @Emp_No
           AND Date_ = @Date_
	
	INSERT INTO [Emp_Grps]
	  (
	    [Emp_No],
	    [Date_],
	    [Grp_No],
	    [Prev_Grp]
	  )
	VALUES
	  (
	    @Emp_No,
	    @Date_,
	    @Grp_No,
	    @Prev_Grp
	  )
GO

/****** Object:  StoredProcedure [WF_EMPLOYEE_ChangeLogin]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_EMPLOYEE_ChangeLogin]
@Emp_NO FLOAT,
@UserCode NVARCHAR(100),
@Pass	NVARCHAR(100)
AS
UPDATE EMPLOYEE
SET WFUserName = @UserCode,WFUserPass = @Pass
WHERE EMP_NO=@EMP_NO
GO

/****** Object:  StoredProcedure [WF_EMPLOYEE_SetISKARMAND]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_EMPLOYEE_SetISKARMAND]
	@If_EMP_NO	float,
	@IS_KARMAND	smallint
AS
	UPDATE EMPLOYEE
	Set
		[IS_KARMAND]=@IS_KARMAND
	Where
	(
		[EMP_NO]=@If_EMP_NO
	)
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEChangeActive]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_EMPLOYEEChangeActive]
@EMP_NO	FLOAT,
@SYS_ACTIVE	BIT
AS
UPDATE    EMPLOYEE
SET              SYS_ACTIVE = @SYS_ACTIVE
WHERE     (EMP_NO = @EMP_NO)
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_EMPLOYEEGetData]
AS
SELECT * FROM WF_GetEmployee_VI wgev
ORDER BY wgev.EMP_NO

GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetDataByEmpNO]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_EMPLOYEEGetDataByEmpNO]
@EMP_NO	FLOAT
AS
SELECT    *
FROM         EMPLOYEE
WHERE     (EMP_NO = @Emp_no)
GO

/****** Object:  StoredProcedure [WF_EMPLOYEEGetUnSelect]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_EMPLOYEEGetUnSelect]
@ManagerEmp_No	FLOAT,
@OperationsID INT
AS
IF(@OperationsID=0)
BEGIN
SELECT e.EMP_NO,e.[NAME],e.FAMILY,e.SEC_NO,e.[NAME]+' '+e.FAMILY+' '+LTRIM(STR(e.EMP_NO)) FullName,
       (SELECT s.TITLE FROM SECTIONS s WHERE s.SEC_NO=e.SEC_NO) AS TITLE
       ,LTRIM(STR(e.EMP_NO))+'#'+LTRIM(ISNULL(e.GRP_NO,0)) EmpInfo,0 AS IsCheck
FROM   EMPLOYEE e
WHERE  e.IsCut = 0
       AND e.SYS_ACTIVE = 1
       AND e.EMP_NO NOT IN (SELECT em.Emp_No
                            FROM   EmployeeManagers em
                            WHERE  em.ManagerEmp_No = @ManagerEmp_No
                                   AND em.ManagerEmp_No = @ManagerEmp_No)
ORDER BY e.SEC_NO	
END
ELSE 
BEGIN
SELECT e.EMP_NO,e.[NAME],e.FAMILY,e.SEC_NO,e.[NAME]+' '+e.FAMILY+' '+LTRIM(STR(e.EMP_NO)) FullName,
       (SELECT s.TITLE FROM SECTIONS s WHERE s.SEC_NO=e.SEC_NO) AS TITLE
       ,LTRIM(STR(e.EMP_NO))+'#'+LTRIM(ISNULL(e.GRP_NO,0)) EmpInfo,0 AS IsCheck
FROM   EMPLOYEE e
WHERE  e.IsCut = 0
       AND e.SYS_ACTIVE = 1
       AND e.EMP_NO NOT IN (SELECT em.Emp_No
                            FROM   EmployeeManagers em
                            WHERE  em.ManagerEmp_No = @ManagerEmp_No
                                   AND em.OperationsID=@OperationsID)
ORDER BY e.SEC_NO
END

GO

/****** Object:  StoredProcedure [WF_EmployeeManagersDelete]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_EmployeeManagersDelete]
@ManagerEmp_No FLOAT,
@OperationsID	INT,
@Emp_No	FLOAT
AS
DELETE 
FROM   EmployeeManagers
WHERE  (ManagerEmp_No = @ManagerEmp_No)
       AND (OperationsID = @OperationsID)
       AND (Emp_No = @Emp_No)
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersDeleteAll]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_EmployeeManagersDeleteAll]
@ManagerEmp_No FLOAT,
@OperationsID	INT
AS
DELETE 
FROM   EmployeeManagers
WHERE  (ManagerEmp_No = @ManagerEmp_No)
       AND (OperationsID = @OperationsID)
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_EmployeeManagersGetData]
AS
SELECT DISTINCT s.EmpManager,e.[NAME]+' '+e.FAMILY FullName,s2.TITLE 
  FROM SECTIONS s
JOIN EMPLOYEE e ON e.EMP_NO=s.EmpManager 
JOIN SECTIONS s2 ON s2.SEC_NO = e.SEC_NO
ORDER BY s.EmpManager
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersGetDataByManager]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [WF_EmployeeManagersGetDataByManager]
@managerEmpNo	FLOAT,
@OperationsID	INT
AS
IF (@OperationsID = 0)
BEGIN
    SELECT em.ManagerEmp_No,
           em.OperationsID,
           em.Emp_No,
           e.NAME AS EmployeeName,
           e.FAMILY AS EmployeeFamily,
           e.SEC_NO AS Sec_No,
           e.EMP_NO AS StrEMP_NO,
           s.TITLE AS SECTIONS,
           ot.[Name] OperationName,
           e.[NAME]+' '+e.FAMILY+' '+LTRIM(STR(e.EMP_NO)) FullName,
           LTRIM(STR(e.EMP_NO))+'#'+LTRIM(ISNULL(e.GRP_NO,0)) EmpInfo
    FROM   EmployeeManagers em
           INNER JOIN EMPLOYEE e
                ON  em.Emp_No = e.EMP_NO
           INNER JOIN SECTIONS s
                ON  s.SEC_NO = e.SEC_NO
           LEFT OUTER JOIN OperationTypes ot
                ON  em.OperationsID = ot.OperationsID
    WHERE  (em.ManagerEmp_No = @managerEmpNo)
    ORDER BY
           e.Emp_No
END
ELSE
BEGIN
    SELECT em.ManagerEmp_No,
           em.OperationsID,
           em.Emp_No,
           e.NAME AS EmployeeName,
           e.FAMILY AS EmployeeFamily,
           e.SEC_NO AS Sec_No,
           e.EMP_NO AS StrEMP_NO,
           s.TITLE AS SECTIONS,
           ot.[Name] OperationName,
           LTRIM(STR(e.EMP_NO))+' '+e.[NAME]+' '+e.FAMILY FullName,
           LTRIM(STR(e.EMP_NO))+'#'+LTRIM(ISNULL(e.GRP_NO,0)) EmpInfo
    FROM   EmployeeManagers em
           INNER JOIN EMPLOYEE e
                ON  em.Emp_No = e.EMP_NO
           INNER JOIN SECTIONS s
                ON  s.SEC_NO = e.SEC_NO
           LEFT OUTER JOIN OperationTypes ot
                ON  em.OperationsID = ot.OperationsID
    WHERE  (
               em.ManagerEmp_No = @managerEmpNo
               AND em.OperationsID = @OperationsID
           )
    ORDER BY
           e.Emp_No
END
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersInsert]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_EmployeeManagersInsert]
@ManagerEmp_No FLOAT,
@OperationsID	INT,
@Emp_No	FLOAT
AS
INSERT INTO [EmployeeManagers]
  (
    [ManagerEmp_No],
    [OperationsID],
    [Emp_No]
  )
VALUES
  (
    @ManagerEmp_No,
    @OperationsID,
    @Emp_No
  )
GO

/****** Object:  StoredProcedure [WF_EmployeeManagersInsertAll]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/************************************************************
 * Code formatted by Maysam.Chegini@gmil.com
 * Time: 2009/09/30 12:03:34 ب.ظ
 ************************************************************/

CREATE PROC [WF_EmployeeManagersInsertAll]
@ManagerEmp_No FLOAT,
@OperationsID	INT
AS
INSERT INTO [EmployeeManagers]
  (
    [ManagerEmp_No], [OperationsID], [Emp_No]
  )
SELECT @ManagerEmp_No, @OperationsID, e.EMP_NO
FROM   EMPLOYEE e
WHERE  e.IsCut = 0
       AND e.SYS_ACTIVE = 1
       AND e.EMP_NO NOT IN (SELECT em.Emp_No
                            FROM   EmployeeManagers em
                            WHERE  em.Emp_No = e.EMP_NO
                                   AND em.OperationsID = @OperationsID
				   AND em.ManagerEmp_No=@ManagerEmp_No)
/************************************************************************************/		
GO
/************************************************************************************/
CREATE PROC [WF_EMPLOYEESetPasword]
AS
UPDATE EMPLOYEE
SET    WFUserName = EMP_NO ,
       WFUserPass = EMP_NO
WHERE     (IsCut = 0) AND (SYS_ACTIVE = 1)
GO

/****** Object:  StoredProcedure [WF_EMPLOYEESetSEmp]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_EMPLOYEESetSEmp]
@Emp_No FLOAT,
@SEmp_No FLOAT,
@S_FDate VARCHAR(10),
@S_TDate VARCHAR(10)
AS
UPDATE SECTIONS
SET 
	SEmp_No = @SEmp_No,
	S_FDate = @S_FDate,
	S_TDate = @S_TDate 
WHERE EmpManager=@Emp_No
/************************************************************************************/		
GO
/************************************************************************************/
CREATE PROC [WF_EMPLOYEEUpdateEmployeeUserData]
@EMP_NO FLOAT,
@WFUserName NVARCHAR(25),
@WFUserPass NVARCHAR(15)
AS
UPDATE EMPLOYEE
SET    WFUserName = @WFUserName,
       WFUserPass = @WFUserPass
WHERE  (EMP_NO = @EMP_NO)
/************************************************************************************/		
GO
/************************************************************************************/
CREATE PROCEDURE [WF_FindShift]
    @Emp_No bigint,
    @DateStart Float,
    @Year_ int,
    @Month_ int,
    @Day_ int
AS
DECLARE @SqlStr NVARCHAR(1000)
if (select is_uniq from employee where emp_no=@emp_no) = 0
BEGIN
	DECLARE @GroupFirst INT
	SELECT @GroupFirst=e.GRP_NO  FROM EMPLOYEE e WHERE e.EMP_NO=@Emp_No
  if ((SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (Date_<= @DateStart)  order by Date_ DESC)>0)  
	set @GroupFirst = (SELECT Top 1 Grp_no FROM  Emp_Grps where (Emp_No=@Emp_No) and (Date_<= @DateStart)  order by Date_ desc)

	SET @SqlStr=N'Select '+LTRIM(@GroupFirst)+' as GroupFirst, ISNULL(GrpShift_Day'+LTRIM(@Day_)+
	',0) As ShiftNo FROM GrpShift gs WHERE gs.GrpShift_GrpNo='+LTRIM(@GroupFirst)
	+' AND gs.GrpShift_Year='+LTRIM(@Year_)+' AND gs.GrpShift_Month='+LTRIM(@Month_)
	EXEC(@SqlStr)
end
else
begin
       SET @SqlStr=N'SELECT 0 as GroupFirst ,ISNULL(S' +LTRIM(@Day_) 
       +',-3) as ShiftNo From Emp_Shif Where Year_=' + LTRIM(@Year_)+ 
	' and Month_='+LTRIM(@Month_)+' and Emp_no='+LTRIM(@Emp_No)
	EXEC(@SqlStr)
end
/************************************************************************************/		
GO
/************************************************************************************/
CREATE PROC [WF_GetManagerReviewsByRequestID]
@RequestsID INT ,
@IS_ShowPersonFilter BIT
AS
IF (@IS_ShowPersonFilter=1)
BEGIN
    SELECT rv.ID, rv.RequestID, rv.ReviewedByEmployeeID, rv.Description, rv.ReviewStatus, 
           rv.ReviewDate, rv.Is_ShowPersonal, WF_GetEmployee_VI.FullName
    FROM   Reviews rv
           LEFT OUTER JOIN WF_GetEmployee_VI
                ON  rv.ReviewedByEmployeeID = WF_GetEmployee_VI.EMP_NO
    WHERE  (rv.RequestID = @RequestsID) AND (rv.Is_ShowPersonal=@IS_ShowPersonFilter)
END    
ELSE
BEGIN
    SELECT rv.ID, rv.RequestID, rv.ReviewedByEmployeeID, rv.Description, rv.ReviewStatus, 
           rv.ReviewDate, rv.Is_ShowPersonal, WF_GetEmployee_VI.FullName
    FROM   Reviews rv
           LEFT OUTER JOIN WF_GetEmployee_VI
                ON  rv.ReviewedByEmployeeID = WF_GetEmployee_VI.EMP_NO
    WHERE  (rv.RequestID = @RequestsID)
END	    




GO

/****** Object:  StoredProcedure [WF_GetRequestInfo]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_GetRequestInfo]
@EMP_NO FLOAT
AS
SELECT COUNT(1) ReqCount
,(SELECT COUNT(1) FROM Requests r1 WHERE r1.EMP_NO=@EMP_NO AND r1.IsFinalApproved IS NULL) NeutrulCount
,(SELECT COUNT(1) FROM Requests r2 WHERE r2.EMP_NO=@EMP_NO AND r2.IsFinalApproved=1) ApprovedCount
,(SELECT COUNT(1) FROM Requests r3 WHERE r3.EMP_NO=@EMP_NO AND r3.IsFinalApproved=0) RejectCount
,(SELECT COUNT(1) FROM Requests r4 WHERE r4.CurEmp_NO=@EMP_NO AND r4.IsFinalApproved IS NULL) MgrNeutrulCount
,(SELECT COUNT(1) FROM Requests r5 WHERE r5.CurEmp_NO=@EMP_NO AND r5.IsFinalApproved=1) MgrApprovedCount
,(SELECT COUNT(1) FROM Requests r6 WHERE r6.CurEmp_NO=@EMP_NO AND r6.IsFinalApproved=0)MgrRejectCount
FROM Requests r WHERE r.EMP_NO=@EMP_NO
GO

/****** Object:  StoredProcedure [WF_GetShiftIsHoliday]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_GetShiftIsHoliday]
@Emp_no      FLOAT,
@DateS       FLOAT,
@DateE       FLOAT,
@ShamsiDate  NVARCHAR(10),
@ISKabise    BIT
AS
DECLARE @Grp_No INT,@Shift_No INT,@Calen_T INT,@Is_uniq INT ,@Year_ INT,@Month_ INT ,@Day_ INT
DECLARE @Tbl TABLE (ShiftNo INT,GrpNo INT , CurDate NVARCHAR(15))
	
	DECLARE Employee_Cursor  CURSOR  
	FOR
	    SELECT Grp_No,
	           Is_uniq       
	    FROM   Employee
	    WHERE  Emp_No = @Emp_No
	
	OPEN Employee_Cursor
	FETCH NEXT FROM Employee_Cursor INTO @Grp_No,@Is_uniq                             
	WHILE (@DateS <= @DateE)
	BEGIN
	    SET @Year_ = CAST(SUBSTRING(@ShamsiDate, 1, 4) AS INT)
	    SET @Month_ = CAST(SUBSTRING(@ShamsiDate, 5, 2) AS INT)
	    SET @Day_ = CAST(SUBSTRING(@ShamsiDate, 7, 2) AS INT)
	    EXEC WF_MixFindShift @Grp_No OUT,
	         @Emp_No,
	         @DateS,
	         @Year_,
	         @Month_,
	         @Day_,
	         @Shift_No OUT,
	         @Calen_T

	INSERT INTO @Tbl(ShiftNo,GrpNo,CurDate)VALUES(@Shift_No,@Grp_No,@ShamsiDate)

		         
	    SET @ShamsiDate = dbo.AddDate(@ShamsiDate, @ISKabise)
	    SET @DateS = @DateS + 1	    
	END 
	CLOSE Employee_Cursor
	DEALLOCATE Employee_Cursor
	SELECT tbl.*,c.TITLE from @Tbl tbl JOIN CARDS c ON tbl.ShiftNo=c.CARD_NO
	WHERE tbl.ShiftNo=50 OR tbl.ShiftNo=51 OR tbl.ShiftNo=52
GO

/****** Object:  StoredProcedure [WF_GROUPSGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_GROUPSGetData]
AS
SELECT     TITLE, GRP_NO, DATE_, P_DAYS, P_TAT, EZ_TYPE, MAZAD_TIME, MOR_SHI_K, ISNULL(MOR_KASR, 0) AS MOR_KASR, ISNULL(KASR_ESTH, 0) 
                      AS KASR_ESTH, BAIN_ESTEH, TALAB_5, MODI_DATE, NBAT_DIF, FARD_ABS_T, SH1, SH2, SH3, SH4, SH5, SH6, SH7, SH8, SH9, SH10, SH11, SH12, 
                      SH13, SH14, SH15, SH16, SH17, SH18, SH19, SH20, SH21, SH22, SH23, SH24, SH25, SH26, SH27, SH28, SH29, SH30, SH31, SH32, SH33, SH34, 
                      SH35, SH36, SH37, SH38, SH39, SH40, H_S_TIME, H_E_TIME, Hs_KasrEsth, Kasr_Bim, Mor_Bim, Kasr_B_H, Mor_B_H, fard_absnt, atMostTime
FROM         GROUPS
GO

/****** Object:  StoredProcedure [WF_GROUPSGetDataByGrpNo]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_GROUPSGetDataByGrpNo]
@Grp_no SMALLINT
AS
SELECT     TITLE, GRP_NO, DATE_, P_DAYS, P_TAT, EZ_TYPE, MAZAD_TIME, MOR_SHI_K, ISNULL(MOR_KASR, 0) AS MOR_KASR, ISNULL(KASR_ESTH, 0) 
                      AS KASR_ESTH, BAIN_ESTEH, TALAB_5, MODI_DATE, NBAT_DIF, FARD_ABS_T, SH1, SH2, SH3, SH4, SH5, SH6, SH7, SH8, SH9, SH10, SH11, SH12, 
                      SH13, SH14, SH15, SH16, SH17, SH18, SH19, SH20, SH21, SH22, SH23, SH24, SH25, SH26, SH27, SH28, SH29, SH30, SH31, SH32, SH33, SH34, 
                      SH35, SH36, SH37, SH38, SH39, SH40, H_S_TIME, H_E_TIME, Hs_KasrEsth, Kasr_Bim, Mor_Bim, Kasr_B_H, Mor_B_H, fard_absnt, atMostTime
FROM         GROUPS
WHERE     (GRP_NO = @Grp_no)
GO

/****** Object:  StoredProcedure [WF_ManagerAccessDelete]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ManagerAccessDelete]
@SecNo FLOAT,
@ActionNo INT
AS
DELETE FROM ManagerAccess WHERE SecNo=@SecNo AND ActionNo=@ActionNo
GO

/****** Object:  StoredProcedure [WF_ManagerAccessDeleteSection]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ManagerAccessDeleteSection]
@SecNo FLOAT
AS
DELETE FROM ManagerAccess WHERE SecNo=@SecNo
GO

/****** Object:  StoredProcedure [WF_ManagerAccessGetAcction]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ManagerAccessGetAcction]
AS
SELECT c.CARD_NO,c.TITLE
  FROM CARDS c WHERE c.CARD_TYPE in(11,3,5) AND c.SYS_ACTIVE=1 AND c.CARD_NO<>0
GO

/****** Object:  StoredProcedure [WF_ManagerAccessGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ManagerAccessGetData]
AS
SELECT dt.*, c1.TITLE, s1.EmpManager, e.NAME + ' ' + e.FAMILY AS 
       ManagerName, e.NAME, e.FAMILY, CASE WHEN ma.SecNo IS NULL THEN 0 ELSE 1 END IsAccess
FROM   EMPLOYEE e
       RIGHT OUTER JOIN (
                SELECT s.SEC_NO SecNo, c.CARD_NO ActionNo
                FROM   SECTIONS s
                       JOIN CARDS c
                            ON  c.CARD_TYPE IN (11, 3, 5)
                            AND c.SYS_ACTIVE = 1
                            AND c.CARD_NO <> 0
            ) dt
       LEFT OUTER JOIN CARDS c1
            ON  dt.ActionNo = c1.CARD_NO
       LEFT OUTER JOIN SECTIONS s1
            ON  dt.SecNo = s1.SEC_NO
       LEFT OUTER JOIN ManagerAccess ma
            ON  dt.SecNo = ma.SecNo
            AND dt.ActionNo = ma.ActionNo
            ON  e.EMP_NO = s1.EmpManager
GO

/****** Object:  StoredProcedure [WF_ManagerAccessGetDataBySec]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ManagerAccessGetDataBySec]
@SecNo FLOAT
AS

SELECT dt.*, c1.TITLE, s1.EmpManager, e.NAME + ' ' + e.FAMILY AS 
       ManagerName, e.NAME, e.FAMILY, CASE WHEN ma.SecNo IS NULL THEN 0 ELSE 1 END IsAccess
FROM   EMPLOYEE e
       RIGHT OUTER JOIN (
                SELECT s.SEC_NO SecNo, c.CARD_NO ActionNo
                FROM   SECTIONS s
                       JOIN CARDS c
                            ON  c.CARD_TYPE IN (11, 3, 5)
                            AND c.SYS_ACTIVE = 1
                            AND c.CARD_NO <> 0
            ) dt
       LEFT OUTER JOIN CARDS c1
            ON  dt.ActionNo = c1.CARD_NO
       LEFT OUTER JOIN SECTIONS s1
            ON  dt.SecNo = s1.SEC_NO
       LEFT OUTER JOIN ManagerAccess ma
            ON  dt.SecNo = ma.SecNo
            AND dt.ActionNo = ma.ActionNo
            ON  e.EMP_NO = s1.EmpManager
WHERE dt.SecNo=@SecNo
GO

/****** Object:  StoredProcedure [WF_ManagerAccessInsert]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ManagerAccessInsert]
@SecNo FLOAT,
@ActionNo INT
AS
INSERT INTO ManagerAccess(SecNo,ActionNo)
VALUES(@SecNo,@ActionNo)
GO

/****** Object:  StoredProcedure [WF_MOR_MAMGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/************************************************************
 * Code formatted by SoftTree SQL Assistant © v4.1.8
 * Time: 2008/12/31 05:14:25 ق.ظ
 ************************************************************/

CREATE PROC [WF_MOR_MAMGetData]
AS
SELECT EMP_NO,
       SAVED,
       CAST(S_DATE AS DATETIME) - 2 AS S_DATE,
       CAST(E_DATE AS DATETIME) - 2 AS E_DATE,
       REQUESTED,
       S_NO,
       CAST(ISU_DATE AS DATETIME) - 2 AS ISU_DATE,
       TYP,
       BABAT,
       ISNULL(INC_TYP, 0) AS INC_TYP,
       PRINTED,
       P6,
       P7,
       P8,
       CAST(MODI_DATE AS DATETIME) 
       - 2 AS MODI_DATE,
       MODI_TIME,
       T_EMP_NO
FROM   MOR_MAM
GO

/****** Object:  StoredProcedure [WF_MOR_MAMGetDataByEmpNo]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_MOR_MAMGetDataByEmpNo]
@From FLOAT,
@TO FLOAT,
@Emp_No FLOAT
AS
SELECT EMP_NO,
       SAVED,
       CAST(S_DATE AS DATETIME) - 2 AS S_DATE,
       CAST(E_DATE AS DATETIME) - 2 AS E_DATE,
       REQUESTED,
       S_NO,
       CAST(ISU_DATE AS DATETIME) - 2 AS ISU_DATE,
       TYP,
       BABAT,
       ISNULL(INC_TYP, 0) AS INC_TYP,
       PRINTED,
       P6,
       P7,
       P8,
       CAST(MODI_DATE AS DATETIME) 
       - 2 AS MODI_DATE,
       MODI_TIME,
       T_EMP_NO
FROM   MOR_MAM
WHERE  (EMP_NO = @Emp_No)
       AND (S_DATE <= @From)
       AND (E_DATE >= @TO)
GO

/****** Object:  StoredProcedure [WF_MOR_MAMInsert]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_MOR_MAMInsert]
@EMP_NO FLOAT,
@SAVED FLOAT,
@REQUESTED FLOAT,
@S_NO VARCHAR(12),
@TYP SMALLINT,
@BABAT NVARCHAR(50),
@PRINTED BIT,
@P6 NVARCHAR(50),
@P7 NVARCHAR(50),
@P8 VARCHAR(8),
@MODI_TIME NVARCHAR(50),
@T_EMP_NO FLOAT,
@INC_TYP SMALLINT,
@MODI_DATE FLOAT,
@S_DATE FLOAT,
@E_DATE FLOAT,
@ISU_DATE FLOAT
AS
	INSERT INTO MOR_MAM(EMP_NO,SAVED,REQUESTED,S_NO,TYP,BABAT,PRINTED,P6,P7,P8,MODI_TIME,T_EMP_NO,INC_TYP,MODI_DATE,S_DATE,E_DATE,ISU_DATE)
	VALUES(@EMP_NO,@SAVED,@REQUESTED,@S_NO,@TYP,@BABAT,@PRINTED,@P6,@P7,@P8,@MODI_TIME,@T_EMP_NO,@INC_TYP,@MODI_DATE,@S_DATE,@E_DATE,@ISU_DATE)	
	SELECT @@Identity AS NEWID			  	  
GO

/****** Object:  StoredProcedure [WF_MorMamGetDataByM_M_Date]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_MorMamGetDataByM_M_Date]
@Emp_No FLOAT,
@Date FLOAT
AS
DECLARE @D2 DATETIME
set @D2=CAST(@Date AS DATETIME)-2

SELECT ISNULL(BABAT, '') AS BABAT,
       EMP_NO,
       CAST(E_DATE AS DATETIME) - 2 AS E_DATE,
       ISNULL(INC_TYP, 0) AS INC_TYP,
       CAST(ISU_DATE AS DATETIME) 
       - 2 AS ISU_DATE,
       CAST(MODI_DATE AS DATETIME) - 2 AS MODI_DATE,
       MODI_TIME,
       P6,
       P7,
       P8,
       PRINTED,
       REQUESTED,
       SAVED,
       CAST(S_DATE AS DATETIME) - 2 AS S_DATE,
       S_NO,
       TYP,
       T_EMP_NO
FROM   MOR_MAM
WHERE  (EMP_NO = @Emp_No)
       AND (TYP = 57)
       AND (
               S_DATE BETWEEN
               (
                   SELECT TOP 1 M_M_DATE
                   FROM   PARMFILE
               ) AND @D2
           )
ORDER BY
       S_DATE,
       INC_TYP
GO

/****** Object:  StoredProcedure [WF_MorMamGetDataByM_M_Date_Main]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_MorMamGetDataByM_M_Date_Main]
	@Emp_No FLOAT,
	@Date FLOAT
AS
	DECLARE @D2 DATETIME
	SET @D2 = CAST(@Date AS DATETIME) -2
	
	SELECT BABAT,
	       EMP_NO,
	       CAST(E_DATE AS DATETIME) - 2 AS E_DATE,
	       ISNULL(INC_TYP, 0) AS INC_TYP,
	       CAST(ISU_DATE AS DATETIME) - 2 AS ISU_DATE,
	       CAST(MODI_DATE AS DATETIME) - 2 AS MODI_DATE,
	       MODI_TIME,
	       P6,
	       P7,
	       P8,
	       PRINTED,
	       REQUESTED,
	       SAVED,
	       CAST(S_DATE AS DATETIME) - 2 AS S_DATE,
	       S_NO,
	       TYP,
	       T_EMP_NO
	FROM   MOR_MAM
	WHERE  (EMP_NO = @Emp_No)
	       AND (TYP = 57)
	       AND (
	               S_DATE BETWEEN (
	                   SELECT TOP 1 M_M_Date_Main
	                   FROM   PARMFILE
	               ) AND @D2
	           )
	ORDER BY
	       S_DATE,
	       INC_TYP
GO

/****** Object:  StoredProcedure [WF_MorMamGetRemedialDataByEmpNo]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_MorMamGetRemedialDataByEmpNo]
@Emp_No 	FLOAT,
@StartDate 	DATETIME,
@EndDate 	DATETIME
AS
SELECT EMP_NO,
       SAVED,
       CAST(S_DATE AS DATETIME) - 2 AS S_DATE,
       CAST(E_DATE AS DATETIME) - 2 AS E_DATE,
       REQUESTED,
       S_NO,
       CAST(ISU_DATE AS DATETIME) - 2 AS ISU_DATE,
       TYP,
       BABAT,
       INC_TYP,
       PRINTED,
       P6,
       P7,
       P8,
       CAST(MODI_DATE AS DATETIME) - 2 AS MODI_DATE,
       MODI_TIME,
       T_EMP_NO,
       RefNumber
FROM   MOR_MAM
WHERE  (EMP_NO = @Emp_No)
       AND (CAST(S_DATE AS DATETIME) - 2 <= @StartDate)
       AND (CAST(E_DATE AS DATETIME) - 2 >= @EndDate)
       AND (TYP = 60)
GO

/****** Object:  StoredProcedure [WF_MorMamIsExist]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_MorMamIsExist]
	@StartDate FLOAT,
	@EndDate FLOAT,
	@Emp_No FLOAT
AS
	SELECT COUNT(1)
	FROM   MOR_MAM mm
	WHERE  mm.EMP_NO = @Emp_No
	       AND mm.S_DATE <= @EndDate
	       AND mm.E_DATE >= @StartDate
	       AND mm.E_DATE > 0
GO

/****** Object:  StoredProcedure [WF_MorTimeGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_MorTimeGetData]
(
	@Emp_no bigint,
	@DateS float,
	@DateE float,
	@ShamsiDate nvarchar(10),
	@ISKabise bit
)
AS

BEGIN
    DECLARE @Grp_No int,
            @Shift_No int,
            @Is_uniq bit,
            @TAT_RASMI int,
            @TAT_RASMI2 int,
            @NumDay int,
            @T1 int,
            @T2 int,
            @Ti_ int,
            @Mor_Kasr int,
            @Kasr_Esth int,
            @Kasr_Gh int,
            @Hs_KasrEsth int,
            @RAMEZAN_T int,
            @RAMEZAN_E5 int,
            @RAMEZAN_S int,
            @End5_Time int,
            @Start_Time int,
            @Shif_Time int,
            @SumMorTime Int,
            @Year_  int,
            @Month_ int,
            @Day_ int,
            @Calen_T int            
    DECLARE @DateCur Float
    DECLARE @TmpD Real    
    
    SET @TAT_RASMI = 50
    SET @TAT_RASMI2 = 52
    SET @SumMorTime = 0
    SET @DateCur = @DateS
    
    DECLARE Employee_Cursor CURSOR  
    FOR
        SELECT Grp_No,
               Is_uniq
        FROM   Employee
        WHERE  Emp_No = @Emp_No
    OPEN Employee_Cursor
    FETCH NEXT FROM Employee_Cursor INTO @Grp_No,@Is_uniq
    WHILE (@DateCur<=@DateE)
    BEGIN
        SET @Year_ = Cast(SubString(@ShamsiDate,1,4) AS int)
        SET @Month_ = Cast(SubString(@ShamsiDate,5,2) AS int)
        SET @Day_ = Cast(SubString(@ShamsiDate,7,2) AS int)
        EXEC Sp_MixFindShift @Grp_No out,@Emp_No,@DateCur,@Year_,@Month_,@Day_,@Shift_No out,@Calen_T
        IF @Shift_No=0
        BEGIN
            SET @SumMorTime = -2
            BREAK
        END
        ELSE 
            IF @Shift_No=-3
            BEGIN
                SET @SumMorTime = -3
                BREAK
            END
        SET @numDay = DATEPART(dw, @DateCur-2)
        SET @Ti_ = 0 
        SET @TmpD = @DateCur
        IF (@Is_uniq=0 )
        BEGIN
            DECLARE Group_Cursor CURSOR  
            FOR
                SELECT Mor_Kasr,
                       Kasr_Esth,
                       Hs_KasrEsth
                FROM   Groups
                WHERE  Grp_No = @Grp_No
            OPEN Group_Cursor
            FETCH NEXT FROM Group_Cursor INTO @Mor_Kasr,@Kasr_Esth,@Hs_KasrEsth
        END
        ELSE 
        BEGIN
            DECLARE Group_Cursor CURSOR  
            FOR
                SELECT Mor_Kasr,
                       Kasr_Esth,
                       Hs_KasrEsth
                FROM   Employee
                WHERE  Emp_No = @Emp_No
            OPEN Group_Cursor
            FETCH NEXT FROM Group_Cursor INTO @Mor_Kasr,@Kasr_Esth,@Hs_KasrEsth
        END
        DECLARE Shift_Cursor CURSOR  
        FOR
            SELECT Kasr_Gh,
                   RAMEZAN_T,
                   RAMEZAN_E5,
                   RAMEZAN_S,
                   End5_Time,
                   Start_Time,
                   Shif_Time
            FROM   Shifts
            WHERE  Shift_No = @Shift_No
        OPEN Shift_Cursor
        FETCH NEXT FROM Shift_Cursor INTO @Kasr_Gh,@RAMEZAN_T,@RAMEZAN_E5,@RAMEZAN_S,@End5_Time,@Start_Time,@Shif_Time
        IF (dbo._IsRamezan(@TMPD+2)=1 )
           AND (@NumDay <> 5 )
           AND (
                   dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=0
               )
        BEGIN
            IF @Mor_Kasr = 3
                SET @Ti_ = @Kasr_Esth
            ELSE 
                IF @Mor_Kasr= 2
                    SET @Ti_ = @Kasr_Gh
                ELSE 
                    IF @Mor_Kasr = 1
                        SET @Ti_ = @RAMEZAN_T
        END
        ELSE 
            IF (@NumDay=5 )
               AND (
                       dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=0
                   )
            BEGIN
                IF dbo._IsRamezan(@TMPD+2)=1
                BEGIN
                    SET @T2 = @RAMEZAN_E5
                    SET @T1 = @RAMEZAN_S
                END
                ELSE 
                BEGIN
                    SET @T2 = @End5_Time
                    SET @T1 = @Start_Time
                END
                IF @Mor_Kasr = 3
                    SET @Ti_ = @Kasr_Esth
                ELSE 
                    IF @Mor_Kasr = 2
                        SET @Ti_ = dbo.TimeSub (@T2,@T1)
                    ELSE 
                        IF @Mor_Kasr = 1
                            SET @Ti_ = dbo.TimeSub (@T2,@T1)
            END--if
            
            ELSE 
                IF (
                           dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=1
                       )
                   AND (dbo.BainEsteh(@Is_uniq,@Grp_No)=1 )
                    SET @Ti_ = 0
                ELSE 
                    IF (
                               dbo._Between(@Shift_No,@TAT_RASMI,@TAT_RASMI2)=1
                           )
                       AND (dbo.BainEsteh(@Is_uniq,@Grp_No)=0 )
                        SET @Ti_ = @Hs_KasrEsth
                    ELSE 
                    BEGIN
                        SET @Ti_ = 0
                        IF @Mor_Kasr = 3
                            SET @Ti_ = @Kasr_Esth
                        ELSE 
                            IF (@Mor_Kasr = 2 )
                               AND (@NumDay=5 )
                                SET @Ti_ = @Shif_Time
                            ELSE 
                                IF @Mor_Kasr = 2
                                    SET @Ti_ = @Kasr_Gh
                                ELSE 
                                    IF @Mor_Kasr = 1
                                        SET @Ti_ = @Shif_Time
                    END
        CLOSE Group_Cursor
        DEALLOCATE Group_Cursor
        CLOSE Shift_Cursor
        DEALLOCATE Shift_Cursor
        SET @ShamsiDate = dbo.AddDate(@ShamsiDate,@ISKabise)
        SET @DateCur = @DateCur + 1
        SET @SumMorTime = dbo.TimePlus(@SumMorTime,@Ti_)
    END 
    CLOSE Employee_Cursor
    DEALLOCATE Employee_Cursor
    RETURN(@SumMorTime)
END
GO

/****** Object:  StoredProcedure [WF_OperationTypesGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_OperationTypesGetData]
AS
SELECT OperationsID,
       NAME
FROM   OperationTypes
GO

/****** Object:  StoredProcedure [WF_OperationTypesInsert]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_OperationTypesInsert]
@OperationsID [int] ,
@Name [nvarchar] (50)
AS
INSERT INTO [OperationTypes]
  ( 	
    [OperationsID],
    [Name]
  )
VALUES
  (
    @OperationsID,
    @Name
  )
GO

/****** Object:  StoredProcedure [WF_OVERSGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_OVERSGetData]
AS
SELECT     EMP_NO, DATE_, TIME_, IssuDate, USERS_ID
FROM         OVERS
GO

/****** Object:  StoredProcedure [WF_OVERSGetDataByEmpNo]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_OVERSGetDataByEmpNo]
@emp_no	FLOAT,
@Date_	FLOAT
AS
SELECT     EMP_NO, CAST(DATE_ AS Datetime) - 2 AS DATE_, TIME_, IssuDate, USERS_ID
FROM         OVERS
WHERE     (EMP_NO = @emp_no) AND (DATE_ = @Date_)
GO

/****** Object:  StoredProcedure [WF_OVERSInsert]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_OVERSInsert]
	@EMP_NO FLOAT,
	@DATE_ FLOAT,
	@TIME_ SMALLINT,
	@IssuDate FLOAT,
	@USERS_ID NVARCHAR(20)
AS
	INSERT INTO [OVERS]
	  (
	    [EMP_NO],
	    [DATE_],
	    [TIME_],
	    [IssuDate],
	    [USERS_ID]
	  )
	VALUES
	  (
	    @EMP_NO,
	    @DATE_,
	    @TIME_,
	    @IssuDate,
	    @USERS_ID
	  )
GO

/****** Object:  StoredProcedure [WF_OVERSUpdate]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_OVERSUpdate]
	@EMP_NO	float,
	@DATE_	float,
	@TIME_	smallint,
	@IssuDate	float,
	@USERS_ID	nvarchar(20),
	@OldTIME_	smallint
AS
	UPDATE OVERS
	Set
		[TIME_]=@TIME_,
		[IssuDate]=@IssuDate,
		[USERS_ID]=@USERS_ID
	Where
	(
		[EMP_NO]=@EMP_NO
		And
		[DATE_]=@DATE_
		AND 
		[TIME_]=@OldTIME_
	)
GO

/****** Object:  StoredProcedure [WF_PARMFILEGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_PARMFILEGetData]
AS
SELECT  *
FROM         PARMFILE
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE [WF_RequestGetByManagerEmpNo]
	@EmpManager FLOAT,	
	@StartDate DATETIME,
	@EndDate DATETIME,
	@IsFinalApproved TINYINT
AS
DECLARE @CurDate NVARCHAR(10)
SET @CurDate=dbo.ShamsyDate(GETDATE())
SELECT e2.EMP_NO INTO #empnoTBL FROM EMPLOYEE e2 WHERE e2.EmpMngr=@EmpManager
SELECT s.EmpManager INTO #managerTBL  FROM SECTIONS s WHERE s.EmpManager=@EmpManager OR (s.SEmp_No=@EmpManager AND @curDate BETWEEN s.S_FDate AND s.S_TDate)

SELECT DISTINCT 
       r.ApprovalByManagerEmp_No,r.ApprovalDate,ISNULL(r.Duration,0) AS 
       Duration,r.EMP_NO,r.EndDate,r.EndHour,r.IsFinalApproved,r.OperationsID,
       r.RequestsID,r.StartDate,r.StartHour,r.SubmittedByEmployeeID,r.SubmittedDate,
       r.Type,r.WorkflowIdentifier,e.NAME + ' ' + e.FAMILY AS EmployeeName,r.Description,
       c.TITLE,me1.NAME + ' ' + me1.FAMILY AS ManagerName,s.EmpManager,s.SEC_NO,
       s.TITLE AS SECTIONS,r.CurEmp_NO,s.SEmp_No,s.S_FDate,s.S_TDate,r.AcceptCode,
       r.CurSection,r.MoveUpCnt,
       CASE  WHEN r.MoveUpCnt IS NOT NULL THEN 
					N'ارجاع شده' WHEN r.CurEmp_NO <> @EmpManager THEN 
                    N'جانشين يا کارتابل خاص' ELSE N'عادي' END AS ReqStatus,
       s2.TITLE AS EmpSecTitle,s2.SEC_NO AS EmpSecNo
       ,(SELECT COUNT(1) FROM WFParallelApprove wa WHERE wa.CardNo=r.[Type]) NeedParallelCount
       ,(SELECT COUNT(1) FROM WFParallelApprove wa
			LEFT OUTER JOIN WFRequestParallelApproval wpa ON  wa.CardNo = wpa.ParallelApprovalCardNo AND 
			wpa.ParallelApprovalEmpNo = wa.EmpNo AND wpa.RequestID = r.RequestsID
			WHERE  wa.CardNo = r.[Type] AND (wpa.RequestID IS NULL OR wpa.IsApprove = 0)
		) ParallelCount,e2.NAME+' '+e2.FAMILY SubmittedFullName,c.IS_DAY
FROM EMPLOYEE AS e
LEFT OUTER JOIN SECTIONS AS s2 ON  e.SEC_NO = s2.SEC_NO
RIGHT OUTER JOIN SECTIONS AS s
RIGHT OUTER JOIN Requests AS r ON  s.SEC_NO = r.CurSection
LEFT OUTER JOIN EMPLOYEE AS me1 
					ON  r.CurEmp_NO = me1.EMP_NO 
					ON  e.EMP_NO = r.EMP_NO
LEFT OUTER JOIN EMPLOYEE e2 ON r.SubmittedByEmployeeID = e2.EMP_NO
LEFT OUTER JOIN CARDS AS c ON  r.Type = c.CARD_NO
WHERE  
(
	(r.CurEmp_NO = @EmpManager)
		OR
	r.CurEmp_NO IN (SELECT EmpManager FROM #managerTBL )	
		OR 
	r.EMP_NO IN (SELECT EMP_NO FROM #empnoTBL) 
)
   AND r.StartDate BETWEEN @StartDate AND @EndDate 
   AND (
   		r.IsFinalApproved =@IsFinalApproved OR 
		(r.IsFinalApproved IS NULL AND @IsFinalApproved IS NULL)
		OR @IsFinalApproved>1
   )
   
DROP TABLE #empnoTBL
DROP TABLE #managerTBL   
/************************************************************************************/
GO
/************************************************************************************/
CREATE	PROC [WF_RequestsDelete]
@RequestsID INT
AS
DELETE 
FROM   [Requests]
WHERE  [RequestsID] = @RequestsID
/***************************************************************************************/
GO

/****** Object:  StoredProcedure [WF_RequestsGetData]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_RequestsGetData]
AS
SELECT e.FullName AS Employee, c.TITLE, Submitted.FullName AS Submitted, 
       ApprovalName.FullName AS Approval, CurManager.FullName AS CurManager, c.CARD_TYPE AS 
       CARD_TYPE, c.IS_DAY AS IS_DAY,
       CASE r.OperationsID 
       	      WHEN 1 THEN dbo.ConvertToTimeFormat(LTRIM(r.Duration))
	      WHEN 5 THEN CASE 
			       WHEN r.[Type] =104 THEN SUBSTRING(r.Duration,0,LEN(r.Duration)-1)+':'+SUBSTRING(r.Duration,LEN(r.Duration)-1,LEN(r.Duration))
	      		       WHEN c.IS_DAY =1  THEN  LTRIM(r.Duration)+'روز' 
			       WHEN c.IS_DAY =0  THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
	      		  END
              WHEN 3 THEN CASE c.IS_DAY 
	      		       WHEN 1 THEN  LTRIM(r.Duration)+'روز'               
			       WHEN 0 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
			  END
              WHEN 2 THEN CASE r.[Type] 
              			WHEN 100 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
              			WHEN 101 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
              			WHEN 102 THEN LTRIM(r.Duration)+'روز'
              		  END	
       END AS Duration,r.RequestsID, r.EMP_NO,dbo.ShamsyDate(r.SubmittedDate)SubmittedDate, r.[Type],
       dbo.ShamsyDate(r.StartDate)StartDate,dbo.ShamsyDate(r.EndDate)EndDate, r.StartHour, r.EndHour,
       r.SubmittedByEmployeeID, r.IsFinalApproved,
       r.ApprovalByManagerEmp_No, r.ApprovalDate,
       r.OperationsID, r.[Description], r.CurEmp_NO,
       r.ManagerIdea, r.AcceptCode, r.CurSection
FROM   CARDS c
       RIGHT OUTER JOIN Requests r
            ON  c.CARD_NO = r.Type
       LEFT OUTER JOIN WF_GetEmployee_VI e
            ON  e.EMP_NO = r.EMP_NO
       LEFT OUTER JOIN WF_GetEmployee_VI CurManager
            ON  CurManager.EMP_NO = r.CurEmp_NO
       LEFT OUTER JOIN WF_GetEmployee_VI Submitted
            ON  Submitted.EMP_NO = r.SubmittedByEmployeeID
       LEFT OUTER JOIN WF_GetEmployee_VI ApprovalName
            ON  ApprovalName.EMP_NO = r.ApprovalByManagerEmp_No
ORDER BY r.StartHour          





GO

/****** Object:  StoredProcedure [WF_RequestsGetDataByDate]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE	PROC [WF_RequestsGetDataByDate]
@EMP_NO FLOAT,
@StartDate DATETIME
AS
SELECT RequestsID,
       WorkflowIdentifier,
       EMP_NO,
       SubmittedDate,
       TYPE,
       StartDate,
       EndDate,
       StartHour,
       EndHour,
       Duration,
       SubmittedByEmployeeID,
       IsFinalApproved,
       ApprovalByManagerEmp_No,
       ApprovalDate,
       OperationsID,
       DESCRIPTION
FROM   Requests
WHERE  (EMP_NO = @EMP_NO)
       AND (
               CAST(FLOOR(CAST(StartDate AS FLOAT)) AS DATETIME) = CAST(FLOOR(CAST(@StartDate AS FLOAT)) AS DATETIME)
           )
       AND (ISNULL(IsFinalApproved, 0) <> 1)
/*******************************************************************************************/
GO

/****** Object:  StoredProcedure [WF_RequestsGetDataByDateAndTime]    Script Date: 11/24/2009 17:29:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*******************************************************************************************/
CREATE	PROC [WF_RequestsGetDataByDateAndTime]
@EMP_NO FLOAT,
@StartHour INT,
@StartDate DATETIME
AS
SELECT RequestsID,
       WorkflowIdentifier,
       EMP_NO,
       SubmittedDate,
       TYPE,
       StartDate,
       EndDate,
       StartHour,
       EndHour,
       Duration,
       SubmittedByEmployeeID,
       IsFinalApproved,
       ApprovalByManagerEmp_No,
       ApprovalDate,
       OperationsID,
       DESCRIPTION
FROM   Requests
WHERE  (EMP_NO = @EMP_NO)
       AND (StartHour = @StartHour)
       AND (
               CAST(FLOOR(CAST(StartDate AS FLOAT)) AS DATETIME) 
               = CAST(FLOOR(CAST(@StartDate AS FLOAT)) AS DATETIME)
           )
       AND (ISNULL(IsFinalApproved, 0) <> 1) 
GO
CREATE	PROC [WF_RequestsGetDataByStartDateAndEndDate]
@EMP_NO INT,
@EndDate DATETIME,
@StartDate	DATETIME
AS
SELECT RequestsID,
       WorkflowIdentifier,
       EMP_NO,
       SubmittedDate,
       TYPE,
       StartDate,
       EndDate,
       StartHour,
       EndHour,
       Duration,
       SubmittedByEmployeeID,
       IsFinalApproved,
       ApprovalByManagerEmp_No,
       ApprovalDate,
       OperationsID,
       DESCRIPTION
FROM   Requests
WHERE  (EMP_NO = @EMP_NO)
       AND (
               CAST(FLOOR(CAST(StartDate AS FLOAT)) AS DATETIME) <= CAST(FLOOR(CAST(@EndDate AS FLOAT)) AS DATETIME)
           )
       AND (
               CAST(FLOOR(CAST(EndDate AS FLOAT)) AS DATETIME) >= CAST(FLOOR(CAST(@StartDate AS FLOAT)) AS DATETIME)
           )
       AND (ISNULL(IsFinalApproved, 0) <> 1)
GO
/****** Object:  StoredProcedure [WF_ReviewsGetData]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ReviewsGetData]
AS
SELECT ID,
       RequestID,
       ReviewedByEmployeeID,
       DESCRIPTION,
       ReviewStatus,
       ReviewDate,
       Is_ShowPersonal
FROM   Reviews
GO

/****** Object:  StoredProcedure [WF_ReviewsGetDataByID]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ReviewsGetDataByID]
    @ID INT
AS
SELECT ID,
       RequestID,
       ReviewedByEmployeeID,
       DESCRIPTION,
       ReviewStatus,
       ReviewDate,
       Is_ShowPersonal
FROM   Reviews
WHERE  ID = @ID
GO

/****** Object:  StoredProcedure [WF_ReviewsInsert]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ReviewsInsert]
    @RequestID int,
    @ReviewedByEmployeeID FLOAT,
    @Description NVARCHAR(150),
    @ReviewStatus SMALLINT,
    @ReviewDate DATETIME,
    @Is_ShowPersonal BIT
AS
INSERT INTO [Reviews]
  (
    [RequestID],
    [ReviewedByEmployeeID],
    [Description],
    [ReviewStatus],
    [ReviewDate],
    Is_ShowPersonal
  )
VALUES
  (
    @RequestID,
    @ReviewedByEmployeeID,
    @Description,
    @ReviewStatus,
    @ReviewDate,
    @Is_ShowPersonal
  )
GO

/****** Object:  StoredProcedure [WF_ReviewsUpdate]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_ReviewsUpdate]
    @ID int,
    @ReviewedByEmployeeID FLOAT,
    @Description NVARCHAR(150),
    @ReviewStatus SMALLINT,
    @ReviewDate DATETIME,
    @Is_ShowPersonal    BIT
AS
UPDATE Reviews
SET    DESCRIPTION = @Description,
       ReviewedByEmployeeID = @ReviewedByEmployeeID,
       ReviewStatus = @ReviewStatus,
       ReviewDate = @ReviewDate,
       Is_ShowPersonal = @Is_ShowPersonal
WHERE  (ID = @ID)
GO

/****** Object:  StoredProcedure [WF_SECTIONS_GetSubstitute]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- مديراني که پرسنل مربوطه را به عنوان جانشين خود معرفي کرده اند

CREATE PROCEDURE [WF_SECTIONS_GetSubstitute]
@SEmp_No FLOAT
AS
SELECT wgev.EMP_NO,wgev.[NAME],
wgev.FAMILY,CAST(wgev.EMP_NO AS NVARCHAR) + ' ' + wgev.[NAME] + ' ' + wgev.FAMILY FullName,s.S_FDate,s.S_TDate
FROM SECTIONS s JOIN WF_GetEmployee_VI wgev ON s.EmpManager=wgev.EMP_NO
WHERE  s.SEmp_No = @SEmp_No
GO

/****** Object:  StoredProcedure [WF_SECTIONS_IsSubstitute]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_SECTIONS_IsSubstitute]
@SEmp_No FLOAT
AS
SELECT COUNT(1) FROM SECTIONS s WHERE s.SEmp_No=@SEmp_No
GO

/****** Object:  StoredProcedure [WF_SECTIONS_Update]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_SECTIONS_Update]
	@If_SEC_NO	float,
	@EmpManager	float,
	@Duty	int,
	@Leave	int,
	@LeaveOut	int
AS
	UPDATE SECTIONS
	Set
		[EmpManager]=@EmpManager,
		[Duty]=@Duty,
		[Leave]=@Leave,
		[LeaveOut]=@LeaveOut
	Where
	(
		[SEC_NO]=@If_SEC_NO
	)
GO

/****** Object:  StoredProcedure [WF_SECTIONSGetData]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_SECTIONSGetData]
AS
SELECT    s.*,e.[NAME]+' '+e.FAMILY ManagerName
,e1.[NAME]+' '+e1.FAMILY Substitute
FROM         SECTIONS s
LEFT OUTER JOIN EMPLOYEE e ON e.EMP_NO=s.EmpManager
left OUTER JOIN EMPLOYEE e1 ON e1.EMP_NO=s.SEmp_No
GO

/****** Object:  StoredProcedure [WF_SectionsGetManagerBySubstitute]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_SectionsGetManagerBySubstitute]
@SEmp_No FLOAT,
@S_TDate INT,
@S_FDate INT
AS
SELECT * FROM SECTIONS s WHERE  
s.SEmp_No = @SEmp_No 
AND CAST(REPLACE(s.S_TDate, '/', '') AS INT) >= @S_TDate
AND CAST(REPLACE(s.S_FDate, '/', '') AS INT) <= @S_FDate
GO

/****** Object:  StoredProcedure [WF_SECTIONSSetSEmp]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WF_SECTIONSSetSEmp]
@SEC_NO FLOAT,
@SEmp_No FLOAT,
@S_FDate VARCHAR(10),
@S_TDate VARCHAR(10)
AS
UPDATE SECTIONS
SET 
	SEmp_No = @SEmp_No,
	S_FDate = @S_FDate,
	S_TDate = @S_TDate 
WHERE SEC_NO=@SEC_NO
GO

/****** Object:  StoredProcedure [WF_SelectManager]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_SelectManager]
AS
SELECT   * FROM  EMPLOYEE
WHERE     (IsCut = 0) AND (SYS_ACTIVE = 1) AND (ISNULL(IS_KARMAND, 0) = 1)
GO

/****** Object:  StoredProcedure [WF_SelectOperationTypes]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_SelectOperationTypes]
AS
SELECT OperationsID, Name FROM OperationTypes
GO

/****** Object:  StoredProcedure [WF_SHIFTSGetData]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_SHIFTSGetData]
AS
SELECT *
FROM   SHIFTS
GO

/****** Object:  StoredProcedure [WF_SHIFTSGetDataByShiftNo]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_SHIFTSGetDataByShiftNo]
@Shift_no SMALLINT
AS
SELECT *
FROM   SHIFTS
WHERE (SHIFT_NO = @Shift_no)
GO

/****** Object:  StoredProcedure [WF_UsersGetData]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_UsersGetData]
AS
SELECT *
FROM   Users
GO

/****** Object:  StoredProcedure [WF_UsersGetDataByIdAndPassword]    Script Date: 11/24/2009 17:29:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [WF_UsersGetDataByIdAndPassword]
@UserID VARCHAR(20),
@PASSWORD VARCHAR(15)
AS
SELECT *,e.[NAME]+' '+e.FAMILY AS FullName
FROM   Users u
left outer JOIN EMPLOYEE e ON e.EMP_NO=u.USERS_EmpNo
WHERE  (u.USERS_ID = @UserID)
       AND (u.USERS_PASSWORD = @password)
GO
if not  exists (select * from dbo.sysobjects where id = object_id(N'[EmpRequestActions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [EmpRequestActions] (
	[ActionId] [int] NOT NULL ,
	[EmpNo] [float] NOT NULL 
) ON [PRIMARY]
GO
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EMPLOYEEGetData]
GO
create PROCEDURE [WF_EMPLOYEEGetData]
AS
SELECT *, wgev.FullName +' '+ltrim(wgev.EMP_NO) EmpName FROM WF_GetEmployee_VI wgev
ORDER BY wgev.FullName 
GO
ALTER PROCEDURE [WF_EMPLOYEEGetData]
AS
SELECT *, wgev.FullName +' '+STR(wgev.EMP_NO) EmpName FROM WF_GetEmployee_VI wgev
ORDER BY wgev.FullName
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[WF_GetIsPermission]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [WF_GetIsPermission]
GO
CREATE PROC WF_GetIsPermission
@ActionId INT,
@EmpNo FLOAT
AS
IF EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=@ActionId AND a.IsPermission=1)
	if EXISTS(SELECT * FROM EmpRequestActions era WHERE era.ActionId=@ActionId AND era.EmpNo=@EmpNo)
		SELECT 1 IsPermission
	ELSE SELECT 0 IsPermission
ELSE SELECT 0 IsPermission
GO
ALTER PROCEDURE [WF_EMPLOYEEGetData]
AS
SELECT *, wgev.FullName +' '+LTRIM(wgev.EMP_NO) EmpName FROM WF_GetEmployee_VI wgev
ORDER BY wgev.FullName
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[Action]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [Action] (
	[ActionId] [int] NOT NULL ,
	[Fdesc] [nvarchar] (200) COLLATE Arabic_CI_AS NOT NULL ,
	[IsPermission] [bit] NOT NULL 
) ON [PRIMARY]
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[Action]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
ALTER TABLE [Action] ADD 
	CONSTRAINT [DF_Action_IsPermission] DEFAULT (1) FOR [IsPermission],
	CONSTRAINT [PK_Action] PRIMARY KEY  CLUSTERED 
	(
		[ActionId]
	)  ON [PRIMARY] 
GO
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=1)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)
VALUES(1,'مرخصي روزانه',1)
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=2)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)
VALUES(2,'ماموريت روزانه',1)
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=3)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)
VALUES(3,'مجوزهاي ساعتي',0)
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=4)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)
VALUES(4,'اصلاح وروود خروج',1)
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=5)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)
VALUES(5,'مجوز اضافه کاري',1)
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=6)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)
VALUES(6,'جابجايي در شيفت',0)
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=7)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)
VALUES(7,'افزايش و کاهش مرخصي',1)
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=8)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)
VALUES(8,'ورود و خروج فراموش شده',1)
GO
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsByEmpMngr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsByEmpMngr]
GO
CREATE PROCEDURE WF_RequestsByEmpMngr
@EmpMngr FLOAT
AS
SELECT e.FullName AS EmployeeName, c.TITLE, Submitted.FullName AS Submitted, 
       ApprovalName.FullName AS Approval, CurManager.FullName AS CurManager, c.CARD_TYPE AS 
       CARD_TYPE, c.IS_DAY AS IS_DAY,
       CASE r.OperationsID 
       	      WHEN 1 THEN dbo.ConvertToTimeFormat(LTRIM(r.Duration))
	      WHEN 5 THEN CASE 
			       WHEN r.[Type] =104 THEN SUBSTRING(r.Duration,0,LEN(r.Duration)-1)+':'+SUBSTRING(r.Duration,LEN(r.Duration)-1,LEN(r.Duration))
	      		       WHEN c.IS_DAY =1  THEN  LTRIM(r.Duration)+'روز' 
			       WHEN c.IS_DAY =0  THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
	      		  END
              WHEN 3 THEN CASE c.IS_DAY 
	      		       WHEN 1 THEN  LTRIM(r.Duration)+'روز'               
			       WHEN 0 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
			  END
              WHEN 2 THEN CASE r.[Type] 
              			WHEN 100 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
              			WHEN 101 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
              			WHEN 102 THEN LTRIM(r.Duration)+'روز'
              		  END	
       END AS Duration,r.RequestsID, r.EMP_NO,dbo.ShamsyDate(r.SubmittedDate)SubmittedDate, r.[Type],
       dbo.ShamsyDate(r.StartDate)StartDate,dbo.ShamsyDate(r.EndDate)EndDate, r.StartHour, r.EndHour,
       r.SubmittedByEmployeeID, r.IsFinalApproved,
       r.ApprovalByManagerEmp_No, r.ApprovalDate,
       r.OperationsID, r.[Description], r.CurEmp_NO,
       r.ManagerIdea, r.AcceptCode, r.CurSection
FROM   CARDS c
       RIGHT OUTER JOIN Requests r
            ON  c.CARD_NO = r.Type
       LEFT OUTER JOIN WF_GetEmployee_VI e
            ON  e.EMP_NO = r.EMP_NO
       LEFT OUTER JOIN WF_GetEmployee_VI CurManager
            ON  CurManager.EMP_NO = r.CurEmp_NO
       LEFT OUTER JOIN WF_GetEmployee_VI Submitted
            ON  Submitted.EMP_NO = r.SubmittedByEmployeeID
       LEFT OUTER JOIN WF_GetEmployee_VI ApprovalName
            ON  ApprovalName.EMP_NO = r.ApprovalByManagerEmp_No
WHERE (r.EMP_NO IN (SELECT e2.EMP_NO FROM EMPLOYEE e2 WHERE e2.EmpMngr=@EmpMngr)            
OR (r.CurEmp_NO=@EmpMngr)) AND r.IsFinalApproved IS NULL
ORDER BY r.StartHour          
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[Paging_Cursor]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [Paging_Cursor]
GO
/*************************************************************************************************/
CREATE PROCEDURE Paging_Cursor (
@Tables nvarchar(1000),
@PK nvarchar(100),
@Sort nvarchar(200) = NULL,
@PageNumber int = 1,
@PageSize int = 10,
@Fields nvarchar(1000) = '*',
@Filter nvarchar(1000) = NULL,
@Group nvarchar(1000) = NULL)
AS

/*Find the @PK type*/
DECLARE @PKTable nvarchar(100)
DECLARE @PKName nvarchar(100)
DECLARE @type nvarchar(100)
DECLARE @prec int

IF CHARINDEX('.', @PK) > 0
      BEGIN
            SET @PKTable = SUBSTRING(@PK, 0, CHARINDEX('.',@PK))
            SET @PKName = SUBSTRING(@PK, CHARINDEX('.',@PK) + 1, LEN(@PK))
      END
ELSE
      BEGIN
            SET @PKTable = @Tables
            SET @PKName = @PK
      END

SELECT @type=t.name, @prec=c.prec
FROM sysobjects o 
JOIN syscolumns c on o.id=c.id
JOIN systypes t on c.xusertype=t.xusertype
WHERE o.name = @PKTable AND c.name = @PKName

IF CHARINDEX('char', @type) > 0
   SET @type = @type + '(' + CAST(@prec AS varchar) + ')'

DECLARE @strPageSize nvarchar(50)
DECLARE @strStartRow nvarchar(50)
DECLARE @strFilter nvarchar(1000)
DECLARE @strGroup nvarchar(1000)

/*Default Sorting*/
IF @Sort IS NULL OR @Sort = ''
      SET @Sort = @PK
ELSE
      BEGIN
            IF(CHARINDEX('MiladyStartDate',@Sort)=0)
                  SET @Sort=REPLACE(@Sort,'StartDate','MiladyStartDate')
            IF(CHARINDEX('MiladySubmittedDate',@Sort)=0)
                  SET @Sort=REPLACE(@Sort,'SubmittedDate','MiladySubmittedDate')
      END 
 
/*Default Page Number*/
IF @PageNumber < 1
      SET @PageNumber = 1

/*Set paging variables.*/
SET @strPageSize = CAST(@PageSize AS varchar(50))
SET @strStartRow = CAST(((@PageNumber - 1)*@PageSize + 1) AS varchar(50))


/*Set filter & group variables.*/
IF @Filter IS NOT NULL AND @Filter != ''
BEGIN
      IF(CHARINDEX(N'Where', @Filter)>0)
            SET @strFilter = @Filter + ' '      
      ELSE SET @strFilter =' WHERE '+@Filter + ' '    
END ELSE
      SET @strFilter = ''
      

IF @Group IS NOT NULL AND @Group != ''
      SET @strGroup = ' GROUP BY ' + @Group + ' '
ELSE
      SET @strGroup = ''
      
/*Execute dynamic query*/     
DECLARE @sqlStr NVARCHAR(2000)
SET @sqlStr=(
'DECLARE @PageSize int
SET @PageSize = ' + @strPageSize + '

DECLARE @PK ' + @type + '
DECLARE @tblPK TABLE (
            PK  ' + @type + ' NOT NULL PRIMARY KEY
            )
SELECT TOP 500 '+@Fields+' INTO #tbl FROM '+ @Tables + @strFilter + ' ' + @strGroup + ' ORDER BY ' + @Sort + '

DECLARE PagingCursor CURSOR DYNAMIC READ_ONLY FOR
SELECT '  + @PK + ' FROM #tbl ' + @Tables +'

OPEN PagingCursor
FETCH RELATIVE ' + @strStartRow + ' FROM PagingCursor INTO @PK

SET NOCOUNT ON

WHILE @PageSize > 0 AND @@FETCH_STATUS = 0
BEGIN
            INSERT @tblPK (PK)  VALUES (@PK)
            FETCH NEXT FROM PagingCursor INTO @PK
            SET @PageSize = @PageSize - 1
END

CLOSE       PagingCursor
DEALLOCATE  PagingCursor

SELECT ' + @Fields + ' FROM #tbl ' + @Tables + ' JOIN @tblPK tblPK ON ' + @PK + ' = tblPK.PK  ORDER BY ' + @Sort+' 

SELECT COUNT(1) TotalPages FROM #tbl

Drop Table #tbl
'
)
--PRINT @sqlStr
EXEC(@sqlStr)	
/*************************************************************************************************/
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[WardenSection]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [WardenSection] (
	[WardenEmp_NO] [float] NOT NULL ,
	[SecNo] [float] NOT NULL 
) ON [PRIMARY]
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[WardenSection]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
ALTER TABLE [WardenSection] ADD 
	CONSTRAINT [PK_WardenSection] PRIMARY KEY  CLUSTERED 
	(
		[WardenEmp_NO],
		[SecNo]
	)  ON [PRIMARY] 
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[WF_Rep_RequestByEmp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [WF_Rep_RequestByEmp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[WF_Rep_TurnoverRequestInMonth]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [WF_Rep_TurnoverRequestInMonth]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[WF_Rep_TurnoverRequestInWeek]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [WF_Rep_TurnoverRequestInWeek]
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE WF_Rep_RequestByEmp
@FromDate     DATETIME,
@ToDate    DATETIME
AS
SELECT     TOP 100 PERCENT r.EMP_NO, COUNT(r.RequestsID) AS TotalCount,
                          (SELECT     COUNT(1)
                             FROM         Requests r2
                             WHERE     r2.EMP_NO = r.EMP_NO AND r2.OperationsID = 1) AS OverTimr,
                          (SELECT     COUNT(1)
                             FROM         Requests r2
                             WHERE     r2.EMP_NO = r.EMP_NO AND r2.OperationsID = 2) AS Taradod,
                          (SELECT     COUNT(1)
                             FROM         Requests r2
                             WHERE     r2.EMP_NO = r.EMP_NO AND r2.OperationsID = 3) AS Duty,
                          (SELECT     COUNT(1)
                             FROM         Requests r2
                             WHERE     r2.EMP_NO = r.EMP_NO AND r2.OperationsID = 5) AS Leave, EMPLOYEE.NAME, EMPLOYEE.FAMILY, EMPLOYEE.SEC_NO,
                      SECTIONS.TITLE
FROM         SECTIONS RIGHT OUTER JOIN
                      EMPLOYEE ON SECTIONS.SEC_NO = EMPLOYEE.SEC_NO RIGHT OUTER JOIN
                      Requests r ON EMPLOYEE.EMP_NO = r.EMP_NO
WHERE  r.SubmittedDate>=@FromDate AND r.SubmittedDate<=@ToDate
GROUP BY r.EMP_NO, EMPLOYEE.NAME, EMPLOYEE.FAMILY, EMPLOYEE.SEC_NO, SECTIONS.TITLE
ORDER BY r.EMP_NO

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE WF_Rep_TurnoverRequestInMonth
@Fdate VARCHAR(10),
@Tdate VARCHAR(10),
@Employee NVARCHAR(4000)
AS
DECLARE @DifYear SMALLINT,@YearCount SMALLINT,@MonthCount SMALLINT,@EMP_NO  FLOAT
DECLARE @tbl TABLE (YD INT,MD SMALLINT,EmpNO FLOAT)
SET @YearCount=0
SET @DifYear=CAST(SUBSTRING(@Tdate,1,4) AS INT)-CAST(SUBSTRING(@Fdate,1,4) AS INT)
IF(@Employee='')
    EXEC('DECLARE TCUR CURSOR FOR SELECT e.EMP_NO FROM EMPLOYEE e OPEN TCUR')
ELSE    
    EXEC('DECLARE TCUR CURSOR FOR SELECT e.EMP_NO FROM EMPLOYEE e WHERE e.EMP_NO IN('+@Employee+')  OPEN TCUR')

FETCH NEXT FROM TCUR INTO @EMP_NO
WHILE (@@fetch_status <> -1)
BEGIN
    IF (@@fetch_status <> -2)
    BEGIN
        SET @YearCount=0
        WHILE(@YearCount<= @DifYear)
        BEGIN
            IF(@YearCount=0)
                SET @MonthCount=SUBSTRING(@Fdate,6,2)
            ELSE SET @MonthCount=1
            WHILE(@MonthCount<=12)
            BEGIN   
                IF(@DifYear=@YearCount AND  @MonthCount>CAST(SUBSTRING(@Tdate,6,2) AS INT))
                     BREAK               
                INSERT INTO @tbl VALUES (SUBSTRING(@Fdate,1,4)+@YearCount,@MonthCount, @EMP_NO)                   
                SET @MonthCount=@MonthCount+1
            END
            SET @YearCount=@YearCount+1
        END       
    END
    FETCH NEXT FROM TCUR INTO @EMP_NO
END

CLOSE TCUR
DEALLOCATE TCUR

SELECT     ISNULL(dt.EmpNO,0) EmpNO,(SELECT wgev.[NAME]+' '+wgev.FAMILY FROM EMPLOYEE wgev WHERE wgev.EMP_NO=dt.EmpNO) EmpName,dt.YD, dt.MD,ISNULL(R1.Cnt,0) CountReq,ISNULL(R1.OperationsID,0) OperationsID
FROM         (SELECT     COUNT(RequestsID) AS Cnt, SUBSTRING(dbo.ShamsyDate( SubmittedDate),1,4) AS YD, SUBSTRING(dbo.ShamsyDate(SubmittedDate),6,2) AS MD, CurEmp_NO,r.OperationsID
                        FROM         Requests r
                        GROUP BY   SUBSTRING(dbo.ShamsyDate( SubmittedDate),1,4), SUBSTRING(dbo.ShamsyDate(SubmittedDate),6,2), CurEmp_NO,r.OperationsID
) R1 RIGHT OUTER JOIN
                      @tbl dt ON R1.YD = dt.YD AND R1.MD = dt.MD AND dt.EmpNO=R1.CurEmp_NO
ORDER BY dt.EmpNO,dt.YD,dt.MD

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE WF_Rep_TurnoverRequestInWeek
@Fdate DATETIME=null,
@Tdate DATETIME=null,
@Employee NVARCHAR(4000)=''
AS
DECLARE @DifYear SMALLINT,@YearCount SMALLINT,@WeekCount SMALLINT,@EMP_NO  FLOAT
DECLARE @tbl TABLE (YD INT,WD SMALLINT,EmpNO FLOAT)
SET @DifYear=DATEDIFF(YEAR,@Fdate,@Tdate)
IF(@Employee='')
    EXEC('DECLARE TCUR CURSOR FOR SELECT e.EMP_NO FROM EMPLOYEE e OPEN TCUR')
ELSE    
    EXEC('DECLARE TCUR CURSOR FOR SELECT e.EMP_NO FROM EMPLOYEE e WHERE e.EMP_NO IN('+@Employee+')  OPEN TCUR')
   
FETCH NEXT FROM TCUR INTO @EMP_NO
WHILE (@@fetch_status <> -1)
BEGIN
    IF (@@fetch_status <> -2)
    BEGIN
        SET @YearCount=0
        WHILE(@YearCount<= @DifYear)
        BEGIN
            IF(@YearCount=0)
                SET @WeekCount=DATEPART(week,@Fdate)
            ELSE SET @WeekCount=1
            WHILE(@WeekCount<=53)
            BEGIN   
                IF(@DifYear=@YearCount AND  @WeekCount>DATEPART(week,@Tdate))   
                     BREAK
                INSERT INTO @tbl VALUES ( YEAR(@Fdate)+@YearCount,@WeekCount, @EMP_NO)
                SET @WeekCount=@WeekCount+1
            END       
            SET @YearCount=@YearCount+1
        END       
    END
    FETCH NEXT FROM TCUR INTO @EMP_NO
END

CLOSE TCUR
DEALLOCATE TCUR

SELECT     tbl.EmpNO, (SELECT wgev.[NAME]+' - '+wgev.FAMILY  FROM EMPLOYEE wgev WHERE wgev.EMP_NO=tbl.EmpNO) EmpName, tbl.YD,tbl.WD,ISNULL(dt.CountReq,0) CountReq
,ISNULL(dt.OperationsID,0) OperationsID
FROM   (SELECT r.CurEmp_NO, YEAR(r.SubmittedDate) YSD,DATEPART(week,r.SubmittedDate)WSD,COUNT(r.RequestsID) CountReq,r.OperationsID
FROM Requests r  GROUP BY r.CurEmp_NO, YEAR(r.SubmittedDate),DATEPART(week,r.SubmittedDate),r.OperationsID) dt
RIGHT OUTER JOIN  @tbl  tbl ON dt.WSD = tbl.WD AND dt.YSD = tbl.YD AND dt.CurEmp_NO = tbl.EmpNO
ORDER BY tbl.EmpNO,tbl.YD,tbl.WD

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[WF_EMPLOYEEGetData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [WF_EMPLOYEEGetData]
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [WF_EMPLOYEEGetData]
AS
SELECT *, wgev.FullName +' '+LTRIM(wgev.EMP_NO) EmpName FROM WF_GetEmployee_VI wgev
ORDER BY wgev.FullName

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[MoveUp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [MoveUp] (
	[RequestID] [int] NOT NULL ,
	[DateMoveUp] [datetime] NOT NULL DEFAULT(GETDATE()) ,
	[FromMgrNo] [float] NOT NULL ,
	[ToMgrNo] [float] NOT NULL ,
	[CardNo] [int] NULL 
) ON [PRIMARY]
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[MoveUp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
ALTER TABLE [MoveUp] WITH NOCHECK ADD 
	CONSTRAINT [PK_MovUp] PRIMARY KEY  CLUSTERED 
	(
		[RequestID],
		[FromMgrNo],
		[ToMgrNo]
	)  ON [PRIMARY] 
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[MoveUp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
ALTER TABLE [MoveUp] ADD CONSTRAINT [DF_MovUp_DateMoveUp] DEFAULT (getdate()) FOR [DateMoveUp]
GO
/************************************************************************************/
IF COL_LENGTH('MoveUp','FromSecNo') IS NULL
ALTER TABLE [MoveUp] ADD FromSecNo FLOAT NULL
GO
IF COL_LENGTH('MoveUp','ToSecNo') IS NULL
ALTER TABLE [MoveUp] ADD ToSecNo FLOAT NULL
GO
IF COL_LENGTH('Action','IsShow') IS NULL
ALTER TABLE [Action] ADD IsShow bit NOT NULL CONSTRAINT DF_Action_IsShow DEFAULT 1
/************************************************************************************/
GO
/************************************************************************************/
UPDATE [Action]SET Fdesc = N'مرخصی ساعتي',IsPermission = 1 WHERE ActionId=3
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=9)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)VALUES(9,N'ماموریت ساعتي',	1)
IF NOT EXISTS(SELECT * FROM [Action] a WHERE a.ActionId=10)
INSERT INTO [Action](ActionId,Fdesc,IsPermission)VALUES(10,N'مرخصی بدون حقوق',0)
/************************************************************************************/
GO
/************************************************************************************/
if not exists (select * from dbo.sysobjects where id = object_id(N'[LimitedManager]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [LimitedManager] (
	[Manager_EmpNO] [float] NOT NULL ,
	[Sec_No] [int] NOT NULL ,
	[ActionID] [int] NOT NULL ,
	[LimitDuration] [int] NOT NULL CONSTRAINT [DF_LimitedManager_LimitDuration] DEFAULT (0),
	CONSTRAINT [PK_LimitedManager] PRIMARY KEY  CLUSTERED 
	(
		[Manager_EmpNO],
		[Sec_No],
		[ActionID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROCEDURE [WF_SECTIONS_Update]
	@If_SEC_NO	float,
	@EmpManager	float
AS
	UPDATE SECTIONS	Set	[EmpManager]=@EmpManager Where(	[SEC_NO]=@If_SEC_NO)
/************************************************************************************/	
GO	           
/************************************************************************************/
CREATE PROC WF_EMPLOYEEGetDataByIdAndPassword
@WFUserName NVARCHAR(25),
@WFUserPass NVARCHAR(15)
AS
SELECT s.TITLE,e.EMP_NO,e.NAME, e.FAMILY, e.Img, e.SEC_NO,e.SYS_ACTIVE,e.IsCut,e.GRP_NO,e.END_DATE,e.IS_UNIQ,e.IsWarden,e.IsPrintViewer,
		e.WardenDayCount,e.WardenJustInShift,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 7) THEN 1 ELSE 0 END PrintViewer,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM Conferment c WHERE c.EMP_NO=e.EMP_NO AND GETDATE() BETWEEN c.StartDate AND DATEADD(minute,-1,c.EndDate+1)) 
				THEN 1 ELSE 0 END IsConferment,
				
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6)
				THEN 1 ELSE 0 END) AS BIT) AS Supervisor,
				 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,

CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO 
				AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
				AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute,
				
CASE WHEN EXISTS(SELECT TOP 1 1 FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO)  THEN 1 ELSE 0 END IsEmpMngr,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM WFParallelApprove wa WHERE wa.EmpNo=e.EMP_NO)  THEN 1 ELSE 0 END IsParallelApprove

FROM EMPLOYEE e       
       RIGHT OUTER JOIN SECTIONS s
            ON  s.SEC_NO = e.SEC_NO
WHERE  (e.WFUserName = @WFUserName)
       AND (e.WFUserPass = @WFUserPass)
/************************************************************************************/	           
GO
/************************************************************************************/	           
 
INSERT INTO LimitedManager(Manager_EmpNO,Sec_No,ActionID,LimitDuration)
SELECT s.EmpManager,s.SEC_NO,1,ISNULL(s.Leave,0) Leave  FROM LimitedManager lm 
 RIGHT OUTER JOIN SECTIONS s ON s.Sec_No = lm.Sec_No AND s.EmpManager=lm.Manager_EmpNO AND lm.ActionID=1 
 WHERE lm.Manager_EmpNO IS NULL AND s.EmpManager>0 


INSERT INTO LimitedManager(Manager_EmpNO,Sec_No,ActionID,LimitDuration)
SELECT s.EmpManager,s.SEC_NO,2,ISNULL(s.Duty,0) Leave  FROM LimitedManager lm 
 RIGHT OUTER JOIN SECTIONS s ON s.Sec_No = lm.Sec_No AND s.EmpManager=lm.Manager_EmpNO AND lm.ActionID=2 
 WHERE lm.Manager_EmpNO IS NULL AND s.EmpManager>0 


INSERT INTO LimitedManager(Manager_EmpNO,Sec_No,ActionID,LimitDuration)
SELECT s.EmpManager,s.SEC_NO,10,ISNULL(s.LeaveOut,0) Leave  FROM LimitedManager lm 
 RIGHT OUTER JOIN SECTIONS s ON s.Sec_No = lm.Sec_No AND s.EmpManager=lm.Manager_EmpNO AND lm.ActionID=10 
 WHERE lm.Manager_EmpNO IS NULL AND s.EmpManager>0 

/************************************************************************************/	           
GO
/************************************************************************************/	           
DECLARE @EmpManager FLOAT,@SEC_NO FLOAT,@ActionId INT
DECLARE CurAction CURSOR	READ_ONLY 
FOR SELECT a.ActionId FROM [Action] a
OPEN CurAction
FETCH NEXT FROM CurAction INTO @ActionId
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
			DECLARE CurSECTIONS CURSOR READ_ONLY FOR SELECT s.EmpManager,s.SEC_NO FROM SECTIONS s WHERE s.EmpManager>0		
			OPEN CurSECTIONS
			FETCH NEXT FROM CurSECTIONS INTO @EmpManager,@SEC_NO
			WHILE (@@fetch_status <> -1)
			BEGIN
				IF (@@fetch_status <> -2)
				BEGIN
					IF NOT EXISTS(SELECT * FROM LimitedManager lm WHERE lm.Manager_EmpNO=@EmpManager AND lm.Sec_No=@SEC_NO AND lm.ActionID=@ActionId)
					INSERT INTO LimitedManager(Manager_EmpNO,Sec_No,ActionID,LimitDuration)
					VALUES(@EmpManager,@SEC_NO,@ActionId,0)					
				END
				FETCH NEXT FROM CurSECTIONS INTO @EmpManager,@SEC_NO
			END

			CLOSE CurSECTIONS
			DEALLOCATE CurSECTIONS
	END
	FETCH NEXT FROM CurAction INTO @ActionId
END

CLOSE CurAction
DEALLOCATE CurAction
/************************************************************************************/	           
GO
/************************************************************************************/	           
CREATE PROCEDURE WF_GetTimeType
AS
SELECT * FROM CARDS c WHERE c.IS_DAY=0 AND c.SYS_ACTIVE=1 AND c.CARD_TYPE IN (5,3)
/************************************************************************************/
GO
/************************************************************************************/	           
CREATE PROCEDURE WF_GetLimitManager
@Manager_EmpNO FLOAT,
@Sec_No INT
AS
SELECT DISTINCT s.EmpManager INTO #Managers FROM SECTIONS s 
WHERE s.EmpManager=@Manager_EmpNO OR (s.SEmp_No=@Manager_EmpNO  
			AND CAST(ISNULL(REPLACE(s.S_FDate, '/', ''), 0) AS INT) 
	           <  = CAST(ISNULL(REPLACE(dbo.ShamsyDate(GETDATE()), '/', ''), 0) AS INT)
	       AND CAST(ISNULL(REPLACE(s.S_TDate, '/', ''), 0) AS INT)
	           >= CAST(ISNULL(REPLACE(dbo.ShamsyDate(GETDATE()), '/', ''), 0) AS INT) )
 
SELECT la.Sec_No,la.ActionID,a.Fdesc,la.LimitDuration,la.Manager_EmpNO,la.LimitDurationPerMonth
  FROM LimitedManager la  
JOIN [Action] a ON a.ActionID = la.ActionID 
WHERE (la.Sec_No=@Sec_No AND la.Manager_EmpNO IN (SELECT m.EmpManager FROM #Managers m))
UNION
SELECT c.SEC_NO,c.ActionID,a.Fdesc,c.PermitValue,c.EmpManager,ISNULL(lm.LimitDurationPerMonth,0)
FROM Conferment c 
JOIN [Action] a ON a.ActionID = c.ActionID 
LEFT OUTER JOIN LimitedManager lm ON c.EmpManager=lm.Manager_EmpNO AND lm.Sec_No=@Sec_No 
WHERE (c.EMP_NO=@Manager_EmpNO
		AND c.SEC_NO=@Sec_No 
		AND GETDATE() BETWEEN c.StartDate AND c.EndDate+1
		AND c.IsDelete = 0) 
	   
DROP TABLE #Managers
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROC [WF_UsersGetById]
@UserID VARCHAR(20)
AS
SELECT *,e.[NAME]+' '+e.FAMILY AS FullName
FROM   Users u
left outer JOIN EMPLOYEE e ON e.EMP_NO=u.USERS_EmpNo
WHERE  (u.USERS_ID = @UserID)
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROC WF_EMPLOYEEGetDataByEmpNoForLogin
@EMP_NO	FLOAT
AS
SELECT s.TITLE,e.EMP_NO,e.NAME, e.FAMILY, e.Img, e.SEC_NO,e.SYS_ACTIVE,e.IsCut,e.GRP_NO,e.END_DATE,e.IS_UNIQ,e.IsWarden,e.IsPrintViewer,
		e.WardenDayCount,e.WardenJustInShift,e.WardenIsShowRequest,e.WardenIsShowReview,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 7) THEN 1 ELSE 0 END PrintViewer,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM Conferment c WHERE c.EMP_NO=e.EMP_NO AND GETDATE() BETWEEN c.StartDate AND DATEADD(minute,-1,c.EndDate+1)) 
				THEN 1 ELSE 0 END IsConferment,
				
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6)
				THEN 1 ELSE 0 END) AS BIT) AS Supervisor,
				 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,

CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO 
				AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
				AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute,
				
CASE WHEN EXISTS(SELECT TOP 1 1 FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO)  THEN 1 ELSE 0 END IsEmpMngr,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM WFParallelApprove wa WHERE wa.EmpNo=e.EMP_NO)  THEN 1 ELSE 0 END IsParallelApprove

FROM EMPLOYEE e       
       RIGHT OUTER JOIN SECTIONS s
            ON  s.SEC_NO = e.SEC_NO
WHERE  (e.EMP_NO = @EMP_NO)

/************************************************************************************/
GO
/************************************************************************************/
/****** Object:  UserDefinedFunction [AddDate]    Script Date: 07/26/2011 18:07:06 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[AddDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [AddDate]
GO
CREATE FUNCTION [AddDate]
(
	@ShamsiDate  NVARCHAR(10),
	@iSKabise    BIT
)
RETURNS NVARCHAR(10)
AS
BEGIN
	DECLARE @MonthList  NVARCHAR(24)
	DECLARE @Day_       INT  
	DECLARE @MONTH_     INT  
	DECLARE @Year_      INT  
	SET @Year_ = CAST(SUBSTRING(@ShamsiDate, 1, 4) AS INT)
	SET @MONTH_ = CAST(SUBSTRING(@ShamsiDate, 5, 2) AS INT)
	SET @Day_ = CAST(SUBSTRING(@ShamsiDate, 7, 2) AS INT)
	IF (@Day_ <= 28)
	    SET @Day_ = @Day_ + 1
	ELSE
	BEGIN
	    IF (@MONTH_ <> 12 AND @Day_ = 29)
	        SET @Day_ = @Day_ + 1
	    ELSE
	    IF (@MONTH_ = 12 AND @Day_ = 29 AND @iSKabise = 1)
	        SET @Day_ = @Day_ + 1
	    ELSE
	    IF (@MONTH_ >= 1 AND @MONTH_ <= 6 AND @Day_ = 30)
	        SET @Day_ = @Day_ + 1
	    ELSE
	    IF (@MONTH_ = 12)
	    BEGIN
	        SET @Year_ = @Year_ + 1
	        SET @Day_ = 1
	        SET @MONTH_ = 1
	    END
	    ELSE
	    BEGIN
	        SET @Day_ = 1
	        SET @MONTH_ = @MONTH_ + 1
	    END
	END 
	SET @ShamsiDate = CAST(@Year_ AS NVARCHAR(4)) + DBO.ADDZEROTOSTRING((CAST(@MONTH_ AS NVARCHAR(2))), 2, 1)
	    + DBO.ADDZEROTOSTRING((CAST(@Day_ AS NVARCHAR(2))), 2, 1)
	
	RETURN(@ShamsiDate)
END

GO
/************************************************************************************/

CREATE PROC WF_EMPLOYEEGetDataByIdForLogin
@EMP_NO FLOAT
AS
SELECT s.TITLE, s.EmpManager,s.SEmp_No,s.S_FDate,s.S_TDate, 
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6) THEN 1 ELSE 0 END) AS BIT) AS Supervisor, 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute
,(SELECT COUNT(1) FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO) EmpMngrCount
,e.*
FROM EMPLOYEE e
       LEFT OUTER JOIN SECTIONS s1
            ON  e.EMP_NO = s1.EmpManager
       RIGHT OUTER JOIN SECTIONS s
            ON  s.SEC_NO = e.SEC_NO
WHERE  (e.EMP_NO=@EMP_NO)
       AND (e.IsCut = 0)
       AND (e.END_DATE >= GETDATE())
       AND (e.SYS_ACTIVE = 1)	
/************************************************************************************/
GO
IF COL_LENGTH('Action','RequestValidDays') IS NULL
ALTER TABLE [Action] ADD RequestValidDays INT NOT NULL DEFAULT(31)
GO
/****** Object:  Table [WFUserAccessTime]    Script Date: 10/01/2011 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[WFUserAccessTime]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [WFUserAccessTime](
	[AccessTimeGroupID] [int] NOT NULL,
	[DayNo] [tinyint] NOT NULL,
	[H1] [bit] NULL,
	[H2] [bit] NULL,
	[H3] [bit] NULL,
	[H4] [bit] NULL,
	[H5] [bit] NULL,
	[H6] [bit] NULL,
	[H7] [bit] NULL,
	[H8] [bit] NULL,
	[H9] [bit] NULL,
	[H10] [bit] NULL,
	[H11] [bit] NULL,
	[H12] [bit] NULL,
	[H13] [bit] NULL,
	[H14] [bit] NULL,
	[H15] [bit] NULL,
	[H16] [bit] NULL,
	[H17] [bit] NULL,
	[H18] [bit] NULL,
	[H19] [bit] NULL,
	[H20] [bit] NULL,
	[H21] [bit] NULL,
	[H22] [bit] NULL,
	[H23] [bit] NULL,
	[H24] [bit] NULL,
 CONSTRAINT [PK_WFUserAccessTime] PRIMARY KEY CLUSTERED 
(
	[AccessTimeGroupID] ASC,
	[DayNo] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [WFAccessTimeGroup]    Script Date: 10/01/2011 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[WFAccessTimeGroup]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [WFAccessTimeGroup](
	[AccessTimeGroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](250) NULL,
	[GroupStatus] [tinyint] NULL,
	[IncTolerance] [smallint] NULL,
	[DecTolerance] [smallint] NULL,
 CONSTRAINT [PK_WFAccessTimeGroup] PRIMARY KEY CLUSTERED 
(
	[AccessTimeGroupID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
CREATE PROCEDURE [WFAccessTimeGroup_Select]	
AS
	Select wtg.*
	,LTRIM(wtg.AccessTimeGroupID)+'#'+wtg.GroupName+'#'+LTRIM(wtg.GroupStatus)+'#'+LTRIM(wtg.IncTolerance)+'#'+LTRIM(wtg.DecTolerance) GrpInfo
	,CASE wtg.GroupStatus 
						WHEN 0 THEN N'بدون محدوديت زماني'
						WHEN 1 THEN N'در محدوده شيفت'
						WHEN 2 THEN N'بر اساس جدول هفتگي'
						WHEN 3 THEN N'بازه ثابت (همه روزه)'
					END GroupStatusName

	FROM WFAccessTimeGroup wtg
GO
CREATE PROCEDURE [WFUserAccessTime_Select]
	@If_AccessTimeGroupID	int
AS
	Select * From WFUserAccessTime
	WHERE
	(
		[AccessTimeGroupID]=@If_AccessTimeGroupID
	)	
GO
CREATE PROCEDURE [WFAccessTimeGroup_Insert]
	@GroupName	nvarchar(250),
	@GroupStatus	tinyint,
	@IncTolerance	smallint,
	@DecTolerance	smallint
AS
	INSERT INTO [WFAccessTimeGroup]
	(
		[GroupName],
		[GroupStatus],
		[IncTolerance],
		[DecTolerance]
	)VALUES(
		@GroupName,
		@GroupStatus,
		@IncTolerance,
		@DecTolerance
	)

	Select @@Identity AS NewID	
GO

CREATE PROCEDURE [WFUserAccessTime_Insert]
	@AccessTimeGroupID INT,
	@DayNo TINYINT,
	@H1 BIT,
	@H2 BIT,
	@H3 BIT,
	@H4 BIT,
	@H5 BIT,
	@H6 BIT,
	@H7 BIT,
	@H8 BIT,
	@H9 BIT,
	@H10 BIT,
	@H11 BIT,
	@H12 BIT,
	@H13 BIT,
	@H14 BIT,
	@H15 BIT,
	@H16 BIT,
	@H17 BIT,
	@H18 BIT,
	@H19 BIT,
	@H20 BIT,
	@H21 BIT,
	@H22 BIT,
	@H23 BIT,
	@H24 BIT
AS
	INSERT INTO [WFUserAccessTime]([AccessTimeGroupID],DayNo, [H1], [H2], [H3], [H4], 
	       [H5], [H6], [H7], [H8], [H9], [H10], [H11], [H12], [H13], [H14], 
	       [H15], [H16], [H17], [H18], [H19], [H20], [H21], [H22], [H23], [H24])
	VALUES(@AccessTimeGroupID,@DayNo,@H1,@H2,@H3,@H4,@H5,@H6,@H7,@H8,@H9,@H10,@H11,@H12,
	      @H13,@H14,@H15,@H16,@H17,@H18,@H19,@H20,@H21,@H22,@H23,@H24)		
GO
CREATE PROCEDURE [WFAccessTimeGroup_Delete]
	@If_AccessTimeGroupID	int
AS
	DELETE WFAccessTimeGroup
	Where
	(
		[AccessTimeGroupID]=@If_AccessTimeGroupID
	)	
GO
CREATE PROCEDURE [WFAccessTimeGroup_Update]
	@If_AccessTimeGroupID	int,
	@GroupName	nvarchar(250),
	@GroupStatus	tinyint,
	@IncTolerance	smallint,
	@DecTolerance	smallint
AS
	UPDATE WFAccessTimeGroup
	Set
		[GroupName]=@GroupName,
		[GroupStatus]=@GroupStatus,
		[IncTolerance]=@IncTolerance,
		[DecTolerance]=@DecTolerance
	Where
	(
		[AccessTimeGroupID]=@If_AccessTimeGroupID
	)	    
GO
IF COL_LENGTH('EMPLOYEE','AccessTimeGroupID') IS NULL
ALTER TABLE EMPLOYEE ADD AccessTimeGroupID INT NULL	  
/********************************************************************************************/
GO
/********************************************************************************************/
CREATE PROC [WF_RequestsGetDataBySupervisor]
@Emp_No FLOAT
AS
SELECT r.*,
       e.NAME + ' ' + e.FAMILY EmployeeName,
       e1.NAME + ' ' + e1.FAMILY ApprovalName,
       c.TITLE,
       em.NAME + ' ' + em.FAMILY ManagerName,
       (
           SELECT COUNT(1) AS Expr1
           FROM   Reviews AS rev
           WHERE  (RequestID = r.RequestsID)
                  AND (Is_ShowPersonal = 1)
       ) AS ReviewsCount,
       r.Requested_Time,c.IS_DAY
FROM   Requests AS r
       LEFT OUTER JOIN EMPLOYEE e1
            ON  r.ApprovalByManagerEmp_No = e1.EMP_NO
       LEFT OUTER JOIN EMPLOYEE e
            ON  r.EMP_NO = e.EMP_NO
       LEFT OUTER JOIN EMPLOYEE em
            ON  r.CurEmp_NO = em.EMP_NO
       JOIN CARDS c
            ON  r.Type = c.CARD_NO
WHERE  (r.EMP_NO = @EMP_NO)
       OR  (r.SubmittedByEmployeeID = @EMP_NO)
/********************************************************************************************/
GO
/********************************************************************************************/
CREATE PROC [WF_RequestsGetDataByEmployeeNumber]
@Emp_No FLOAT
AS
SELECT DISTINCT 
       r.*,
       e.NAME + ' ' + e.FAMILY EmployeeName,
       c.TITLE,
       ea.NAME + '  ' + ea.FAMILY ApprovalName,
       em.NAME + '  ' + em.FAMILY ManagerName,
       c.IS_DAY,
       (
           SELECT COUNT(1) AS Expr1
           FROM   Reviews AS re
           WHERE  (re.RequestID = r.RequestsID)
                  AND (re.Is_ShowPersonal = 1)
       ) AS ReviewsCount
FROM   Requests r
       INNER JOIN CARDS c
            ON  c.CARD_NO = r.Type
       INNER JOIN EMPLOYEE e
            ON  r.EMP_NO = e.EMP_NO
       LEFT OUTER JOIN EMPLOYEE ea
            ON  r.ApprovalByManagerEmp_No = ea.EMP_NO
       LEFT OUTER JOIN EMPLOYEE em
            ON  r.CurEmp_NO = em.EMP_NO
WHERE  (r.EMP_NO = @Emp_No) 
/********************************************************************************************/
GO
/********************************************************************************************/
ALTER PROCEDURE WF_RequestsByEmpMngr
@EmpMngr FLOAT,
@StartDate	DATETIME
AS
SELECT e.FullName AS EmployeeName, c.TITLE, Submitted.FullName AS Submitted, 
       ApprovalName.FullName AS Approval, CurManager.FullName AS CurManager, c.CARD_TYPE AS 
       CARD_TYPE, c.IS_DAY AS IS_DAY,
       CASE r.OperationsID 
       	      WHEN 1 THEN dbo.ConvertToTimeFormat(LTRIM(r.Duration))
	      WHEN 5 THEN CASE 
			       WHEN r.[Type] =104 THEN SUBSTRING(r.Duration,0,LEN(r.Duration)-1)+':'+SUBSTRING(r.Duration,LEN(r.Duration)-1,LEN(r.Duration))
	      		       WHEN c.IS_DAY =1  THEN  LTRIM(r.Duration)+'روز' 
			       WHEN c.IS_DAY =0  THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
	      		  END
              WHEN 3 THEN CASE c.IS_DAY 
	      		       WHEN 1 THEN  LTRIM(r.Duration)+'روز'               
			       WHEN 0 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
			  END
              WHEN 2 THEN CASE r.[Type] 
              			WHEN 100 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
              			WHEN 101 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
              			WHEN 102 THEN LTRIM(r.Duration)+'روز'
              		  END	
       END AS Duration,r.RequestsID, r.EMP_NO,dbo.ShamsyDate(r.SubmittedDate)SubmittedDate, r.[Type],
       dbo.ShamsyDate(r.StartDate)StartDate,dbo.ShamsyDate(r.EndDate)EndDate, r.StartHour, r.EndHour,
       r.SubmittedByEmployeeID, r.IsFinalApproved,
       r.ApprovalByManagerEmp_No, r.ApprovalDate,
       r.OperationsID, r.[Description], r.CurEmp_NO,
       r.ManagerIdea, r.AcceptCode, r.CurSection
FROM   CARDS c
       RIGHT OUTER JOIN Requests r
            ON  c.CARD_NO = r.Type
       LEFT OUTER JOIN WF_GetEmployee_VI e
            ON  e.EMP_NO = r.EMP_NO
       LEFT OUTER JOIN WF_GetEmployee_VI CurManager
            ON  CurManager.EMP_NO = r.CurEmp_NO
       LEFT OUTER JOIN WF_GetEmployee_VI Submitted
            ON  Submitted.EMP_NO = r.SubmittedByEmployeeID
       LEFT OUTER JOIN WF_GetEmployee_VI ApprovalName
            ON  ApprovalName.EMP_NO = r.ApprovalByManagerEmp_No
WHERE (r.EMP_NO IN (SELECT e2.EMP_NO FROM EMPLOYEE e2 WHERE e2.EmpMngr=@EmpMngr)            
OR (r.CurEmp_NO=@EmpMngr)) AND r.StartDate>=@StartDate
ORDER BY r.StartDate 
/************************************************************************************/
GO
IF COL_LENGTH('PARMFILE','DayArchive') IS NULL
ALTER TABLE PARMFILE ADD DayArchive			INT NOT NULL DEFAULT(31)
GO
IF COL_LENGTH('PARMFILE','Domain') IS NULL
ALTER TABLE PARMFILE ADD Domain				NVARCHAR(100) NOT NULL DEFAULT('')
GO
IF COL_LENGTH('PARMFILE','DomainFieldEmpNO') IS NULL
ALTER TABLE PARMFILE ADD DomainFieldEmpNO	NVARCHAR(255) NOT NULL DEFAULT('description')
GO
IF COL_LENGTH('PARMFILE','DomainFieldAdmin') IS NULL
ALTER TABLE PARMFILE ADD DomainFieldAdmin	NVARCHAR(255) NOT NULL DEFAULT('physicalDeliveryOfficeName')
GO
IF COL_LENGTH('PARMFILE','Tolerance') IS NULL
ALTER TABLE PARMFILE ADD Tolerance			INT NOT NULL DEFAULT(15)
GO 
IF COL_LENGTH('CARDS','LimitValue') IS NULL
ALTER TABLE CARDS ADD LimitValue int NOT NULL  DEFAULT 999
GO
IF COL_LENGTH('Requests','RequestStatus') IS NULL
ALTER TABLE Requests ADD RequestStatus TINYINT NULL
GO
IF COL_LENGTH('Requests','IOStatus') IS NULL
ALTER TABLE Requests ADD IOStatus TINYINT NULL
GO
IF COL_LENGTH('PARMFILE','WFLimitMonthShowDaily') IS NULL
	ALTER TABLE PARMFILE ADD WFLimitMonthShowDaily TINYINT NOT NULL DEFAULT 6
GO
IF COL_LENGTH('PARMFILE','WFIsChangeUserName') IS NULL
	ALTER TABLE PARMFILE ADD WFIsChangeUserName BIT NOT NULL DEFAULT 1
GO
IF COL_LENGTH('PARMFILE','WFDifrenceRequest') IS NULL
ALTER TABLE PARMFILE ADD WFDifrenceRequest	BIT NOT NULL DEFAULT(0)
/************************************************************************************/	
GO
/************************************************************************************/
-- ليست بخشهاي زير مجموعه مدير
CREATE PROCEDURE [WF_EMPLOYEE_GetSubstitute] 
@SEmp_No FLOAT
AS
SELECT DISTINCT s.EmpManager INTO #Substitute FROM SECTIONS s 
WHERE (s.SEmp_No=@SEmp_No  
			AND CAST(ISNULL(REPLACE(s.S_FDate, '/', ''), 0) AS INT) 
	           <  = CAST(ISNULL(REPLACE(dbo.ShamsyDate(GETDATE()), '/', ''), 0) AS INT)
	       AND CAST(ISNULL(REPLACE(s.S_TDate, '/', ''), 0) AS INT)
	           >= CAST(ISNULL(REPLACE(dbo.ShamsyDate(GETDATE()), '/', ''), 0) AS INT) )

SELECT secMange.SEC_NO,secMange.TITLE,MIN(Permit) Permit FROM (
--Manager
SELECT s.SEC_NO,s.TITLE,1 Permit FROM SECTIONS s 
WHERE s.EmpManager = @SEmp_No
				UNION
--EmpMngr				
SELECT DISTINCT e.SEC_NO,s.TITLE,1 Permit FROM EMPLOYEE e
JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
WHERE e.EmpMngr IN (SELECT m.EmpManager FROM #Substitute m) OR e.EmpMngr=@SEmp_No
				UNION	
--Substitute	           
SELECT s.SEC_NO,s.TITLE,2 Permit FROM SECTIONS s 
WHERE s.EmpManager IN (SELECT m.EmpManager FROM #Substitute m)
				UNION	 
----Other
SELECT s.SEC_NO,s.TITLE,3 Permit 
	FROM(
			SELECT (SELECT TOP 1 mu.FromSecNo FROM MoveUp mu WHERE mu.RequestID=r.RequestsID ORDER BY mu.DateMoveUp ) FromSecNo 
			FROM Requests r
			WHERE	r.MoveUpCnt>0 AND 
					r.IsFinalApproved IS NULL AND 
					(r.CurEmp_NO=@SEmp_No OR r.CurEmp_NO IN (SELECT m.EmpManager FROM #Substitute m))
		)mu
JOIN SECTIONS s ON mu.FromSecNo=s.SEC_NO
				UNION
----Conferment
SELECT c.SEC_NO,s.TITLE,4 Permit  FROM Conferment c 
JOIN SECTIONS s ON s.SEC_NO = c.SEC_NO
WHERE c.EMP_NO=@SEmp_No AND GETDATE() BETWEEN c.StartDate AND c.EndDate AND c.IsDelete=0
)secMange GROUP BY secMange.SEC_NO,secMange.TITLE
DROP TABLE #Substitute
/************************************************************************************/
GO
/************************************************************************************/
Create PROCEDURE WF_FindNearDataFile
@EMP_NO FLOAT,
@Date FLOAT,
@StartTime INT,
@EndTime	INT
AS
DECLARE @Tolerance INT,@IsExistsMaxDateFile INT
SELECT @Tolerance=dbo.Time2Min(p.Tolerance) FROM PARMFILE p

SELECT @IsExistsMaxDateFile=COUNT(1) FROM DataFile df 
	WHERE	df.DATE_=@Date AND df.EMP_NO=@EMP_NO AND 
			dbo.Time2Min(df.TIME_)>= dbo.Time2Min(@StartTime)- @Tolerance 
			
IF(@IsExistsMaxDateFile>0 OR ((dbo.Time2Min(CAST(REPLACE(CONVERT(VARCHAR(5),GETDATE(),108),':','') AS INT))-@Tolerance)>dbo.Time2Min(@StartTime)))
BEGIN
	SELECT DISTINCT TOP 1 df.*,ABS(dbo.Time2Min(@StartTime)-dbo.Time2Min(df.TIME_)) DifTime INTO #DF FROM DataFile df 
	LEFT OUTER JOIN CARDS c ON df.[STATUS] = c.CARD_NO
	WHERE df.EMP_NO=@EMP_NO  AND df.DATE_=@Date
	AND (dbo.Time2Min(df.TIME_) BETWEEN dbo.Time2Min(@StartTime)- @Tolerance AND dbo.Time2Min(@StartTime) + @Tolerance)
	ORDER BY ABS(dbo.Time2Min(@StartTime)-dbo.Time2Min(df.TIME_)) 	

	IF (EXISTS(SELECT * FROM #DF))
		SELECT * FROM #DF	
	ELSE 
	BEGIN
		DECLARE @GroupFirst  INT,@ShiftNew  INT,@Calen_T INT,@Year INT,@Month INT,@Day INT ,@ShamsyDate NVARCHAR(10),@S2_TIME INT,@START_TIME INT	
		DECLARE @Tdate FLOAT
		SET @Tdate=@Date-2
		SET @ShamsyDate= dbo.Miladi2Shamsi(CAST(@Tdate AS DATETIME),0)
		SET @Year=CAST(SUBSTRING(@ShamsyDate,0,5) AS INT)
		SET @Month=CAST(SUBSTRING(@ShamsyDate,5,2) AS INT)
		SET @Day=CAST(SUBSTRING(@ShamsyDate,7,2) AS INT)
		exec Sp_MixFindShift @GroupFirst OUT,@EMP_NO,@Date,@Year,@Month,@Day,@ShiftNew OUT,@Calen_T OUT
		
		IF EXISTS(SELECT * FROM PARMFILE p WHERE @Date BETWEEN p.StartDateRamedan AND p.EndDateRamedan)
			SELECT @START_TIME=s.START_TIME, @S2_TIME=s.RAMEZAN_S FROM SHIFTS s WHERE s.SHIFT_NO=@ShiftNew
		ELSE SELECT @START_TIME=s.START_TIME, @S2_TIME=s.S2_TIME FROM SHIFTS s WHERE s.SHIFT_NO=@ShiftNew
		  
		IF(dbo.Time2Min(@StartTime)<= dbo.Time2Min(@S2_TIME))
		BEGIN
				SELECT TOP 1 df.* FROM DataFile df 
					LEFT OUTER JOIN CARDS c ON df.[STATUS] = c.CARD_NO
				WHERE df.EMP_NO=@EMP_NO  AND df.DATE_=@Date
					AND (dbo.Time2Min(df.TIME_) BETWEEN dbo.Time2Min(@StartTime) AND dbo.Time2Min(@EndTime) + @Tolerance)
				ORDER BY df.TIME_
		END	
	END
	DROP TABLE #DF
END
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROC [WF_PARMFILEGetData]
AS
SELECT CASE p.Domain WHEN NULL THEN 0 WHEN '' THEN 0 ELSE 1 END IsDomain,p.* FROM PARMFILE p
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE [WF_RequestsAcceptRequest]
	@IsFinalApproved BIT,
	@ApprovalByManagerEmp_No FLOAT,
	@RequestsID INT,
	@ManagerIdea NVARCHAR(500),
	@AcceptCode SMALLINT,
	@Requested_Time NVARCHAR(50)
AS
IF(@Requested_Time='')
BEGIN
	UPDATE Requests
	SET    IsFinalApproved = @IsFinalApproved,
	       ApprovalByManagerEmp_No = @ApprovalByManagerEmp_No,
	       ApprovalDate =CASE WHEN ApprovalDate IS NULL THEN GETDATE() ELSE ApprovalDate END,
	       ManagerIdea = @ManagerIdea,
	       AcceptCode =@AcceptCode 
	WHERE RequestsID=@RequestsID
END 
ELSE 
BEGIN
UPDATE Requests
	SET    IsFinalApproved = @IsFinalApproved,
	       ApprovalByManagerEmp_No = @ApprovalByManagerEmp_No,
	       ApprovalDate =CASE WHEN ApprovalDate IS NULL THEN GETDATE() ELSE ApprovalDate END,
	       ManagerIdea = @ManagerIdea,
	       AcceptCode =@AcceptCode ,
	       Requested_Time = @Requested_Time
	WHERE RequestsID=@RequestsID         	
END
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROC [WF_EMPLOYEEGetManagersData]
AS
SELECT DISTINCT e.EMP_NO,e.[NAME],e.FAMILY,LTRIM(STR(e.EMP_NO))+' - '+ e.[NAME]+' '+e.FAMILY FullName
  FROM SECTIONS s 
JOIN EMPLOYEE e ON e.EMP_NO=s.EmpManager
WHERE s.EmpManager IS NOT NULL      
ORDER BY e.EMP_NO
/************************************************************************************/	     
GO
/************************************************************************************/	     
ALTER PROCEDURE [WF_EMPLOYEEGetData]
AS
SELECT *,  LTRIM(STR(wgev.EMP_NO))+' '+wgev.FullName EmpName FROM WF_GetEmployee_VI wgev
ORDER BY wgev.[NAME]
/************************************************************************************/     
GO
/************************************************************************************/
CREATE PROCEDURE [WF_EmployeeGetPerson]
@EmpNo FLOAT
AS
SELECT DISTINCT 
		wgev.EmpManager,
		LTRIM(STR(wgev.EMP_NO))+' '+wgev.FullName FullName, 
		wgev.SEC_NO, 
		wgev.EMP_NO, 
		wgev.OperationsID,
		wgev.TITLE, 
		wgev.SEmp_No, 
		wgev.S_FDate, 
		wgev.S_TDate, 
		wgev.GRP_NO,
		LTRIM(STR(wgev.EMP_NO))+'#'+LTRIM(ISNULL(wgev.GRP_NO,0)) EmpInfo
FROM   WF_SelectEmploye_VI wgev  
WHERE 
	wgev.EMP_NO=@EmpNo OR 
	wgev.SEC_NO IN (SELECT s1.SEC_NO FROM SECTIONS s1 WHERE  s1.EmpManager = @EmpNo OR  (s1.SEmp_No = @EmpNo AND dbo.ShamsyDate(GETDATE()) BETWEEN s1.S_FDate AND s1.S_TDate))	OR 	
	wgev.EMP_NO IN (SELECT em.Emp_No FROM EmployeeManagers em WHERE em.ManagerEmp_No=@EmpNo AND ISNULL(em.OperationsID,6)=6)
ORDER BY wgev.EMP_NO
/************************************************************************************/     
GO
/************************************************************************************/	      
CREATE PROCEDURE [WF_EmployeeBySupervisor]
	@IS_Supervisor BIT
AS
	IF (@IS_Supervisor = 0)
	BEGIN
	    SELECT *,LTRIM(STR(wgev.EMP_NO))+' '+wgev.FullName FullName1
	    FROM   WF_GetEmployee_VI wgev
	    WHERE  wgev.EMP_NO NOT IN (SELECT em.ManagerEmp_No
	                               FROM   EmployeeManagers em
	                               WHERE  em.OperationsID = 6) AND ISNULL(wgev.[Status],1)<>2
	    ORDER BY wgev.EMP_NO
	END
	ELSE
	BEGIN
	    SELECT *,LTRIM(STR(wgev.EMP_NO))+' '+wgev.FullName FullName1
	    FROM   WF_GetEmployee_VI wgev
	    WHERE  wgev.EMP_NO IN (SELECT em.ManagerEmp_No
	                           FROM   EmployeeManagers em
	                           WHERE  em.OperationsID = 6) OR wgev.[Status]=2
	    ORDER BY wgev.EMP_NO  	    
	END
/************************************************************************************/	      
GO
/************************************************************************************/	      
/****** Object:  StoredProcedure [WFUserAccessTime_Update]    Script Date: 11/24/2009 17:29:08 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WFUserAccessTime_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WFUserAccessTime_Update]
GO

CREATE PROCEDURE [WFUserAccessTime_Update]
	@If_AccessTimeGroupID INT,
	@If_DayNo TINYINT,
	@H1 BIT,
	@H2 BIT,
	@H3 BIT,
	@H4 BIT,
	@H5 BIT,
	@H6 BIT,
	@H7 BIT,
	@H8 BIT,
	@H9 BIT,
	@H10 BIT,
	@H11 BIT,
	@H12 BIT,
	@H13 BIT,
	@H14 BIT,
	@H15 BIT,
	@H16 BIT,
	@H17 BIT,
	@H18 BIT,
	@H19 BIT,
	@H20 BIT,
	@H21 BIT,
	@H22 BIT,
	@H23 BIT,
	@H24 BIT
AS
	UPDATE WFUserAccessTime
	SET    [H1] = @H1,
	       [H2] = @H2,
	       [H3] = @H3,
	       [H4] = @H4,
	       [H5] = @H5,
	       [H6] = @H6,
	       [H7] = @H7,
	       [H8] = @H8,
	       [H9] = @H9,
	       [H10] = @H10,
	       [H11] = @H11,
	       [H12] = @H12,
	       [H13] = @H13,
	       [H14] = @H14,
	       [H15] = @H15,
	       [H16] = @H16,
	       [H17] = @H17,
	       [H18] = @H18,
	       [H19] = @H19,
	       [H20] = @H20,
	       [H21] = @H21,
	       [H22] = @H22,
	       [H23] = @H23,
	       [H24] = @H24
	WHERE  ([AccessTimeGroupID] = @If_AccessTimeGroupID AND [DayNo] = @If_DayNo)
/************************************************************************************/	      
GO
/************************************************************************************/	      
IF NOT exists (select * from sysobjects where id = object_id(N'[WF_EmpCard]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [WF_EmpCard] (
	[Emp_NO] [float] NOT NULL,
	[Card_NO] [int] NOT NULL ,
	CONSTRAINT [PK_WF_EmpCard] PRIMARY KEY  CLUSTERED 
	(
		[Emp_NO] ASC,
		[Card_NO] ASC
	)  ON [PRIMARY] ,
) ON [PRIMARY]
/************************************************************************************/	      
GO
/************************************************************************************/	      
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetRequestDuration]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GetRequestDuration]
/************************************************************************************/	      
GO
/************************************************************************************/	      
CREATE PROCEDURE WF_GetRequestDuration
@EMP_NO FLOAT,
@Sdate DATETIME,
@Type INT
AS
DECLARE @CSdate DATETIME,@LimitValue INT,@ValueNext INT,@ValuePrevious INT,@Counter INT 
SET @ValueNext=0
SET @ValuePrevious=0
SELECT @LimitValue=c.LimitValue  FROM CARDS c WHERE c.CARD_NO=@Type
SET @CSdate=@Sdate
SET @Counter=0
WHILE @Counter< @LimitValue
BEGIN
	IF EXISTS(SELECT * FROM Requests r WHERE r.EMP_NO=@EMP_NO AND r.StartDate=@CSdate AND r.[Type]=@Type)
	BEGIN		
		SELECT @CSdate=r.EndDate+1,@Counter=@Counter+CAST(r.Duration AS INT)
		  FROM Requests r WHERE r.EMP_NO=@EMP_NO AND r.StartDate=@CSdate AND r.[Type]=@Type		
		  SET @ValueNext=@Counter		 
		  --PRINT LTRIM(@CSdate)+' -- '+LTRIM(@ValueNext)+' -- R' 
	END ELSE SET @Counter=@LimitValue
END

SET @Counter=0
SET @CSdate=@Sdate
WHILE @Counter< @LimitValue
BEGIN
	IF EXISTS(SELECT * FROM Requests r WHERE r.EMP_NO=@EMP_NO AND r.EndDate=@CSdate AND r.[Type]=@Type)
	BEGIN		
		SELECT @CSdate=r.StartDate-1,@Counter=@Counter+CAST(r.Duration AS INT)
		  FROM Requests r WHERE r.EMP_NO=@EMP_NO AND r.EndDate=@CSdate AND r.[Type]=@Type		
		  SET @ValuePrevious=@Counter
		  --PRINT LTRIM(@CSdate)+' -- '+LTRIM(@ValueNext)+' -- L' 
	END ELSE SET @Counter=@LimitValue
END

SELECT @ValueNext ValueNext,@ValuePrevious ValuePrevious,@ValueNext+@ValuePrevious TotalValues,@LimitValue LimitValue
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetManagersData]'))
DROP VIEW [WF_GetManagersData]
/************************************************************************************/	      
GO
/************************************************************************************/	      
CREATE VIEW [WF_GetManagersData]
AS
SELECT DISTINCT e.EMP_NO,e.[NAME],e.FAMILY, e.[NAME]+' '+e.FAMILY FullName
  FROM SECTIONS s 
JOIN EMPLOYEE e ON e.EMP_NO=s.EmpManager
WHERE s.EmpManager IS NOT NULL      

/************************************************************************************/	     
GO
/************************************************************************************/	     
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_CARDSGetAccessData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_CARDSGetAccessData]
/************************************************************************************/	      
GO
/************************************************************************************/	      
CREATE PROC [WF_CARDSGetAccessData]
@card_type SMALLINT,
@is_day	BIT,
@Emp_NO FLOAT
AS
SELECT *
FROM   CARDS
WHERE  (CARD_TYPE = @card_type)
       AND (IS_DAY = @is_day)
       AND (SYS_ACTIVE = 1)
       AND CARD_NO NOT IN (SELECT wec.Card_NO FROM WF_EmpCard wec  WHERE wec.Emp_NO=@Emp_NO)
/************************************************************************************/	     
GO
/************************************************************************************/	     
ALTER PROC [WF_CARDSGetCardsData]
@is_day	BIT,
@EmpNo FLOAT
AS
SELECT *
FROM   CARDS
WHERE  (
           (IS_DAY = @is_day)
           AND (CARD_TYPE IN (3, 5))
           OR (IS_DAY = @is_day)
           AND (CARD_NO IN (30, 5, 2))
       )
       AND (SYS_ACTIVE = 1)
       AND CARD_NO NOT IN (SELECT wec.Card_NO FROM WF_EmpCard wec  WHERE wec.Emp_NO=@EmpNo)

/************************************************************************************/	     
GO
/************************************************************************************/	     
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestGetRemoveByPwkara]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_RequestGetRemoveByPwkara
/************************************************************************************/	      
GO
/************************************************************************************/	      
 CREATE PROCEDURE WF_RequestGetRemoveByPwkara
 @CurEmp_NO FLOAT
 AS
 DECLARE @tol INT
 SELECT @tol=p.Tolerance FROM PARMFILE p
SELECT * FROM ( 
		SELECT r.RequestsID,r.StartDate,r.StartHour,r.EMP_NO ,r.IsFinalApproved,r.[Type],r.OperationsID,
			CASE 
				WHEN r.StartHour IS NOT NULL THEN	
					(SELECT COUNT(1) FROM DataFile df 
						WHERE	df.EMP_NO=r.EMP_NO AND 
								df.DATE_-2=CAST(r.StartDate AS FLOAT) AND 
								(dbo.Time2Min(df.TIME_) BETWEEN dbo.Time2Min(r.StartHour)- @tol AND dbo.Time2Min(r.StartHour) + @tol) AND
								df.[STATUS]>0
					)
				WHEN r.StartHour IS NULL THEN	
					(SELECT COUNT(1) FROM MOR_MAM mm WHERE mm.EMP_NO=r.EMP_NO AND mm.S_DATE-2=CAST(r.StartDate AS FLOAT))	
			END IsOk
		FROM Requests r WHERE r.AcceptCode=0 AND r.IsFinalApproved=1 AND r.CurEmp_NO=@CurEmp_NO
)dt WHERE dt.IsOk=0 AND dt.[Type]<100
/************************************************************************************/	     
GO
/************************************************************************************/	     
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetTurnoverEmgr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_GetTurnoverEmgr]
/************************************************************************************/	      
GO
/************************************************************************************/	      
CREATE PROCEDURE WF_GetTurnoverEmgr
@FromDate DATETIME,
@ToDate DATETIME,
@CurEmp_NO NVARCHAR(4000),
@OperationsID NVARCHAR(100)
AS
SELECT	wgev.FullName ManagerName,T.CurEmp_NO,
		SUM (case WHEN T.IsFinalApproved IS NULL THEN cnt else 0 END) InKartablCount,
		SUM (case T.IsFinalApproved WHEN 1 THEN cnt else 0 END) AcceptCount,
		SUM (case T.IsFinalApproved WHEN 0 THEN cnt else 0 END) RejectCount,
		SUM (case WHEN T.IsFinalApproved IS NULL THEN t.cntrev else 0 END) InKartablCountRev,
		SUM (case T.IsFinalApproved WHEN 1 THEN t.cntrev else 0 END) AcceptCountRev,
		SUM (case T.IsFinalApproved WHEN 0 THEN t.cntrev else 0 END) RejectCountRev,
		COUNT(mu.RequestID) MoveUpCount 
FROM
(
	SELECT r.CurEmp_NO,r.IsFinalApproved,COUNT(1) cnt,COUNT(r2.ID) cntrev  FROM Requests r
	LEFT OUTER JOIN Reviews r2 ON r2.RequestID = r.RequestsID
	WHERE	r.StartDate BETWEEN @FromDate AND @ToDate AND
			r.OperationsID IN (SELECT fs.item from dbo.fnSplit(@OperationsID) fs) AND 
			r.CurEmp_NO IN (SELECT fs.item from dbo.fnSplit(@CurEmp_NO) fs)
	GROUP BY r.CurEmp_NO,r.IsFinalApproved
)T
JOIN WF_GetEmployee_VI wgev ON wgev.EMP_NO=T.CurEmp_NO
LEFT OUTER JOIN MoveUp mu ON T.CurEmp_NO=mu.FromMgrNo
GROUP BY T.CurEmp_NO,wgev.FullName
/************************************************************************************/	     
GO
/************************************************************************************/	     
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[fnSplit]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [fnSplit]
/************************************************************************************/	     
GO
/************************************************************************************/	     
CREATE FUNCTION [fnSplit](	
	@sInputList  VARCHAR(8000) -- List of delimited items  
)RETURNS @List TABLE (item INT)
BEGIN
	DECLARE @sItem VARCHAR(8000),@sDelimiter  VARCHAR(8000) 
	set @sDelimiter= ',' -- delimiter that separates items
	WHILE CHARINDEX(@sDelimiter, @sInputList, 0) <> 0
	BEGIN
	SELECT 
	 @sItem = RTRIM(LTRIM(SUBSTRING(@sInputList, 1, CHARINDEX(@sDelimiter, @sInputList, 0) -1))),
	 @sInputList = RTRIM(LTRIM(SUBSTRING(@sInputList,CHARINDEX(@sDelimiter, @sInputList, 0) + LEN(@sDelimiter),LEN(@sInputList))))	    
	IF LEN(@sItem) > 0
	 INSERT INTO @List SELECT CAST(@sItem AS INT)
	END
	IF LEN(@sInputList) > 0
	 INSERT INTO @List  SELECT CAST(@sInputList AS INT) -- Put the last item in     	
	 RETURN 
END
/************************************************************************************/
GO
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestGetMoveUpByManagerEmpNo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestGetMoveUpByManagerEmpNo]
GO
/************************************************************************************/
CREATE PROCEDURE [WF_RequestGetMoveUpByManagerEmpNo]
	@EmpManager FLOAT,
	@StartDate DATETIME
AS
	SELECT DISTINCT 
	       r.ApprovalByManagerEmp_No,r.ApprovalDate,ISNULL(r.Duration,0) AS 
	       Duration,r.EMP_NO,r.EndDate,r.EndHour,r.IsFinalApproved,r.OperationsID,
	       r.RequestsID,r.StartDate,r.StartHour,r.SubmittedByEmployeeID,r.SubmittedDate,
	       r.Type,r.WorkflowIdentifier,e.NAME + ' ' + e.FAMILY AS EmployeeName,r.[Description],
	       c.TITLE,me1.NAME + ' ' + me1.FAMILY AS ManagerName,s.EmpManager,s.SEC_NO ,
	       s.TITLE AS SECTIONS,r.CurEmp_NO,s.SEmp_No,s.S_FDate,s.S_TDate,
	       r.AcceptCode,r.CurSection,r.MoveUpCnt,
	       CASE  WHEN r.MoveUpCnt IS NOT NULL THEN 
						N'ارجاع شده' WHEN r.CurEmp_NO <> @EmpManager THEN 
						N'جانشين يا کارتابل خاص' ELSE 
	                    N'عادي' END AS ReqStatus,
	       s2.TITLE AS EmpSecTitle,s2.SEC_NO AS EmpSecNo 
	       ,(SELECT COUNT(1) FROM WFParallelApprove wa WHERE wa.CardNo=r.[Type]) NeedParallelCount
	       ,(SELECT COUNT(1) FROM WFParallelApprove wa
				LEFT OUTER JOIN WFRequestParallelApproval wpa ON  wa.CardNo = wpa.ParallelApprovalCardNo AND 
				wpa.ParallelApprovalEmpNo = wa.EmpNo AND wpa.RequestID = r.RequestsID
				WHERE  wa.CardNo = r.[Type] AND (wpa.RequestID IS NULL OR wpa.IsApprove = 0)
			) ParallelCount,e2.NAME+' '+e2.FAMILY SubmittedFullName,c.IS_DAY
	       
	FROM EMPLOYEE AS e
	LEFT OUTER JOIN SECTIONS AS s2 ON  e.SEC_NO = s2.SEC_NO
	RIGHT OUTER JOIN SECTIONS AS s
	RIGHT OUTER JOIN Requests AS r ON  s.SEC_NO = r.CurSection
	LEFT OUTER JOIN EMPLOYEE AS me1 ON  r.CurEmp_NO = me1.EMP_NO ON  e.EMP_NO = r.EMP_NO
	LEFT OUTER JOIN CARDS AS c ON  r.Type = c.CARD_NO
	LEFT OUTER JOIN EMPLOYEE e2 ON e2.EMP_NO=r.SubmittedByEmployeeID
	WHERE 
			r.RequestsID  IN (SELECT mu.RequestID
								FROM MoveUp mu WHERE mu.FromMgrNo=@EmpManager)
			AND r.StartDate >= @StartDate
/************************************************************************************/		     
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsGetMoveUpByEmpMngr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsGetMoveUpByEmpMngr]
GO
/************************************************************************************/
CREATE PROCEDURE WF_RequestsGetMoveUpByEmpMngr
@EmpMngr FLOAT,
@StartDate	DATETIME
AS
SELECT e.FullName AS EmployeeName, c.TITLE, Submitted.FullName AS Submitted, 
       ApprovalName.FullName AS Approval, CurManager.FullName AS CurManager, c.CARD_TYPE AS 
       CARD_TYPE, c.IS_DAY AS IS_DAY,
       CASE r.OperationsID 
       	      WHEN 1 THEN dbo.ConvertToTimeFormat(LTRIM(r.Duration))
	      WHEN 5 THEN CASE 
			       WHEN r.[Type] =104 THEN SUBSTRING(r.Duration,0,LEN(r.Duration)-1)+':'+SUBSTRING(r.Duration,LEN(r.Duration)-1,LEN(r.Duration))
	      		       WHEN c.IS_DAY =1  THEN  LTRIM(r.Duration)+'روز' 
			       WHEN c.IS_DAY =0  THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
	      		  END
              WHEN 3 THEN CASE c.IS_DAY 
	      		       WHEN 1 THEN  LTRIM(r.Duration)+'روز'               
			       WHEN 0 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
			  END
              WHEN 2 THEN CASE r.[Type] 
              			WHEN 100 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
              			WHEN 101 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour))
              			WHEN 102 THEN LTRIM(r.Duration)+'روز'
              		  END	
       END AS Duration,r.RequestsID, r.EMP_NO,dbo.ShamsyDate(r.SubmittedDate)SubmittedDate, r.[Type],
       dbo.ShamsyDate(r.StartDate)StartDate,dbo.ShamsyDate(r.EndDate)EndDate, r.StartHour, r.EndHour,
       r.SubmittedByEmployeeID, r.IsFinalApproved,
       r.ApprovalByManagerEmp_No, r.ApprovalDate,
       r.OperationsID, r.[Description], r.CurEmp_NO,
       r.ManagerIdea, r.AcceptCode, r.CurSection
FROM   CARDS c
       RIGHT OUTER JOIN Requests r
            ON  c.CARD_NO = r.Type
       LEFT OUTER JOIN WF_GetEmployee_VI e
            ON  e.EMP_NO = r.EMP_NO
       LEFT OUTER JOIN WF_GetEmployee_VI CurManager
            ON  CurManager.EMP_NO = r.CurEmp_NO
       LEFT OUTER JOIN WF_GetEmployee_VI Submitted
            ON  Submitted.EMP_NO = r.SubmittedByEmployeeID
       LEFT OUTER JOIN WF_GetEmployee_VI ApprovalName
            ON  ApprovalName.EMP_NO = r.ApprovalByManagerEmp_No
WHERE 
r.RequestsID  IN (SELECT mu.RequestID
                    FROM MoveUp mu WHERE mu.FromMgrNo=@EmpMngr)
 AND r.StartDate>=@StartDate
ORDER BY r.StartDate 
/************************************************************************************/
GO
/************************************************************************************/
IF COL_LENGTH('Substitute','IsInsertByAdmin') IS NULL
	ALTER TABLE Substitute ADD IsInsertByAdmin BIT NULL
/************************************************************************************/	     
GO
/************************************************************************************/	     
ALTER PROC [WF_CARDSGetAccessData]
@card_type SMALLINT,
@is_day	BIT,
@Emp_NO FLOAT
AS
SELECT *
FROM   CARDS
WHERE  (CARD_TYPE = @card_type)
       AND (IS_DAY = @is_day)
       AND (SYS_ACTIVE = 1)
       AND CARD_NO NOT IN (SELECT wec.Card_NO FROM WF_EmpCard wec  WHERE wec.Emp_NO=@Emp_NO)
       AND LimitValue>0
/************************************************************************************/	     
GO
/************************************************************************************/	     
ALTER PROC [WF_CARDSGetCardsData]
@is_day	BIT,
@EmpNo FLOAT
AS
SELECT *
FROM   CARDS
WHERE  (
           (IS_DAY = @is_day)
           AND (CARD_TYPE IN (3, 5))
           OR (IS_DAY = @is_day)
           AND (CARD_NO IN (30, 5, 2))
       )
       AND (SYS_ACTIVE = 1)
       AND CARD_NO NOT IN (SELECT wec.Card_NO FROM WF_EmpCard wec  WHERE wec.Emp_NO=@EmpNo)
	   AND LimitValue>0
/************************************************************************************/	     
GO
/************************************************************************************/	     
CREATE PROCEDURE WF_SubstituteInsert
@ManagerEmpNo	FLOAT,
@SubstituteEmpNo	FLOAT,
@StartDate	DATETIME,
@EndDate	DATETIME,
@IsActive	BIT,
@IsInsertByAdmin BIT
AS
INSERT INTO Substitute(ManagerEmpNo,SubstituteEmpNo,StartDate,EndDate,IsActive,IsInsertByAdmin)
VALUES(@ManagerEmpNo,@SubstituteEmpNo,@StartDate,@EndDate,	@IsActive,@IsInsertByAdmin	)
/************************************************************************************/	     
GO
/************************************************************************************/	      
ALTER PROC [WF_CARDSGetData]
@card_type SMALLINT,
@is_day	BIT
AS
SELECT * FROM   CARDS
WHERE  (CARD_TYPE = @card_type)
       AND (IS_DAY = @is_day)
       AND (SYS_ACTIVE = 1)
       AND LimitValue>0
/************************************************************************************/	      
GO
/************************************************************************************/	      
IF NOT EXISTS(SELECT * FROM ACTION WHERE ActionId=11)
	INSERT INTO [Action](ActionId,Fdesc,IsPermission,IsShow,RequestValidDays)
	VALUES(11,N'نمايش ترددها',1,1,0)
/************************************************************************************/	      
GO
/************************************************************************************/	      
IF COL_LENGTH('SECTIONS','SetManager') IS NULL
ALTER TABLE SECTIONS ADD SetManager BIT NOT NULL DEFAULT 1
GO
IF COL_LENGTH('SECTIONS','SetConferment') IS NULL
ALTER TABLE SECTIONS ADD SetConferment BIT NOT NULL DEFAULT 1
GO
IF COL_LENGTH('SECTIONS','ModifyDate') IS NULL
ALTER TABLE SECTIONS ADD ModifyDate DATETIME NOT NULL DEFAULT GETDATE()
GO
IF COL_LENGTH('SECTIONS','ModifyUser') IS NULL
ALTER TABLE SECTIONS ADD ModifyUser FLOAT NULL
GO
IF COL_LENGTH('SECTIONS','WF_LimitOverTime') IS NULL
	ALTER TABLE SECTIONS ADD WF_LimitOverTime INT NOT NULL DEFAULT(99900)
/************************************************************************************/	      
GO
/************************************************************************************/
ALTER PROCEDURE [WF_SECTIONS_Update]
	@If_SEC_NO	float,
	@EmpManager	FLOAT,
	@SetManager BIT,
	@SetConferment BIT,
	@LimitOverTime INT
AS
	UPDATE SECTIONS	Set	[EmpManager]=@EmpManager,SetManager =@SetManager,SetConferment = @SetConferment,WF_LimitOverTime = @LimitOverTime
	Where(	[SEC_NO]=@If_SEC_NO)
/************************************************************************************/
GO
/************************************************************************************/	
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SectionsGetSubset]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SectionsGetSubset]
/************************************************************************************/	      
GO
/************************************************************************************/	      
CREATE PROCEDURE [WF_SectionsGetSubset]
	@EmpNo FLOAT
AS
	SELECT s.*,e.[NAME]+' '+e.FAMILY ManagerName FROM SECTIONS s
	JOIN EMPLOYEE e ON s.EmpManager=e.EMP_NO
	WHERE  s.EmpManager = @EmpNo OR  
		(s.SEmp_No = @EmpNo AND 
		GETDATE() BETWEEN dbo.Shamsi2Miladi(REPLACE(s.S_FDate,'/','')) AND dbo.Shamsi2Miladi(REPLACE(s.S_TDate,'/',''))+1)
/************************************************************************************/	
GO
/************************************************************************************/	
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EmployeeGetSubsetPerson]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_EmployeeGetSubsetPerson]
/************************************************************************************/	
GO
/************************************************************************************/	
IF COL_LENGTH('PARMFILE','WFRequestMandeControl') IS NULL
ALTER TABLE PARMFILE ADD WFRequestMandeControl BIT DEFAULT(0) NOT NULL
/************************************************************************************/	
GO
/************************************************************************************/	
IF COL_LENGTH('PARMFILE','WFIsAttachment') IS NULL
ALTER TABLE PARMFILE ADD WFIsAttachment BIT DEFAULT(0) NOT NULL

/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE WF_RequestsIsExistDaily
	@RequestDate DATETIME,
	@EMP_NO FLOAT
AS
	SELECT r.IsFinalApproved,COUNT(1) cnt FROM Requests r
	JOIN CARDS c ON  c.CARD_NO = r.[Type]
	WHERE  r.OperationsID IN (3, 5) AND r.EMP_NO = @EMP_NO AND 
			@RequestDate BETWEEN r.StartDate AND r.EndDate 
	GROUP BY r.IsFinalApproved	
/************************************************************************************/	
GO
/************************************************************************************/   
CREATE PROCEDURE WF_GetTimeTypeByEmpNo
@Emp_NO FLOAT
AS
SELECT * FROM CARDS c WHERE c.IS_DAY=0 AND c.SYS_ACTIVE=1 AND c.CARD_TYPE IN (5,3)
AND c.CARD_NO NOT IN (SELECT wec.Card_NO FROM WF_EmpCard wec WHERE wec.Emp_NO=@Emp_NO)
/************************************************************************************/	      
GO
/************************************************************************************/	      
IF NOT EXISTS(SELECT * FROM OperationTypes WHERE OperationsID=4)
	INSERT INTO OperationTypes(OperationsID,[Name])
	VALUES(4,N'ماموريت ساعتي بدون بازگشت')
/************************************************************************************/	      
GO
/************************************************************************************/	      
IF NOT EXISTS(SELECT * FROM ACTION WHERE ActionId=12)
	INSERT INTO [Action](ActionId,Fdesc,IsPermission,IsShow,RequestValidDays)
	VALUES(12,N'ماموريت ساعتي بدون بازگشت',1,1,3)
/************************************************************************************/	      
GO
/************************************************************************************/	      
IF NOT EXISTS(SELECT * FROM ACTION WHERE ActionId=13)
	INSERT INTO [Action](ActionId,Fdesc,IsPermission,IsShow,RequestValidDays)
	VALUES(13,N'اصلاح نوع ورودوخروج',1,1,31)	
/************************************************************************************/	      	
GO
/************************************************************************************/	      	
if not  exists (select * from dbo.sysobjects where id = object_id(N'[Attachment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[Attachment](
	[AttachmentID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Attachment] [image] NULL,
	[Attachment_thu] [image] NULL,
	[Attachment_Type] [nvarchar](250) NOT NULL,
	 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
	(
		[AttachmentID] ASC
	) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_Attachment_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_Attachment_Delete]
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_Attachment_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_Attachment_Insert]
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_Attachment_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_Attachment_Select]
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_Attachment_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_Attachment_SelectByID]
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_Attachment_SelectByRequestID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_Attachment_SelectByRequestID]
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_Attachment_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_Attachment_Update]
GO
/******************************************************************/
CREATE PROCEDURE [dbo].[WF_Attachment_Delete]
	@If_AttachmentID	int
AS
	DELETE Attachment
	Where
	(
		[AttachmentID]=@If_AttachmentID
	)
GO
/******************************************************************/
CREATE PROCEDURE [dbo].[WF_Attachment_Insert]
	@RequestID	int,
	@Name	nvarchar(250),
	@Attachment	image,
	@Attachment_thu	IMAGE,
	@Attachment_Type NVARCHAR(250)
AS
	INSERT INTO [Attachment]
	(
		[RequestID],
		[Name],
		[Attachment],
		[Attachment_thu],
		[Attachment_Type]
	)VALUES(
		@RequestID,
		@Name,
		@Attachment,
		@Attachment_thu,
		@Attachment_Type
	)

	Select @@Identity AS NewID
GO
/******************************************************************/
CREATE PROCEDURE [dbo].[WF_Attachment_Select]
AS
	Select * From Attachment
GO
/******************************************************************/
CREATE PROCEDURE [dbo].[WF_Attachment_SelectByID]
	@If_AttachmentID	int
AS
	Select *
	From Attachment
	WHERE
	(
		[AttachmentID]=@If_AttachmentID
	)
GO
/******************************************************************/
CREATE PROCEDURE [dbo].[WF_Attachment_SelectByRequestID]
	@If_RequestID	int
AS
	Select *
	From Attachment
	WHERE
	(
		[RequestID]=@If_RequestID
	)
GO
/******************************************************************/
CREATE PROCEDURE [dbo].[WF_Attachment_Update]
	@If_AttachmentID	int,
	@RequestID	int,
	@Name	nvarchar(250),
	@Attachment	image,
	@Attachment_thu	IMAGE,
	@Attachment_Type NVARCHAR(250)
AS
	UPDATE Attachment
	Set
		[RequestID]=@RequestID,
		[Name]=@Name,
		[Attachment]=@Attachment,
		[Attachment_thu]=@Attachment_thu,
		[Attachment_Type]=@Attachment_Type
	Where
	(
		[AttachmentID]=@If_AttachmentID
	)
GO
ALTER	PROC [WF_RequestsDelete]
@RequestsID INT
AS
BEGIN TRANSACTION xx
	DELETE FROM Attachment  WHERE RequestID=@RequestsID  
	DELETE FROM Requests WHERE RequestsID=@RequestsID
	IF @@ROWCOUNT = 0
		ROLLBACK TRANSACTION xx		
COMMIT TRANSACTION xx
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_Attachment_DeleteByRequestID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_Attachment_DeleteByRequestID]
GO
/******************************************************************/
CREATE PROCEDURE [dbo].[WF_Attachment_DeleteByRequestID]
	@RequestID	int
AS
	DELETE Attachment
	WHERE RequestID=@RequestID
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_Rep_Request]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_Rep_Request]
GO
/******************************************************************/
CREATE PROCEDURE [dbo].[WF_Rep_Request]
@FromDate DATETIME ,
@ToDate DATETIME ,
@Type INT 
AS
DECLARE @tCard TABLE(CARD_NO INT)
IF(@Type=1)--Morakhasi Rozane
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@Type=2)--Mamoriat Rozane	
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@Type=3)--Morakhasi Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE IF(@Type=4)--Eslahe Vorod Khoroj
	INSERT INTO @tCard VALUES(101)
ELSE IF(@Type=5)--Ezafe Kari
	INSERT INTO @tCard VALUES(103)	
ELSE IF(@Type=6)--Jabejayee Shift
	INSERT INTO @tCard VALUES(102)	
ELSE IF(@Type=7)--Afzayesh Kahesh Morakhasi
	INSERT INTO @tCard VALUES(104)	
ELSE IF(@Type=8)--Vorod Khoroj Faramosh shode
	INSERT INTO @tCard VALUES(100)			
ELSE IF(@Type=9)--Mamoriat Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE INSERT INTO @tCard VALUES(@Type)

SELECT r.StartDate ,r.EMP_NO ,e.PERS_NO ,e.[NAME],e.FAMILY,s.TITLE ,r.IsFinalApproved,s.SEC_NO,r.RequestsID,r.[Type],c.TITLE CardTITLE,r.Distination
  FROM Requests r 
JOIN EMPLOYEE e ON e.EMP_NO = r.EMP_NO
JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
JOIN CARDS c ON c.CARD_NO=r.[Type]
WHERE r.[Type] IN (SELECT t.CARD_NO FROM @tCard t)
AND r.StartDate BETWEEN @FromDate AND @ToDate
ORDER BY r.StartDate
/******************************************************************/
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_DeleteUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_DeleteUsers]
/******************************************************************/
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_UpdateUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_UpdateUsers]
/******************************************************************/
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_InsertUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_InsertUsers]
GO
/******************************************************************/
CREATE PROCEDURE WF_InsertUsers
@UserID NVARCHAR(255),
@UserPass NVARCHAR(255),
@SDate DATETIME,
@Edate DATETIME
AS
IF EXISTS(SELECT * FROM Users u WHERE u.USERS_ID=@UserID)
	RAISERROR (N'نام کاربري قبلا انتخاب شده است',10,1)
ELSE 
	BEGIN
		INSERT INTO Users(USERS_ID,USERS_PASSWORD,USERS_ACTIVITY_DATE,USERS_DEACTIV_DATE,USERS_NAME)
		VALUES(@UserID,@UserPass,@SDate,@Edate,'WF')		
	END
/******************************************************************/	
GO
/******************************************************************/
CREATE PROCEDURE WF_UpdateUsers
@UserID NVARCHAR(255),
@UserPass NVARCHAR(255),
@SDate DATETIME,
@Edate DATETIME
AS
UPDATE Users
SET USERS_PASSWORD = @UserPass,
    USERS_ACTIVITY_DATE = @SDate,
    USERS_DEACTIV_DATE = @Edate    
WHERE USERS_ID = @UserID   
/******************************************************************/    
GO
/******************************************************************/
CREATE PROCEDURE WF_DeleteUsers
@UserID NVARCHAR(255)
AS
DELETE FROM Users WHERE USERS_ID = @UserID
/**********************************************************/	
GO
/**********************************************************/	
IF COL_LENGTH('PARMFILE','DayArchiveKind') IS NULL
	ALTER TABLE PARMFILE ADD DayArchiveKind BIT DEFAULT(0) NOT NULL
GO
IF COL_LENGTH('Requests','IsWardenCheck') IS NULL
	ALTER TABLE Requests ADD IsWardenCheck BIT DEFAULT(0) NOT NULL
GO
IF COL_LENGTH('Action','LimitCount') IS NULL
	ALTER TABLE [Action] ADD LimitCount INT DEFAULT(999) NOT NULL	
GO
/******************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_GetRequest_VI]'))
DROP VIEW [dbo].[WF_GetRequest_VI]
GO
/******************************************************************/
CREATE VIEW [dbo].[WF_GetRequest_VI]
AS
SELECT     e.FullName AS Employee, c.TITLE, Submitted.FullName AS Submitted, ApprovalName.FullName AS Approval, CurManager.FullName AS CurManager, c.CARD_TYPE, 
                      c.IS_DAY, CASE r.OperationsID WHEN 1 THEN dbo.ConvertToTimeFormat(LTRIM(r.Duration)) WHEN 5 THEN CASE WHEN r.[Type] = 104 THEN SUBSTRING(r.Duration, 
                      0, LEN(r.Duration) - 1) + ':' + SUBSTRING(r.Duration, LEN(r.Duration) - 1, LEN(r.Duration)) WHEN c.IS_DAY = 1 THEN LTRIM(r.Duration) 
                      + 'روز' WHEN c.IS_DAY = 0 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour)) END WHEN 3 THEN CASE c.IS_DAY WHEN 1 THEN LTRIM(r.Duration) 
                      + 'روز' WHEN 0 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour)) 
                      END WHEN 2 THEN CASE r.[Type] WHEN 100 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour)) WHEN 101 THEN dbo.ConvertToTimeFormat(LTRIM(r.StartHour)) 
                      WHEN 102 THEN LTRIM(r.Duration) + 'روز' END END AS Duration, r.RequestsID, r.EMP_NO, dbo.ShamsyDate(r.SubmittedDate) AS SubmittedDate, r.Type, 
                      dbo.ShamsyDate(r.StartDate) AS StartDate, dbo.ShamsyDate(r.EndDate) AS EndDate, r.StartHour, r.EndHour, r.SubmittedByEmployeeID, r.IsFinalApproved, 
                      r.ApprovalByManagerEmp_No, r.ApprovalDate, r.OperationsID, r.Description, r.CurEmp_NO, r.ManagerIdea, r.AcceptCode, r.CurSection, 
                      r.SubmittedDate AS MiladySubmittedDate, r.StartDate AS MiladyStartDate, r.EndDate AS MiladyEndDate, r.Duration AS OrgDuration, e.SEC_NO, 
                      (CASE r.IsFinalApproved WHEN 1 THEN 'تاييد شده' WHEN 0 THEN 'رد شده' ELSE 'ارسال شده' END) AS STATUS, r.IsWardenCheck, r.MoveUpCnt, r.Requested_Time, 
                      r.RequestStatus, r.IOStatus
FROM         dbo.CARDS AS c RIGHT OUTER JOIN
                      dbo.Requests AS r ON c.CARD_NO = r.Type LEFT OUTER JOIN
                      dbo.WF_GetEmployee_VI AS e ON e.EMP_NO = r.EMP_NO LEFT OUTER JOIN
                      dbo.WF_GetEmployee_VI AS CurManager ON CurManager.EMP_NO = r.CurEmp_NO LEFT OUTER JOIN
                      dbo.WF_GetEmployee_VI AS Submitted ON Submitted.EMP_NO = r.SubmittedByEmployeeID LEFT OUTER JOIN
                      dbo.WF_GetEmployee_VI AS ApprovalName ON ApprovalName.EMP_NO = r.ApprovalByManagerEmp_No

GO
/************************************************************************************/
CREATE PROCEDURE WF_UpdatePARMFILE
@Domain NVARCHAR(100),
@DomainFieldEmpNO NVARCHAR(255),
@DomainFieldAdmin NVARCHAR(255),
@DayArchive INT,
@Tolerance  INT,
@WFRequestMandeControl bit,
@WFIsAttachment BIT,
@DayArchiveKind BIT ,
@WF_ParallelApprove BIT,
@WFLimitMonthShowDaily TINYINT,
@WFIsChangeUserName BIT,
@WFDifrenceRequest BIT,
@WFNeedDesc BIT
AS
UPDATE PARMFILE 
SET 
	Domain = @Domain,
	DomainFieldEmpNO = @DomainFieldEmpNO,
	DomainFieldAdmin = @DomainFieldAdmin,
	DayArchive = @DayArchive,
	Tolerance = @Tolerance,
	WFRequestMandeControl=@WFRequestMandeControl,
	WFIsAttachment = @WFIsAttachment,
	DayArchiveKind=@DayArchiveKind,
	WF_ParallelApprove = @WF_ParallelApprove,
	WFLimitMonthShowDaily = @WFLimitMonthShowDaily,
	WFIsChangeUserName = @WFIsChangeUserName,
	WFDifrenceRequest = @WFDifrenceRequest,
	WFNeedDesc = @WFNeedDesc
/************************************************************************************/	
GO
/************************************************************************************/	
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_RequestsCountByEmpNO]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_RequestsCountByEmpNO]
/************************************************************************************/	
GO
/************************************************************************************/
CREATE PROCEDURE WF_RequestsCountByEmpNO
@EMP_NO FLOAT,
@ActionID INT 
AS
DECLARE @tCard TABLE(CARD_NO INT)
IF(@ActionID=1)--Morakhasi Rozane
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@ActionID=2)--Mamoriat Rozane	
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@ActionID=3)--Morakhasi Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE IF(@ActionID=4)--Eslahe Vorod Khoroj
	INSERT INTO @tCard VALUES(101)
ELSE IF(@ActionID=5)--Ezafe Kari
	INSERT INTO @tCard VALUES(103)	
ELSE IF(@ActionID=6)--Jabejayee Shift
	INSERT INTO @tCard VALUES(102)	
ELSE IF(@ActionID=7)--Afzayesh Kahesh Morakhasi
	INSERT INTO @tCard VALUES(104)	
ELSE IF(@ActionID=8)--Vorod Khoroj Faramosh shode
	INSERT INTO @tCard VALUES(100)			
ELSE IF(@ActionID=9)--Mamoriat Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE INSERT INTO @tCard VALUES(@ActionID)

DECLARE @START_DAY INT,@shdate NVARCHAR(10),@StartDate DATETIME,@curDay INT

SELECT @START_DAY=p.START_DAY,@shdate=dbo.ShamsyDate(GETDATE())  FROM PARMFILE p

SET @curDay=CAST(SUBSTRING(@shdate,9,2) AS INT)

IF(@curDay >= @START_DAY)
	SET @StartDate=dbo.Shamsi2MiladiYMD(CAST(SUBSTRING(@shdate,1,4) AS INT),CAST(SUBSTRING(@shdate,6,2) AS INT),@START_DAY,1)
ELSE SET @StartDate=DATEADD(MONTH,-1, dbo.Shamsi2MiladiYMD(CAST(SUBSTRING(@shdate,1,4) AS INT),CAST(SUBSTRING(@shdate,6,2) AS INT),@START_DAY,1))

SELECT COUNT(1)+1 FROM Requests r WHERE r.EMP_NO=@EMP_NO AND r.StartDate>=@StartDate AND r.[Type] IN (SELECT t.CARD_NO FROM @tCard t)
/************************************************************************************/
GO
/************************************************************************************/
IF NOT exists (select * from sysobjects where id = object_id(N'[WF_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [WF_Log]
	(
	LogID int NOT NULL IDENTITY (1, 1),
	LogMsg nvarchar(500) NULL,
	CurrentPage nvarchar(250) NULL,
	EMP_NO float(53) NULL,
	FullName nvarchar(500) NULL,
	LogDate datetime NULL DEFAULT(GETDATE())
	)  ON [PRIMARY]
	
ALTER TABLE dbo.WF_Log ADD CONSTRAINT	PK_WF_Log PRIMARY KEY CLUSTERED (LogID) ON [PRIMARY]	
END
/************************************************************************************/
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_GetPwkaraUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_GetPwkaraUsers]
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROC WF_GetPwkaraUsers
@USERS_ID NVARCHAR(25),
@USERS_PASSWORD NVARCHAR(15)
AS
SELECT s.TITLE,e.EMP_NO,e.NAME, e.FAMILY, e.Img, e.SEC_NO,e.SYS_ACTIVE,e.IsCut,e.GRP_NO,e.END_DATE,e.IS_UNIQ,e.IsWarden,e.IsPrintViewer,
		e.WardenDayCount,e.WardenJustInShift,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 7) THEN 1 ELSE 0 END PrintViewer,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM Conferment c WHERE c.EMP_NO=e.EMP_NO AND GETDATE() BETWEEN c.StartDate AND DATEADD(minute,-1,c.EndDate+1)) 
				THEN 1 ELSE 0 END IsConferment,
				
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6)
				THEN 1 ELSE 0 END) AS BIT) AS Supervisor,
				 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,

CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO 
				AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
				AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute,
				
CASE WHEN EXISTS(SELECT TOP 1 1 FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO)  THEN 1 ELSE 0 END IsEmpMngr,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM WFParallelApprove wa WHERE wa.EmpNo=e.EMP_NO)  THEN 1 ELSE 0 END IsParallelApprove
 
FROM Users u 
	LEFT OUTER JOIN EMPLOYEE e ON u.USERS_EmpNo=e.EMP_NO
	LEFT OUTER JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
	
WHERE	u.USERS_PASSWORD=@USERS_PASSWORD AND 
		u.USERS_ID=@USERS_ID
/************************************************************************************/		
GO
/************************************************************************************/		
ALTER PROCEDURE WF_GetRequestDuration
@EMP_NO FLOAT,
@Sdate DATETIME,
@Type INT
AS
DECLARE @CSdate DATETIME,@LimitValue INT,@ValueNext INT,@ValuePrevious INT,@Counter INT 
SET @ValueNext=0
SET @ValuePrevious=0
SELECT @LimitValue=c.LimitValue  FROM CARDS c WHERE c.CARD_NO=@Type
SET @CSdate=@Sdate
SET @Counter=0
WHILE @Counter< @LimitValue
BEGIN
	IF EXISTS(SELECT * FROM Requests r WHERE r.EMP_NO=@EMP_NO AND r.StartDate-1=@CSdate AND r.[Type]=@Type)
	BEGIN		
		SELECT @CSdate=r.EndDate+1,@Counter=@Counter+CAST(r.Duration AS INT)
		  FROM Requests r WHERE r.EMP_NO=@EMP_NO AND r.StartDate-1=@CSdate AND r.[Type]=@Type		
		  SET @ValueNext=@Counter		 
		  --PRINT LTRIM(@CSdate)+' -- '+LTRIM(@ValueNext)+' -- R' 
	END ELSE SET @Counter=@LimitValue
END

SET @Counter=0
SET @CSdate=@Sdate
WHILE @Counter< @LimitValue
BEGIN
	IF EXISTS(SELECT * FROM Requests r WHERE r.EMP_NO=@EMP_NO AND r.EndDate+1=@CSdate AND r.[Type]=@Type)
	BEGIN		
		SELECT @CSdate=r.StartDate-1,@Counter=@Counter+CAST(r.Duration AS INT)
		  FROM Requests r WHERE r.EMP_NO=@EMP_NO AND r.EndDate+1=@CSdate AND r.[Type]=@Type	
		  SET @ValuePrevious=@Counter
	END ELSE SET @Counter=@LimitValue
END

SELECT @ValueNext ValueNext,@ValuePrevious ValuePrevious,@ValueNext+@ValuePrevious TotalValues,@LimitValue LimitValue
/************************************************************************************/		
GO
/************************************************************************************/		
CREATE PROCEDURE [WF_EmployeeGetSubsetPerson]
@EmpNo FLOAT,
@subSec NVARCHAR(4000)
AS
select * from (
SELECT DISTINCT wgev.EmpManager,LTRIM(STR(wgev.EMP_NO))+' '+wgev.FullName FullName , wgev.SEC_NO, wgev.EMP_NO, wgev.OperationsID,
       wgev.TITLE, wgev.SEmp_No, wgev.S_FDate, wgev.S_TDate, wgev.GRP_NO,LTRIM(STR(wgev.EMP_NO))+'#'+LTRIM(ISNULL(wgev.GRP_NO,0)) EmpInfo
FROM   WF_SelectEmploye_VI wgev
WHERE  wgev.SEC_NO IN (SELECT fs.item FROM dbo.fnSplit(@subSec) fs)
       OR ( wgev.Supervisor = @EmpNo)       
       AND ISNULL(OperationsID,6)=6
	   )dt
ORDER BY dt.FullName
/************************************************************************************/
GO
/************************************************************************************/	      
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[PersianDatePart]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[PersianDatePart]
/************************************************************************************/
GO
/************************************************************************************/	      
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[PersianDatePart] (@Date DATETIME,@DatePart NVARCHAR(10))
RETURNS INT
AS
BEGIN
	DECLARE @PersianDate NVARCHAR(15)
	SET @PersianDate= dbo.ShamsyDate(@Date)
	IF(@DatePart='dd' OR @DatePart='day')
		RETURN CAST(SUBSTRING(@PersianDate,9,2) AS INT)
    ELSE IF(@DatePart='mm' OR @DatePart='month')
		RETURN CAST(SUBSTRING(@PersianDate,6,2) AS INT)
	ELSE IF(@DatePart='yyyy' OR @DatePart='year')
		RETURN CAST(SUBSTRING(@PersianDate,1,4) AS INT)
	ELSE IF(@DatePart='ww' OR @DatePart='week')
	BEGIN
		DECLARE @PersianYear INT,@PersianMonth INT,@PersianDay INT
		set @PersianYear=CAST(SUBSTRING(@PersianDate,1,4) AS INT)
		set @PersianMonth=CAST(SUBSTRING(@PersianDate,6,2) AS INT)
		set @PersianDay=CAST(SUBSTRING(@PersianDate,9,2) AS INT)		
		RETURN	(dbo.DaysToDate(1,@PersianYear,@PersianMonth,@PersianDay)/7)+1
	END
	ELSE IF(@DatePart='wm' OR @DatePart='weekofmonth')
	BEGIN
		RETURN	(CAST(SUBSTRING(@PersianDate,9,2) AS INT)/7)+1
	END	
		
	RETURN 0
END

GO

/****** Object:  StoredProcedure [dbo].[WF_GetCountRequestInWeekForSections]    Script Date: 03/10/2013 19:10:23 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_GetCountRequestInWeekForSections]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_GetCountRequestInWeekForSections]
GO

/****** Object:  StoredProcedure [dbo].[WF_GetCountRequestForSections]    Script Date: 03/10/2013 19:10:23 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_GetCountRequestForSections]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_GetCountRequestForSections]
GO

/****** Object:  StoredProcedure [dbo].[WF_Rep_RequestForSectionInMonth]    Script Date: 03/10/2013 19:10:23 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_Rep_RequestForSectionInMonth]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_Rep_RequestForSectionInMonth]
GO

/****** Object:  StoredProcedure [dbo].[WF_GetCountRequestInMonthForSections]    Script Date: 03/10/2013 19:10:23 ******/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_GetCountRequestInMonthForSections]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_GetCountRequestInMonthForSections]
GO

CREATE PROCEDURE WF_GetCountRequestInMonthForSections
@fromDate DATETIME,
@toDate DATETIME,
@sections NVARCHAR(4000),
@types NVARCHAR(4000),
@IsFinalApproved INT
AS
DECLARE @sql NVARCHAR(4000)
SET @sql='	SELECT	e.SEC_NO,s.TITLE secTitle,c.CARD_NO,c.TITLE cardTitle,COUNT(1) CountReq,
					dbo.PersianDatePart(r.StartDate,''year'') YD,
					dbo.PersianDatePart(r.StartDate,''mm'') MD'
IF(@IsFinalApproved=NULL OR @IsFinalApproved<2)					
SET @sql=@sql+',
					r.IsFinalApproved'
SET @sql=@sql+'	
			FROM Requests r
			RIGHT OUTER JOIN EMPLOYEE e ON e.EMP_NO = r.EMP_NO
			RIGHT OUTER JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
			RIGHT OUTER JOIN CARDS c ON c.CARD_NO=r.[Type]
			WHERE	r.StartDate BETWEEN '
					+CHAR(39)+CONVERT(NVARCHAR(10), @fromDate, 121)+CHAR(39)
					+' AND '
					+CHAR(39)+CONVERT(NVARCHAR(10), @toDate, 121)+CHAR(39)
IF(@sections!=NULL OR @sections!='')								
SET @sql=@sql+'
					AND e.SEC_NO IN (SELECT fs.item FROM dbo.fnSplit('''+@sections+''') fs)'
IF(@types!=NULL OR @types!='')								

		SET @sql=@sql+'			AND r.[Type] IN (SELECT fs.item FROM dbo.fnSplit('''+@types+''') fs)'					
IF(@IsFinalApproved=NULL OR @IsFinalApproved<2)					
SET @sql=@sql+'					
					AND r.IsFinalApproved=@IsFinalApproved'
SET @sql=@sql+'					
			GROUP BY	dbo.PersianDatePart(r.StartDate,''year''),
						dbo.PersianDatePart(r.StartDate,''mm''),
						e.SEC_NO,
						s.TITLE,
						c.CARD_NO,
						c.TITLE	'
IF(@IsFinalApproved=NULL OR @IsFinalApproved<2)					
SET @sql=@sql+',											

						r.IsFinalApproved '
						
SET @sql='SELECT * FROM ('+@sql+')dt ORDER BY dt.SEC_NO,dt.CARD_NO,dt.YD,dt.MD'

IF(@IsFinalApproved=NULL OR @IsFinalApproved<2)					
SET @sql=@sql+',											
						r.IsFinalApproved'
EXEC(@sql)
GO
/****** Object:  StoredProcedure [dbo].[WF_GetCountRequestInWeekForSections]    Script Date: 03/10/2013 19:10:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WF_GetCountRequestInWeekForSections]
@fromDate DATETIME,
@toDate DATETIME,
@sections NVARCHAR(4000),
@types NVARCHAR(4000),
@IsFinalApproved INT
AS
DECLARE @sql NVARCHAR(4000)
SET @sql='	SELECT	e.SEC_NO,s.TITLE secTitle,c.CARD_NO,c.TITLE cardTitle,COUNT(1) CountReq,
					dbo.PersianDatePart(r.StartDate,''year'') YD,
					dbo.PersianDatePart(r.StartDate,''mm'') MD,
					dbo.PersianDatePart(r.StartDate,''wm'') WD'
IF(@IsFinalApproved=NULL OR @IsFinalApproved<2)					
SET @sql=@sql+',
					r.IsFinalApproved'
SET @sql=@sql+'	
			FROM Requests r
			RIGHT OUTER JOIN EMPLOYEE e ON e.EMP_NO = r.EMP_NO
			RIGHT OUTER JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
			RIGHT OUTER JOIN CARDS c ON c.CARD_NO=r.[Type]
			WHERE	r.StartDate BETWEEN '
					+CHAR(39)+CONVERT(NVARCHAR(10), @fromDate, 121)+CHAR(39)
					+' AND '
					+CHAR(39)+CONVERT(NVARCHAR(10), @toDate, 121)+CHAR(39)
IF(@sections!=NULL OR @sections!='')								
SET @sql=@sql+'
					AND e.SEC_NO IN (SELECT fs.item FROM dbo.fnSplit('''+@sections+''') fs)'
IF(@types!=NULL OR @types!='')								
SET @sql=@sql+'
					AND r.[Type] IN (SELECT fs.item FROM dbo.fnSplit('''+@types+''') fs)'					
IF(@IsFinalApproved=NULL OR @IsFinalApproved<2)					
SET @sql=@sql+'					
					AND r.IsFinalApproved=@IsFinalApproved'
SET @sql=@sql+'					
			GROUP BY	dbo.PersianDatePart(r.StartDate,''year''),
						dbo.PersianDatePart(r.StartDate,''mm''),
						dbo.PersianDatePart(r.StartDate,''wm''),
						e.SEC_NO,
						s.TITLE,
						c.CARD_NO,
						c.TITLE	'
IF(@IsFinalApproved=NULL OR @IsFinalApproved<2)					
SET @sql=@sql+',											

						r.IsFinalApproved '
						
SET @sql='SELECT * FROM ('+@sql+')dt ORDER BY dt.SEC_NO,dt.CARD_NO,dt.YD,dt.MD,dt.WD'						

IF(@IsFinalApproved=NULL OR @IsFinalApproved<2)					
SET @sql=@sql+',dt.IsFinalApproved'

EXEC(@sql)

GO

/****** Object:  StoredProcedure [dbo].[WF_GetCountRequestForSections]    Script Date: 03/10/2013 19:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WF_GetCountRequestForSections]
@fromDate DATETIME,
@toDate DATETIME,
@sections NVARCHAR(4000)
AS

SELECT * FROM (
SELECT	e.SEC_NO,s.TITLE,COUNT(1) cnt,r.IsFinalApproved,
		dbo.PersianDatePart(r.StartDate,'year') yearNo,
		dbo.PersianDatePart(r.StartDate,'mm') monthNo,
		dbo.PersianDatePart(r.StartDate,'wm') weekNo 
FROM Requests r
RIGHT OUTER JOIN EMPLOYEE e ON e.EMP_NO = r.EMP_NO
RIGHT OUTER JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
WHERE	r.StartDate BETWEEN @fromDate AND @toDate		
		AND e.SEC_NO IN (SELECT fs.item FROM dbo.fnSplit(@sections) fs)
GROUP BY	r.IsFinalApproved,
			dbo.PersianDatePart(r.StartDate,'year'),
			dbo.PersianDatePart(r.StartDate,'mm'),
			dbo.PersianDatePart(r.StartDate,'wm'),
			e.SEC_NO,s.TITLE	
)dt ORDER BY dt.SEC_NO,dt.yearNo,dt.monthNo,dt.weekNo
			

GO

/****** Object:  StoredProcedure [dbo].[WF_Rep_RequestForSectionInMonth]    Script Date: 03/10/2013 19:10:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WF_Rep_RequestForSectionInMonth]
@Fdate VARCHAR(10),
@Tdate VARCHAR(10),
@Section NVARCHAR(4000)
AS

DECLARE @DifYear SMALLINT,@YearCount SMALLINT,@MonthCount SMALLINT,@SEC_NO  FLOAT
DECLARE @Title NVARCHAR(200) 
DECLARE @tbl TABLE (YD INT,MD SMALLINT,SEC_NO FLOAT,Title NVARCHAR(200))
SET @YearCount=0
SET @DifYear=CAST(SUBSTRING(@Tdate,1,4) AS INT)-CAST(SUBSTRING(@Fdate,1,4) AS INT)
IF(@Section='')
    EXEC('DECLARE TCUR CURSOR FOR SELECT s.SEC_NO,s.Title FROM SECTIONS s OPEN TCUR')
ELSE    
    EXEC('DECLARE TCUR CURSOR FOR SELECT s.SEC_NO,s.Title FROM SECTIONS s WHERE s.SEC_NO IN('+@Section+')  OPEN TCUR')

FETCH NEXT FROM TCUR INTO @SEC_NO,@Title
WHILE (@@fetch_status <> -1)
BEGIN
    IF (@@fetch_status <> -2)
    BEGIN
        SET @YearCount=0
        WHILE(@YearCount<= @DifYear)
        BEGIN
            IF(@YearCount=0)
                SET @MonthCount=SUBSTRING(@Fdate,6,2)
            ELSE SET @MonthCount=1
            WHILE(@MonthCount<=12)
            BEGIN   
                IF(@DifYear=@YearCount AND  @MonthCount>CAST(SUBSTRING(@Tdate,6,2) AS INT))
                     BREAK               
                INSERT INTO @tbl VALUES (SUBSTRING(@Fdate,1,4)+1,@MonthCount, @SEC_NO,@Title)                   
                SET @MonthCount=@MonthCount+1
            END
            SET @YearCount=@YearCount+1
        END       
    END
    FETCH NEXT FROM TCUR INTO @SEC_NO,@Title
END

CLOSE TCUR
DEALLOCATE TCUR

SELECT * FROM @tbl

SELECT     ISNULL(dt.SEC_NO,0) SEC_NO,dt.YD, dt.MD,ISNULL(R1.Cnt,0) CountReq,ISNULL(R1.OperationsID,0) OperationsID,dt.Title
FROM         
		(SELECT	COUNT(RequestsID) AS Cnt,
				SUBSTRING(dbo.ShamsyDate( SubmittedDate),1,4) AS YD, 
				SUBSTRING(dbo.ShamsyDate(SubmittedDate),6,2) AS MD,
				e.SEC_NO,r.OperationsID
		 FROM	Requests r
		 JOIN EMPLOYEE e ON e.EMP_NO = r.EMP_NO
			GROUP BY   
				SUBSTRING(dbo.ShamsyDate( SubmittedDate),1,4), 
				SUBSTRING(dbo.ShamsyDate(SubmittedDate),6,2),e.SEC_NO,
				r.OperationsID) 
R1	RIGHT OUTER JOIN @tbl dt ON R1.YD = dt.YD AND R1.MD = dt.MD AND dt.SEC_NO=R1.SEC_NO
ORDER BY dt.SEC_NO,dt.YD,dt.MD
GO
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_SetManagerKartabl]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_SetManagerKartabl]
GO
CREATE PROCEDURE [WF_SetManagerKartabl]
AS
UPDATE r
SET   CurSection = s.SEC_NO
FROM Requests r,SECTIONS s
WHERE r.CurEmp_NO=s.EmpManager
AND s.SEC_NO IS NOT NULL

UPDATE r
SET r.CurEmp_NO = s.EmpManager
FROM Requests r,SECTIONS s
WHERE r.CurSection=s.SEC_NO
AND s.EmpManager IS NOT NULL
GO
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_CardsGetApproval]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_CardsGetApproval]
/************************************************************************************/	           
GO
/************************************************************************************/	           
CREATE PROCEDURE WF_CardsGetApproval
@IsNullApproval BIT 
AS
IF(@IsNullApproval=1)
	SELECT c.TITLE,c.CARD_NO,c.IS_DAY FROM CARDS c WHERE c.CARD_NO<>0 AND CARD_TYPE IN (2,3,5,30) AND c.SYS_ACTIVE=1 OR (c.CARD_TYPE=11 AND c.CARD_NO<>0 ) ORDER BY c.TITLE
ELSE 
	SELECT wa.*,c.TITLE,e.[NAME]+' '+e.FAMILY FullName,ISNULL(s.TITLE,'نامشخص') sectionName
	  FROM WFParallelApprove wa 
	JOIN CARDS c ON wa.CardNo=c.CARD_NO
	JOIN EMPLOYEE e ON wa.EmpNo=e.EMP_NO 
	left outer JOIN SECTIONS s ON wa.SecNo=s.SEC_NO
	ORDER BY wa.CardNo    	
  		
/************************************************************************************/	           
GO
/********************1392-02-29   No Return Duty********************/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[ManagerReplace]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[ManagerReplace](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[OldManagerEmpNo] [float] NOT NULL,
		[NewManagerEmpNo] [float] NOT NULL,
		[SecNo] [float] NOT NULL,
		[ModifiedDate] [datetime] NOT NULL,
		[UserName] [nvarchar](50) NOT NULL,
		TransferNewManager BIT  NOT NULL,
		OtherManagerEmpNo FLOAT NULL,
		RevokeConferment BIT  NOT NULL,
		RevokeSubstitute BIT  NOT NULL,
	 CONSTRAINT [PK_ManagerReplace] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	) )ON [PRIMARY]	
END
/************************************************************************************/	  
GO
/************************************************************************************/	  
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ManagerReplaceInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_ManagerReplaceInsert]	
/************************************************************************************/	  
GO
/************************************************************************************/	  
CREATE PROCEDURE WF_ManagerReplaceInsert
@OldManagerEmpNo FLOAT,
@NewManagerEmpNo FLOAT,
@SecNo FLOAT,
@UserName NVARCHAR(50),
@TransferNewManager BIT,
@OtherManagerEmpNo FLOAT,
@RevokeConferment BIT,
@RevokeSubstitute BIT
AS
DECLARE @ModifiedDate DATETIME
SET @ModifiedDate=GETDATE()

INSERT INTO ManagerReplace(OldManagerEmpNo,NewManagerEmpNo,SecNo,ModifiedDate,UserName,TransferNewManager,
			            OtherManagerEmpNo, RevokeConferment, RevokeSubstitute)
VALUES(@OldManagerEmpNo,@NewManagerEmpNo,@SecNo ,@ModifiedDate ,@UserName,@TransferNewManager,
				@OtherManagerEmpNo,@RevokeConferment,@RevokeSubstitute)
/************************************************************************************/	  				
GO
/************************************************************************************/	  
CREATE PROCEDURE [WF_RequestChangeCurEmp_NO]
	@SEC_NO INT,
	@EmpManager FLOAT,	
	@OldEmpManager FLOAT
AS
if exists(select * from SECTIONS where SEC_NO=@SEC_NO)
begin
	UPDATE Requests
	SET CurEmp_NO = @EmpManager
	WHERE CurEmp_NO=@OldEmpManager AND CurSection=@SEC_NO AND IsFinalApproved IS NULL	
end		
/************************************************************************************/	  
GO
/************************************************************************************/	  
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestGetNotExecute]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_RequestGetNotExecute	
/************************************************************************************/	  
GO
/************************************************************************************/	  
CREATE PROCEDURE WF_RequestGetNotExecute
@SubmittedDate DATETIME,
@EmpNo FLOAT
AS
SELECT * FROM Requests r 
LEFT OUTER JOIN CARDS c ON  r.[Type] = c.CARD_NO
WHERE 
	r.AcceptCode in(8,7,19) AND 
	r.IsFinalApproved = 1 AND 
	r.SubmittedDate>=@SubmittedDate
	--AND r.OperationsID<>4
	AND (r.EMP_NO=@EmpNo OR r.CurEmp_NO=@EmpNo)
/************************************************************************************/	  
GO
/************************************************************************************/	  
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_MOR_MAMDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_MOR_MAMDelete	
/************************************************************************************/	  
GO
/************************************************************************************/	  
CREATE PROCEDURE WF_MOR_MAMDelete
@Emp_No FLOAT,
@S_DATE FLOAT,
@E_DATE FLOAT,
@Typ SMALLINT,
@P7  NVARCHAR(50)
AS
DECLARE @RefNumber BIGINT
SET @RefNumber=0
SELECT @RefNumber=RefNumber  FROM MOR_MAM WHERE EMP_NO=@Emp_No AND  S_DATE >= @S_DATE AND E_DATE <= @E_DATE AND TYP=@Typ
-- AND P7=@P7
SELECT * FROM MOR_MAM WHERE  RefNumber=@RefNumber
IF(@RefNumber>0)
BEGIN	
	DELETE FROM MOR_MAM WHERE RefNumber=@RefNumber
END
/************************************************************************************/	  
GO
/************************************************************************************/	  
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_LogMor_MamInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_LogMor_MamInsert	
GO
CREATE PROCEDURE WF_LogMor_MamInsert
@Emp_No NVARCHAR(53),
@UserID NVARCHAR(20),
@IssueDate FLOAT,
@S_Date FLOAT,
@E_Date FLOAT,
@OldIssue FLOAT,
@Requested NVARCHAR(10),
@Typ NVARCHAR(3),
@Inc_Typ NVARCHAR(3),
@Babat NVARCHAR(50),
@RefNumber BIGINT
AS
INSERT INTO LogMor_Mam(Emp_No,UserID,IssueDate,S_Date,E_Date,OldIssue,Requested,Typ,Inc_Typ,[Status],Babat,RefNumber,DateofInsert)
VALUES(@Emp_No,@UserID,@IssueDate,@S_Date,@E_Date,@OldIssue,@Requested,@Typ,@Inc_Typ,1,@Babat,@RefNumber,GETDATE())
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetTurnoverManager]') AND type in (N'P', N'PC'))
	DROP PROCEDURE WF_GetTurnoverManager
/**************************************************************************/
GO
/**************************************************************************/
CREATE PROCEDURE WF_GetTurnoverManager
@FromDate DATETIME,
@ToDate DATETIME,
@CurEmp_NO NVARCHAR(4000),
@OperationsID NVARCHAR(100)
AS
IF(@CurEmp_NO='*')
BEGIN
	SELECT r.CurEmp_NO,r.IsFinalApproved,COUNT(1) cnt,COUNT(r2.ID) cntrev,e.[NAME]+' '+e.FAMILY fullName
	FROM Requests r
	LEFT OUTER JOIN Reviews r2 ON r2.RequestID = r.RequestsID
	LEFT OUTER JOIN EMPLOYEE e ON e.EMP_NO=r.CurEmp_NO
	WHERE	r.StartDate BETWEEN @FromDate AND @ToDate AND
			r.OperationsID IN (SELECT fs.item from dbo.fnSplit(@OperationsID) fs)
	GROUP BY r.CurEmp_NO,r.IsFinalApproved,e.[NAME],e.FAMILY

	SELECT mu.FromMgrNo CurEmp_NO,COUNT(1) cnt 
	  FROM MoveUp mu 
	GROUP BY mu.FromMgrNo
END 
ELSE 
BEGIN
	SELECT r.CurEmp_NO,r.IsFinalApproved,COUNT(1) cnt,COUNT(r2.ID) cntrev,e.[NAME]+' '+e.FAMILY fullName
	FROM Requests r
	LEFT OUTER JOIN Reviews r2 ON r2.RequestID = r.RequestsID
	LEFT OUTER JOIN EMPLOYEE e ON e.EMP_NO=r.CurEmp_NO
	WHERE	r.StartDate BETWEEN @FromDate AND @ToDate AND
			r.OperationsID IN (SELECT fs.item from dbo.fnSplit(@OperationsID) fs) AND 
			r.CurEmp_NO IN (SELECT fs.item from dbo.fnSplit(@CurEmp_NO) fs)
	GROUP BY r.CurEmp_NO,r.IsFinalApproved,e.[NAME],e.FAMILY


	SELECT mu.FromMgrNo CurEmp_NO,COUNT(1) cnt 
	  FROM MoveUp mu WHERE mu.FromMgrNo IN (SELECT fs.item from dbo.fnSplit(@CurEmp_NO) fs)
	GROUP BY mu.FromMgrNo		
END
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ShowDataFile]') AND type in (N'P', N'PC'))
	DROP PROCEDURE WF_ShowDataFile
/**************************************************************************/
GO
/**************************************************************************/
CREATE PROCEDURE WF_ShowDataFile
	@fdate FLOAT,
	@tdate FLOAT,
	@empno FLOAT
AS
      SELECT  DISTINCT df.[STATUS],df.DATE_,df.TIME_,df.EMP_NO,
            LTRIM(STR(df.[STATUS]))+'_'+CASE  WHEN r.[Type] IS NULL THEN c.TITLE ELSE N'ورود و خروج فراموش شده' END TITLE,
             CASE  WHEN r.[Type] IS NULL THEN ISNULL(c.CARD_TYPE,-1) ELSE r.[Type] END CARD_TYPE,
             CAST(df.DATE_ AS DATETIME) -2 MiladyDate,r.[Type]  
      FROM DataFile df
      LEFT OUTER JOIN CARDS c ON  df.[STATUS] = c.CARD_NO AND c.IS_DAY = 0
      LEFT OUTER JOIN Requests r ON r.[Type] = 100 
									AND r.EMP_NO = @empno 
									AND r.StartHour=df.TIME_
                                    AND CAST(r.StartDate AS FLOAT)+2=df.DATE_
                                    AND r.IsFinalApproved=1
                                    
      WHERE  df.EMP_NO = @empno AND df.DATE_ BETWEEN @fdate AND @tdate
      ORDER BY df.DATE_,df.TIME_
      /******************************************/ 
      SELECT c.TITLE,mm.E_DATE,mm.S_DATE,ISNULL(c.CARD_TYPE,-1) CARD_TYPE FROM MOR_MAM mm
      JOIN CARDS c ON  mm.TYP = c.CARD_NO AND c.IS_DAY = 1
      WHERE  mm.EMP_NO = @empno
      	AND 
		(
			NOT
			(
				mm.S_DATE > @tdate 
				OR 
				mm.E_DATE < @fdate
			)
		)
      ORDER BY mm.S_DATE 
      /******************************************/ 
      SELECT ISNULL(MAX(t1.cnt),0) MaxCol FROM (SELECT COUNT(1) cnt FROM DataFile df
                                                WHERE  df.EMP_NO = @empno AND df.DATE_ 
                                                       BETWEEN @fdate AND @tdate
                                                GROUP BY df.DATE_) t1
/**************************************************************************/
GO
/**************************************************************************/
IF COL_LENGTH('Requests','Source') IS NULL
	ALTER TABLE Requests ADD [Source] NVARCHAR(20) NULL
GO
IF COL_LENGTH('Requests','Distination') IS NULL
	ALTER TABLE Requests ADD Distination NVARCHAR(20) NULL	
GO
IF COL_LENGTH('Requests','DeviceWent') IS NULL
	ALTER TABLE Requests ADD DeviceWent TINYINT NULL	
GO
IF COL_LENGTH('Requests','DeviceBack') IS NULL
	ALTER TABLE Requests ADD DeviceBack TINYINT NULL	
GO
IF COL_LENGTH('Requests','LocationStatus') IS NULL
	ALTER TABLE Requests ADD LocationStatus BIT NULL				
GO
IF COL_LENGTH('WFRequestParallelApproval','FromDate') IS NULL
	ALTER TABLE WFRequestParallelApproval ADD FromDate DATETIME NULL
GO	
IF COL_LENGTH('WFRequestParallelApproval','RequestDuration') IS NULL
	ALTER TABLE WFRequestParallelApproval ADD RequestDuration int NULL		
/**************************************************************************/	
GO
/**************************************************************************/
CREATE PROC [WF_RequestsInsert]
	@EMP_NO	FLOAT,
	@SubmittedDate	DATETIME,
	@Type	SMALLINT,
	@StartDate	DATETIME,
	@EndDate	DATETIME,
	@StartHour	INT,
	@EndHour	INT,
	@Duration	VARCHAR(10),
	@SubmittedByEmployeeID	FLOAT,
	@IsFinalApproved	BIT,
	@ApprovalByManagerEmp_No	FLOAT,
	@ApprovalDate	DATETIME,
	@OperationsID	INT,
	@Description	NVARCHAR(500),
	@CurEmp_NO	FLOAT,
	@CurSection	INT,
	@RequestStatus TINYINT,
	@IOStatus TINYINT,
	@Source NVARCHAR(20),
	@Distination NVARCHAR(20),
	@DeviceWent TINYINT,
	@DeviceBack TINYINT,
	@LocationStatus BIT
AS 

INSERT INTO [Requests]
(	
	[EMP_NO],[SubmittedDate],[Type],[StartDate],[EndDate],[StartHour],[EndHour],[Duration],[SubmittedByEmployeeID],[IsFinalApproved],
	[ApprovalByManagerEmp_No],[ApprovalDate],[OperationsID],[Description],[CurEmp_NO],[CurSection],RequestStatus,
	IOStatus,[Source],Distination,DeviceWent,DeviceBack,LocationStatus
)
VALUES
(
    @EMP_NO,@SubmittedDate,@Type,@StartDate,@EndDate,@StartHour,@EndHour,@Duration,@SubmittedByEmployeeID,@IsFinalApproved,
    @ApprovalByManagerEmp_No,@ApprovalDate,@OperationsID,@Description,@CurEmp_NO,@CurSection,@RequestStatus,
    @IOStatus,@Source,@Distination,@DeviceWent,@DeviceBack,@LocationStatus
)
Select @@Identity AS NEWID	
/**************************************************************************/
GO
/**************************************************************************/
CREATE PROC [WF_RequestsUpdate]
	@RequestsID	INT,
	@EMP_NO	FLOAT,
	@SubmittedDate	DATETIME,
	@Type	SMALLINT,
	@StartDate	DATETIME,
	@EndDate	DATETIME,
	@StartHour	INT,
	@EndHour	INT,
	@Duration	VARCHAR(10),
	@SubmittedByEmployeeID	FLOAT,
	@OperationsID	INT,
	@Description	NVARCHAR(500),
	@RequestStatus TINYINT,
	@IOStatus TINYINT,
	@Source NVARCHAR(20),
	@Distination NVARCHAR(20),
	@DeviceWent TINYINT,
	@DeviceBack TINYINT,
	@LocationStatus BIT,
	@CurEmp_NO FLOAT,
	@CurSection INT
AS
UPDATE [Requests]
SET    [EMP_NO] = @EMP_NO,
       [SubmittedDate] = @SubmittedDate,
       [Type] = @Type,
       [StartDate] = @StartDate,
       [EndDate] = @EndDate,
       [StartHour] = @StartHour,
       [EndHour] = @EndHour,
       [Duration] = @Duration,
       [SubmittedByEmployeeID] = @SubmittedByEmployeeID,
       [OperationsID] = @OperationsID,
       [Description] = @Description,
       RequestStatus = @RequestStatus,
       IOStatus = @IOStatus,
       [Source] = @Source,
       Distination = @Distination,
       DeviceWent = @DeviceWent,
       DeviceBack = @DeviceBack,
       LocationStatus = @LocationStatus,
       CurEmp_NO = @CurEmp_NO, 
       CurSection = @CurSection
WHERE  ([RequestsID] = @RequestsID)	
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_CardsUpdateApproval]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [WF_CardsUpdateApproval]
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestParallelApprovalInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestParallelApprovalInsert]
/************************************************************************************/	           
GO
/************************************************************************************/	           
CREATE PROCEDURE WF_RequestParallelApprovalInsert
@RequestID INT,
@ParallelApprovalEmpNo FLOAT,
@IsApprove BIT,
@FromDate DATETIME,
@Duration INT
AS
DECLARE @ParallelApprovalSecNo INT,@ParallelApprovalCardNo INT

IF(@Duration < 1)
	SELECT @ParallelApprovalCardNo=r.[Type],@FromDate=r.StartDate,@Duration=CAST(r.Duration AS INT) 
	  FROM Requests r WHERE r.RequestsID=@RequestID
ELSE 
	SELECT @ParallelApprovalCardNo=r.[Type]  FROM Requests r WHERE r.RequestsID=@RequestID

IF(@IsApprove=0)
	SET @Duration=0

SELECT @ParallelApprovalSecNo=wa.SecNo  FROM WFParallelApprove wa 
WHERE wa.EmpNo=@ParallelApprovalEmpNo AND wa.CardNo=@ParallelApprovalCardNo

UPDATE Requests SET Requested_Time = @Duration WHERE RequestsID=@RequestID

INSERT INTO WFRequestParallelApproval 
(RequestID,ParallelApprovalEmpNo,ParallelApprovalSecNo,ParallelApprovalCardNo,ChangeDate,IsApprove,FromDate,RequestDuration)
VALUES(@RequestID,@ParallelApprovalEmpNo,@ParallelApprovalSecNo,@ParallelApprovalCardNo,GETDATE(),@IsApprove,@FromDate,@Duration)
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF COL_LENGTH('CARDS','WF_ApprovalEmpNo') IS NOT NULL
	ALTER TABLE CARDS DROP COLUMN WF_ApprovalEmpNo
/************************************************************************************/	           	          	
GO
/************************************************************************************/	           
IF COL_LENGTH('CARDS','WF_ApprovalSecNo') IS NOT NULL
	ALTER TABLE CARDS DROP COLUMN WF_ApprovalSecNo
/************************************************************************************/	           	
GO
/************************************************************************************/
IF COL_LENGTH('Requests','ParallelApprovalEmpNo') IS NOT NULL
ALTER TABLE Requests DROP COLUMN ParallelApprovalEmpNo
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ParallelApproveGetData]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [WF_ParallelApproveGetData]
GO
CREATE PROCEDURE WF_ParallelApproveGetData
@RequestID INT,
@CardNo INT
AS 
DECLARE @Duration INT,@AcceptCode SMALLINT,@IsFinalApproved BIT
SET @Duration=0
SELECT @Duration=CASE WHEN r.[Type]=100 THEN 999 ELSE r.Duration END ,@AcceptCode = r.AcceptCode, @IsFinalApproved= r.IsFinalApproved
FROM Requests r WHERE r.RequestsID=@RequestID AND ISNUMERIC(r.Duration)=1

IF(@IsFinalApproved IS NOT NULL AND @AcceptCode IN (0,21))
BEGIN
	SELECT wpa.RequestID, wpa.ParallelApprovalEmpNo AS EmpNo, wpa.ParallelApprovalSecNo AS SecNo,
	       wpa.ParallelApprovalCardNo AS CardNo, wpa.IsApprove, wpa.FromDate,wpa.RequestDuration,
	       c.IS_DAY,c.CARD_TYPE,c.TITLE,wgev.FullName,s.TITLE Section
	  FROM WFRequestParallelApproval wpa 
	  LEFT OUTER JOIN SECTIONS s ON s.SEC_NO=wpa.ParallelApprovalSecNo
	  LEFT OUTER JOIN CARDS c ON c.CARD_NO=wpa.ParallelApprovalCardNo
	  LEFT OUTER JOIN WF_GetEmployee_VI wgev ON wgev.EMP_NO=wpa.ParallelApprovalEmpNo
	WHERE wpa.RequestID=@RequestID	
END
ELSE
BEGIN
	SELECT wpa.RequestID, wpa.ParallelApprovalEmpNo AS EmpNo, wpa.ParallelApprovalSecNo AS SecNo,
	       wpa.ParallelApprovalCardNo AS CardNo, wpa.IsApprove, wpa.FromDate,wpa.RequestDuration,
	       c.IS_DAY,c.CARD_TYPE,c.TITLE,CASE WHEN wpa.RequestID>0 THEN wgev1.FullName ELSE wgev.FullName END FullName,s.TITLE Section
	  FROM WFParallelApprove wa 
	LEFT OUTER JOIN WFRequestParallelApproval wpa 
		ON wpa.ParallelApprovalCardNo=wa.CardNo 	
		AND wpa.ParallelApprovalEmpNo=wa.EmpNo
		AND wpa.RequestID=@RequestID
	left outer JOIN WF_GetEmployee_VI wgev ON wgev.EMP_NO=wa.EmpNo
	left outer JOIN WF_GetEmployee_VI wgev1 ON wgev1.EMP_NO=wpa.ParallelApprovalEmpNo
	left outer JOIN SECTIONS s ON s.SEC_NO=wa.SecNo
	LEFT OUTER JOIN CARDS c ON c.CARD_NO=wa.CardNo
	WHERE wa.CardNo=@CardNo AND ISNULL(wa.LimitDuration,0) < @Duration 		
END
/************************************************************************************/	  
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ParallelApproveGetAcceptState]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [WF_ParallelApproveGetAcceptState]
/************************************************************************************/	  
GO
/************************************************************************************/
CREATE PROCEDURE WF_ParallelApproveGetAcceptState
@RequestID INT,
@CardNo INT
AS
DECLARE @Duration INT,@AcceptCode SMALLINT,@IsFinalApproved BIT
SET @Duration=0
SELECT @Duration=CASE WHEN r.[Type]=100 THEN 999 ELSE r.Duration END,@AcceptCode = r.AcceptCode, @IsFinalApproved= r.IsFinalApproved
  FROM Requests r WHERE r.RequestsID=@RequestID AND ISNUMERIC(r.Duration)=1
			
IF(@IsFinalApproved IS NOT NULL AND @AcceptCode=0)
SELECT @RequestID RequestID
ELSE 
	SELECT (SELECT DISTINCT wpa.RequestID  FROM WFRequestParallelApproval wpa 
			WHERE	wpa.ParallelApprovalCardNo = wa.CardNo 
			AND wpa.ParallelApprovalEmpNo=wa.EmpNo  
			AND wpa.RequestID=@RequestID
			AND wpa.IsApprove=1		
	) RequestID
	FROM WFParallelApprove wa
	WHERE wa.CardNo=@CardNo AND ISNULL(wa.LimitDuration,0) < @Duration
/************************************************************************************/	  
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_ParallelApproveCountAcceptState]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [WF_ParallelApproveCountAcceptState]
GO
CREATE PROCEDURE WF_ParallelApproveCountAcceptState
@EmpNo FLOAT,
@IsNull BIT
AS
IF(@IsNull=1)
	SELECT COUNT(1) cnt FROM Requests r
	JOIN WFParallelApprove wa ON  r.[Type] = wa.CardNo AND r.StartDate>=wa.DateModified
	LEFT OUTER JOIN WFRequestParallelApproval wpa 
		ON	wpa.RequestID = r.RequestsID AND 
			wpa.ParallelApprovalEmpNo = wa.EmpNo
	WHERE  wa.EmpNo = @EmpNo AND wpa.RequestID IS NULL
ELSE 
	SELECT COUNT(1) cnt FROM Requests r
	JOIN WFParallelApprove wa ON  r.[Type] = wa.CardNo  AND r.StartDate>=wa.DateModified
	LEFT OUTER JOIN WFRequestParallelApproval wpa ON  wpa.RequestID = r.RequestsID AND 
		 wpa.ParallelApprovalEmpNo = wa.EmpNo
	WHERE  wa.EmpNo = @EmpNo AND wpa.RequestID IS NOT NULL
/************************************************************************************/	
GO
/************************************************************************************/
IF COL_LENGTH('EMPLOYEE','SignatureImg') IS NULL
	ALTER TABLE EMPLOYEE ADD SignatureImg IMAGE NULL
/************************************************************************************/	
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_UpdateSignatureImg]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [WF_UpdateSignatureImg]
/************************************************************************************/	
GO
/************************************************************************************/
CREATE PROCEDURE WF_UpdateSignatureImg
@EMP_NO FLOAT,
@SignatureImg IMAGE
AS
UPDATE EMPLOYEE SET SignatureImg = @SignatureImg WHERE EMP_NO=@EMP_NO
/************************************************************************************/	
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_CountNewRequestByApprovalEmpNo]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [WF_CountNewRequestByApprovalEmpNo]
/************************************************************************************/	
GO
/************************************************************************************/
CREATE PROCEDURE WF_CountNewRequestByApprovalEmpNo
@EmpNo FLOAT
AS
SELECT wpa.IsApprove,COUNT(1) cnt INTO #t1 FROM Requests r 
JOIN WFParallelApprove wa ON r.[Type]=wa.CardNo AND r.StartDate>=wa.DateModified-1
LEFT OUTER JOIN WFRequestParallelApproval wpa ON r.RequestsID=wpa.RequestID AND wpa.ParallelApprovalEmpNo=wa.EmpNo
WHERE wa.EmpNo=@EmpNo
AND (CAST(r.Duration AS INT) > wa.LimitDuration	OR r.[Type]=100 )
AND ISNUMERIC(r.Duration)=1
GROUP BY wpa.IsApprove

SELECT  SUM(CASE WHEN t.IsApprove is NULL THEN t.cnt ELSE 0 END)RequestCount,
		SUM(CASE WHEN t.IsApprove=1 THEN t.cnt ELSE 0 END)		ApproveCount,
		SUM(CASE WHEN t.IsApprove=0 THEN t.cnt ELSE 0 END)		RejectCount,
		0 CancelCount,0 ExpireCount,0 MoveUpCount,0 ReviewCount
 FROM #t1 t
DROP TABLE #t1

/************************************************************************************/	
GO
/************************************************************************************/


ALTER PROCEDURE WF_CountNewRequestByApprovalEmpNo
@EmpNo FLOAT
AS
SELECT wpa.IsApprove,COUNT(1) cnt INTO #t1
      FROM   Requests r
            LEFT OUTER JOIN WFParallelApprove wa
                  ON r.[Type]=wa.CardNo 
                        AND wa.EmpNo=@EmpNo
            LEFT OUTER JOIN WFRequestParallelApproval wpa
                  ON  r.RequestsID = wpa.RequestID 
                        AND wpa.ParallelApprovalEmpNo = @EmpNo
WHERE ISNUMERIC(r.Duration)=1 AND (r.[Type] IN(100,101) OR CAST(r.Duration AS INT) > wa.LimitDuration) AND (r.StartDate>=wa.DateModified-1  OR r.ApprovalDate >= wa.DateModified -1 )
GROUP BY wpa.IsApprove

SELECT  SUM(CASE WHEN t.IsApprove is NULL THEN t.cnt ELSE 0 END)RequestCount,
            SUM(CASE WHEN t.IsApprove=1 THEN t.cnt ELSE 0 END)          ApproveCount,
            SUM(CASE WHEN t.IsApprove=0 THEN t.cnt ELSE 0 END)          RejectCount,
            0 CancelCount,0 ExpireCount,0 MoveUpCount,0 ReviewCount
FROM #t1 t
DROP TABLE #t1


/************************************************************************************/	
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetNewRequestForParallel]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [WF_GetNewRequestForParallel]
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE WF_GetNewRequestForParallel
	@EmpNo FLOAT
AS
SELECT r.EMP_NO,e.[NAME],e.FAMILY,c.TITLE,COUNT(1) cnt FROM Requests r 
JOIN WFParallelApprove wa ON r.[Type]=wa.CardNo AND r.StartDate>=wa.DateModified
left outer JOIN CARDS c ON r.[Type]=c.CARD_NO
left outer JOIN EMPLOYEE e ON e.EMP_NO=r.EMP_NO
WHERE wa.EmpNo=@EmpNo
AND r.RequestsID NOT IN (SELECT wpa.RequestID 
                           FROM WFRequestParallelApproval wpa 
                         WHERE	wpa.ParallelApprovalEmpNo=wa.EmpNo AND 
								wpa.ParallelApprovalCardNo=wa.CardNo )
AND r.SubmittedDate >= DATEADD(second,-20, GETDATE()) 								
GROUP BY r.EMP_NO,e.[NAME],e.FAMILY,c.TITLE								
/************************************************************************************/	
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsGetDifrenceDuration]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [WF_RequestsGetDifrenceDuration]
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE WF_RequestsGetDifrenceDuration
@CurEmp_NO FLOAT
AS
DECLARE @Tolerance INT
SELECT @Tolerance = p.Tolerance FROM   PARMFILE p

SELECT difrence.RequestsID, difrence.EMP_NO, e.NAME+' '+ e.FAMILY EmployeeName,c.TITLE,difrence.StartHour,difrence.StartDate, difrence.Duration,
		 LTRIM(difrence.PrimeryDuration) PrimeryDuration,s.SEC_NO EmpSecNo,s.TITLE EmpSecTitle,difrence.[Description],difrence.OperationsID
FROM   ( SELECT *,dbo.TimeSub(tbl.EndTime, tbl.TIME_) PrimeryDuration
           FROM   (SELECT	r.RequestsID,r.EMP_NO,r.[Type],r.StartDate,r.StartHour,df.TIME_,r.EndHour,r.OperationsID,df.[STATUS],r.Duration,r.CurEmp_NO,r.[Description],
							(SELECT TOP 1 df2.TIME_ FROM   DataFile df2 WHERE  df2.DATE_ = df.DATE_ AND df2.EMP_NO = df.EMP_NO AND df2.TIME_ > df.TIME_ ) EndTime
					FROM   Requests r
                           JOIN DataFile df ON  df.EMP_NO = r.EMP_NO AND df.DATE_ = CAST(r.StartDate AS FLOAT) + 2 AND r.[Type] = df.[STATUS]
                                  AND df.TIME_ BETWEEN dbo.TimeSub(r.StartHour, @Tolerance) AND dbo.TimePlus(r.StartHour, @Tolerance)
                    WHERE  r.[Type] IN (SELECT c.CARD_NO FROM   CARDS c WHERE  c.IS_DAY = 0 AND c.CARD_TYPE IN (5, 3)) AND r.IsFinalApproved = 1 
                    AND r.CurEmp_NO=@CurEmp_NO
                  )tbl
       )difrence
JOIN EMPLOYEE e ON e.EMP_NO = difrence.EMP_NO       
JOIN CARDS c ON difrence.[Type]=c.CARD_NO
JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
WHERE dbo.TimePlus(difrence.Duration,@Tolerance) < difrence.PrimeryDuration
ORDER BY
       difrence.StartDate

/************************************************************************************/
GO
/************************************************************************************/

IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_InsertNews]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[WF_InsertNews]
/************************************************************************************/
GO
CREATE PROCEDURE WF_InsertNews
@Lead NVARCHAR(255),
@News NVARCHAR(4000),
@StartDate DATETIME,
@EndDate DATETIME,
@IsActive BIT
AS
INSERT INTO News(Lead,News,StartDate,EndDate,IsActive)
VALUES(@Lead,@News,@StartDate,@EndDate,@IsActive)
/************************************************************************************/
GO
/************************************************************************************/

IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_UpdateNews]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].WF_UpdateNews
/************************************************************************************/
GO
CREATE PROCEDURE WF_UpdateNews
@NewsId INT,
@Lead NVARCHAR(255),
@News NVARCHAR(4000),
@StartDate DATETIME,
@EndDate DATETIME,
@IsActive BIT
AS
UPDATE News SET	Lead = @Lead,News = @News,StartDate = @StartDate,EndDate = @EndDate,IsActive = @IsActive WHERE NewsId=@NewsId	
/************************************************************************************/
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_DeleteNews]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].WF_DeleteNews
/************************************************************************************/
GO
CREATE PROCEDURE WF_DeleteNews
@NewsId INT
AS
DELETE FROM News WHERE NewsId=@NewsId	
/************************************************************************************/
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_RequestsGetPrintViewer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].WF_RequestsGetPrintViewer
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE WF_RequestsGetPrintViewer
@ManagerEmp_No FLOAT
AS
SELECT r.RequestsID, r.EMP_NO, r.StartDate,r.StartHour, r.Duration,r.[Description],e.NAME+' '+e.FAMILY EmployeeName,c.TITLE,
s.SEC_NO EmpSecNo,s.TITLE EmpSecTitle,r.OperationsID,r.[Type]
  FROM Requests r
JOIN EMPLOYEE e ON e.EMP_NO = r.EMP_NO
JOIN CARDS c ON r.[Type]=c.CARD_NO
JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
WHERE r.EMP_NO IN (SELECT em.Emp_No FROM EmployeeManagers em WHERE em.ManagerEmp_No=@ManagerEmp_No)
AND r.IsFinalApproved=1
/************************************************************************************/
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[dbo].[WF_RequestGetReviews]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].WF_RequestGetReviews
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE [WF_RequestGetReviews]
	@EmpManager FLOAT,
	@StartDate DATETIME,
	@EndDate DATETIME
AS
	SELECT DISTINCT 
	       r.ApprovalByManagerEmp_No,r.ApprovalDate,ISNULL(r.Duration,0) AS 
	       Duration,r.EMP_NO,r.EndDate,r.EndHour,r.IsFinalApproved,r.OperationsID,
	       r.RequestsID,r.StartDate,r.StartHour,r.SubmittedByEmployeeID,r.SubmittedDate,
	       r.Type,r.WorkflowIdentifier,e.NAME + ' ' + e.FAMILY AS EmployeeName,r.Description,
	       c.TITLE,me1.NAME + ' ' + me1.FAMILY AS ManagerName,s.EmpManager,s.SEC_NO,
	       s.TITLE AS SECTIONS,r.CurEmp_NO,s.SEmp_No,s.S_FDate,s.S_TDate,r.AcceptCode,
	       r.CurSection,r.MoveUpCnt,
	       CASE  WHEN r.MoveUpCnt IS NOT NULL THEN 
						N'ارجاع شده' WHEN r.CurEmp_NO <> @EmpManager THEN 
	                    N'جانشين يا کارتابل خاص' ELSE N'عادي' END AS 	                    
	       ReqStatus,s2.TITLE AS EmpSecTitle,s2.SEC_NO AS EmpSecNo
	       ,(SELECT COUNT(1) FROM WFParallelApprove wa WHERE wa.CardNo=r.[Type]) NeedParallelCount
	       ,(SELECT COUNT(1) FROM WFParallelApprove wa
				LEFT OUTER JOIN WFRequestParallelApproval wpa ON  wa.CardNo = wpa.ParallelApprovalCardNo AND 
				wpa.ParallelApprovalEmpNo = wa.EmpNo AND wpa.RequestID = r.RequestsID
				WHERE  wa.CardNo = r.[Type] AND (wpa.RequestID IS NULL OR wpa.IsApprove = 0)
			) ParallelCount,e2.NAME+' '+e2.FAMILY SubmittedFullName,c.IS_DAY
	FROM EMPLOYEE AS e
	LEFT OUTER JOIN SECTIONS AS s2 ON  e.SEC_NO = s2.SEC_NO
	RIGHT OUTER JOIN SECTIONS AS s
	RIGHT OUTER JOIN Requests AS r ON  s.SEC_NO = r.CurSection
	LEFT OUTER JOIN EMPLOYEE AS me1 
						ON  r.CurEmp_NO = me1.EMP_NO 
						ON  e.EMP_NO = r.EMP_NO
	LEFT OUTER JOIN EMPLOYEE e2 ON r.SubmittedByEmployeeID = e2.EMP_NO
	LEFT OUTER JOIN CARDS AS c ON  r.Type = c.CARD_NO
	WHERE  r.RequestsID IN (SELECT r2.RequestID FROM Reviews r2 WHERE r2.ReviewedByEmployeeID=@EmpManager)
       AND r.StartDate BETWEEN @StartDate AND @EndDate
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE [WF_EMPLOYEEGetPersonelData]
	@IS_KARMAND SMALLINT
AS
IF(@IS_KARMAND=4)
BEGIN
SELECT EMP_NO,PERS_NO,[NAME],FAMILY,EMP_DATE,BIRTH_DATE,KASR_KH,INC_KH,KH_PLACE,IS_KARMAND,POS_NO,SEC_NO,EMP_TYPE,
SYS_ACTIVE,GRADE_NO,PersonelType,SEX,IsCut,CUT_REASON,END_DATE,ESTEH_SAVE,RASMI_SAVE,NOF_IO,KASR_KAR,MIN_SHAB,
IS_JANBAZ,JANBAZ_TIM,JANBAZ_E_T,DAY_MAX_DE,DAY_MAX_HU,GRP_NO,GRP_DATE,SABET_EZ,MJAVZ_NEED,PMJAVZ_NEE,DELE_FLAG,
NBAT_PRSNT,FIX_KAR,H_EZ_NEED,IS_UNIQ,KARKERD3,RKASR_KAR,MODI_DATE,[FREE],IS_MEHMAN,PAYED,EATING,PAYROLL,F_LUNCH,
F_LUNCH_P,S_LUNCH_P,T_LUNCH_P,P6,P7,P8,MODI_TIME,MAX_MEALS,GRP4_NO,TERM1_ALLO,TERM2_ALLO,TERM3_ALLO,TERM4_ALLO,
IO_CONTROL,MEAL_PRICE,FMEAL_PRIC,SMEAL_PRIC,TMEAL_PRIC,EJBARI_MOR,H_ELMI,TARH,FATHER,M_NAME,ID_CARD,F_ID_CARD,
M_ID_CARD,C_ISSU_PLC,O_ISSU_PLC,PROV_NO,C_WORK_PLC,O_WORK_PLC,W_PROV_NO,BIRTH_PLC,MADRAK_PLC,COURSE,MOJ_NO,
MOJ_DATE,MARRIAGE,NOF_CHILD,EL_GRP_NO,RASTE_NO,CLASS_NO,MOZD_SANAV,MOZD_ROTBE,[ADDRESS],TEL,JOB_GRP_NO,MILITARY,
PAYEH_NO,ROTBE_NO,INSUR_NO,INSUR_DATE,NOTALLOWED,FREE_MEALS,FRST_MEALS,SCND_MEALS,THRD_MEALS,[SIGNATURE],T_SELECT,
M_T_CNTR,EZ_TYPE,MAZAD_TIME,PREV_MOJ,AFTER_MOJ,HOLID_MOJ,MOJ_TYPE,MOJ2_TYPE,KASR_ESTH,KASR_bim,Kasr_BH,SELE4SEND,
ALMOSANNA,PRE_SALE,CREDIT,PAY_METHOD,BARCODE,Esteh_Save_Main,Hs_KasrEsth,Mor_Kasr,servic_no,SELECTED,Gosast_Moj,
Pers_Active,H_S_Time,H_E_Time,WFUserName,WFUserPass,EMP_NO AS StrEMP_NO,
(SELECT s.TITLE FROM   SECTIONS s WHERE  s.SEC_NO = EMPLOYEE.SEC_NO) AS SECTIONS
FROM   EMPLOYEE	WHERE  (IsCut = 0)
AND (SYS_ACTIVE = 1)  ORDER BY  EMP_NO
END
ELSE
BEGIN	
SELECT EMP_NO,PERS_NO,[NAME],FAMILY,EMP_DATE,BIRTH_DATE,KASR_KH,INC_KH,KH_PLACE,IS_KARMAND,POS_NO,SEC_NO,EMP_TYPE,
SYS_ACTIVE,GRADE_NO,PersonelType,SEX,IsCut,CUT_REASON,END_DATE,ESTEH_SAVE,RASMI_SAVE,NOF_IO,KASR_KAR,MIN_SHAB,
IS_JANBAZ,JANBAZ_TIM,JANBAZ_E_T,DAY_MAX_DE,DAY_MAX_HU,GRP_NO,GRP_DATE,SABET_EZ,MJAVZ_NEED,PMJAVZ_NEE,DELE_FLAG,
NBAT_PRSNT,FIX_KAR,H_EZ_NEED,IS_UNIQ,KARKERD3,RKASR_KAR,MODI_DATE,[FREE],IS_MEHMAN,PAYED,EATING,PAYROLL,F_LUNCH,
F_LUNCH_P,S_LUNCH_P,T_LUNCH_P,P6,P7,P8,MODI_TIME,MAX_MEALS,GRP4_NO,TERM1_ALLO,TERM2_ALLO,TERM3_ALLO,TERM4_ALLO,
IO_CONTROL,MEAL_PRICE,FMEAL_PRIC,SMEAL_PRIC,TMEAL_PRIC,EJBARI_MOR,H_ELMI,TARH,FATHER,M_NAME,ID_CARD,F_ID_CARD,
M_ID_CARD,C_ISSU_PLC,O_ISSU_PLC,PROV_NO,C_WORK_PLC,O_WORK_PLC,W_PROV_NO,BIRTH_PLC,MADRAK_PLC,COURSE,MOJ_NO,
MOJ_DATE,MARRIAGE,NOF_CHILD,EL_GRP_NO,RASTE_NO,CLASS_NO,MOZD_SANAV,MOZD_ROTBE,[ADDRESS],TEL,JOB_GRP_NO,MILITARY,
PAYEH_NO,ROTBE_NO,INSUR_NO,INSUR_DATE,NOTALLOWED,FREE_MEALS,FRST_MEALS,SCND_MEALS,THRD_MEALS,[SIGNATURE],T_SELECT,
M_T_CNTR,EZ_TYPE,MAZAD_TIME,PREV_MOJ,AFTER_MOJ,HOLID_MOJ,MOJ_TYPE,MOJ2_TYPE,KASR_ESTH,KASR_bim,Kasr_BH,SELE4SEND,
ALMOSANNA,PRE_SALE,CREDIT,PAY_METHOD,BARCODE,Esteh_Save_Main,Hs_KasrEsth,Mor_Kasr,servic_no,SELECTED,Gosast_Moj,
Pers_Active,H_S_Time,H_E_Time,WFUserName,WFUserPass,EMP_NO AS StrEMP_NO,
(SELECT s.TITLE FROM   SECTIONS s WHERE  s.SEC_NO = EMPLOYEE.SEC_NO) AS SECTIONS
FROM   EMPLOYEE	WHERE 
(IsCut = 0)AND (SYS_ACTIVE = 1) AND 
((ISNULL(IS_KARMAND, 0) = @IS_KARMAND)OR 
(EMP_NO IN (SELECT s.EmpManager FROM SECTIONS s)))
ORDER BY  EMP_NO	       
END

/**************************************************************************/
GO
/**************************************************************************/
IF COL_LENGTH('EMPLOYEE','WardenIsShowRequest') IS NULL
	ALTER TABLE EMPLOYEE ADD WardenIsShowRequest BIT NULL
GO	
IF COL_LENGTH('EMPLOYEE','WardenIsShowReview') IS NULL	
	ALTER TABLE EMPLOYEE ADD WardenIsShowReview BIT NULL
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetDataByIdAndPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_EMPLOYEEGetDataByIdAndPassword	
/************************************************************************************/
GO	
/************************************************************************************/
CREATE PROC WF_EMPLOYEEGetDataByIdAndPassword
@WFUserName NVARCHAR(25),
@WFUserPass NVARCHAR(15)
AS
SELECT s.TITLE,e.EMP_NO,e.NAME, e.FAMILY, e.Img, e.SEC_NO,e.SYS_ACTIVE,e.IsCut,e.GRP_NO,e.END_DATE,e.IS_UNIQ,e.IsWarden,e.IsPrintViewer,
		e.WardenDayCount,e.WardenJustInShift,e.WardenIsShowRequest,e.WardenIsShowReview,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 7) THEN 1 ELSE 0 END PrintViewer,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM Conferment c WHERE c.EMP_NO=e.EMP_NO AND GETDATE() BETWEEN c.StartDate AND DATEADD(minute,-1,c.EndDate+1)) 
				THEN 1 ELSE 0 END IsConferment,
				
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6)
				THEN 1 ELSE 0 END) AS BIT) AS Supervisor,
				 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,

CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO 
				AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
				AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute,
				
CASE WHEN EXISTS(SELECT TOP 1 1 FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO)  THEN 1 ELSE 0 END IsEmpMngr,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM WFParallelApprove wa WHERE wa.EmpNo=e.EMP_NO)  THEN 1 ELSE 0 END IsParallelApprove

FROM EMPLOYEE e       
       RIGHT OUTER JOIN SECTIONS s
            ON  s.SEC_NO = e.SEC_NO
WHERE  (e.WFUserName = @WFUserName)
       AND (e.WFUserPass = @WFUserPass)
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetPwkaraUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_GetPwkaraUsers	       
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROC WF_GetPwkaraUsers
@USERS_ID NVARCHAR(25),
@USERS_PASSWORD NVARCHAR(15)
AS
SELECT s.TITLE,e.EMP_NO,e.NAME, e.FAMILY, e.Img, e.SEC_NO,e.SYS_ACTIVE,e.IsCut,e.GRP_NO,e.END_DATE,e.IS_UNIQ,e.IsWarden,e.IsPrintViewer,
		e.WardenDayCount,e.WardenJustInShift,e.WardenIsShowRequest,e.WardenIsShowReview,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 7) THEN 1 ELSE 0 END PrintViewer,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM Conferment c WHERE c.EMP_NO=e.EMP_NO AND GETDATE() BETWEEN c.StartDate AND DATEADD(minute,-1,c.EndDate+1)) 
				THEN 1 ELSE 0 END IsConferment,
				
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6)
				THEN 1 ELSE 0 END) AS BIT) AS Supervisor,
				 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,

CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO 
				AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
				AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute,
				
CASE WHEN EXISTS(SELECT TOP 1 1 FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO)  THEN 1 ELSE 0 END IsEmpMngr,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM WFParallelApprove wa WHERE wa.EmpNo=e.EMP_NO)  THEN 1 ELSE 0 END IsParallelApprove
 
FROM Users u 
	LEFT OUTER JOIN EMPLOYEE e ON u.USERS_EmpNo=e.EMP_NO
	LEFT OUTER JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
	
WHERE	u.USERS_PASSWORD=@USERS_PASSWORD AND 
		u.USERS_ID=@USERS_ID
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetAccessManager]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_GetAccessManager			
/************************************************************************************/		
GO
/************************************************************************************/
CREATE PROCEDURE WF_GetAccessManager
@empNo FLOAT,
@actionId INT
AS
SELECT dt.EmpManager,e.[NAME]+' '+e.FAMILY FullName,LTRIM(e.EMP_NO)+'#'+LTRIM(e.GRP_NO)+'#'+LTRIM(e.SEC_NO)+'#'+s.TITLE empInfo
  FROM (
SELECT c.EmpManager
FROM   Conferment c
WHERE  c.EMP_NO = @empNo
       AND GETDATE() BETWEEN c.StartDate AND c.EndDate
       AND c.IsDelete = 0
       AND c.ActionID = @actionId
UNION
SELECT DISTINCT s.EmpManager
FROM   SECTIONS s
WHERE  s.SEmp_No = @empNo
       AND GETDATE() BETWEEN dbo.Shamsi2Miladi(REPLACE(s.S_FDate, '/', '')) AND 
           dbo.Shamsi2Miladi(REPLACE(s.S_TDate, '/', ''))
)dt LEFT OUTER JOIN EMPLOYEE e ON dt.EmpManager=e.EMP_NO
LEFT OUTER JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
/************************************************************************************/	           
GO
/************************************************************************************/	           
CREATE PROCEDURE [WF_RequestsGetDataByID]
@requestID	INT
AS
SELECT *,
		c.TITLE,
		c.IS_DAY,
		wgev.FullName,
		wgev1.FullName ManagerName,
		wgev2.FullName ApprovalManager,
		(SELECT COUNT(1) FROM WFParallelApprove wa WHERE wa.CardNo=r.[Type]) CntParallelApprove
		,wgev.TITLE Section
		,w.BaseValue DeviceWentStr
		,w2.BaseValue DeviceBackStr
		,p.TITLE postion
FROM Requests r
LEFT OUTER JOIN CARDS c ON  r.Type = c.CARD_NO
LEFT OUTER JOIN WF_GetEmployee_VI wgev ON wgev.EMP_NO=r.EMP_NO
LEFT OUTER JOIN POSITION p ON p.POS_NO = wgev.POS_NO
LEFT OUTER JOIN WF_GetEmployee_VI wgev1 ON wgev1.EMP_NO=r.CurEmp_NO
LEFT OUTER JOIN WF_GetEmployee_VI wgev2 ON wgev2.EMP_NO=r.ApprovalByManagerEmp_No
LEFT OUTER JOIN WFBase w ON w.BaseCode=r.DeviceWent AND w.BaseGroup='DIO'
LEFT OUTER JOIN WFBase w2 ON w2.BaseCode=r.DeviceBack AND w2.BaseGroup='DIO'
WHERE  (RequestsID = @requestID)
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestGetFlow]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_RequestGetFlow			
/************************************************************************************/		
GO
/************************************************************************************/
CREATE PROCEDURE WF_RequestGetFlow
	@RequestID INT
AS
	SELECT *
	FROM   (
	           SELECT mu.DateMoveUp,
	                  CONVERT(VARCHAR(5), mu.DateMoveUp, 108) TimeMoveUp,
	                  dbo.ShamsyDate(mu.DateMoveUp) DateMoveUpFa,
	                  ef.EMP_NO,
	                  sf.TITLE fromSection,
	                  ef.FullName fromEmpName,
	                  N'ارجاع شده' fstate,
	                  4 nsatet,
	                  '~/UC/ReadImage.aspx?EmpNo=' + RTRIM(ef.EMP_NO) imgUrl,
	                  p.TITLE posTitle
	           FROM   MoveUp mu
	                  JOIN SECTIONS sf
	                       ON  mu.FromSecNo = sf.SEC_NO
	                  JOIN WF_GetEmployee_VI ef
	                       ON  ef.EMP_NO = mu.FromMgrNo
	                  JOIN POSITION p ON p.POS_NO = ef.POS_NO
	           WHERE  mu.RequestID = @RequestID
	           UNION
	           SELECT ISNULL(r.ApprovalDate,GETDATE()) DateMoveUp,
	                  CONVERT(VARCHAR(5),ISNULL(r.ApprovalDate,GETDATE()), 108) TimeMoveUp,
	                  dbo.ShamsyDate(ISNULL(r.ApprovalDate,GETDATE())) DateMoveUpFa,
	                  ef.EMP_NO,
	                  sf.TITLE fromSection,
	                  ef.FullName fromEmpName,
	                  CASE 
	                       WHEN r.IsFinalApproved IS NULL THEN N'بررسي نشده'
	                       WHEN r.IsFinalApproved = 0 THEN N'رد شده'
	                       WHEN r.IsFinalApproved = 1 THEN N'تاييد شده'
	                  END fstate,
	                  CAST(r.IsFinalApproved AS TINYINT) nsatet,
	                  '~/UC/ReadImage.aspx?EmpNo=' + RTRIM(ef.EMP_NO) imgUrl,
	                  p.TITLE posTitle
	           FROM   Requests r
	                  JOIN SECTIONS sf
	                       ON  r.CurSection = sf.SEC_NO
	                  JOIN WF_GetEmployee_VI ef
	                       ON  ISNULL(r.ApprovalByManagerEmp_No,r.CurEmp_NO) = ef.EMP_NO
	                  JOIN POSITION p ON p.POS_NO = ef.POS_NO
	           WHERE  r.RequestsID = @RequestID
	           UNION
	           SELECT r.SubmittedDate DateMoveUp,
	                  CONVERT(VARCHAR(5), r.SubmittedDate, 108) TimeMoveUp,
	                  dbo.ShamsyDate(r.SubmittedDate) DateMoveUpFa,
	                  ef.EMP_NO,
	                  sf.TITLE fromSection,
	                  ef.FullName fromEmpName,
	                  N'ثبت درخواست' fstate,
	                  -1 nsatet,
	                  '~/UC/ReadImage.aspx?EmpNo=' + RTRIM(ef.EMP_NO) imgUrl,
	                  p.TITLE posTitle
	           FROM   Requests r
	                  JOIN WF_GetEmployee_VI ef
	                       ON  r.EMP_NO = ef.EMP_NO
	                  JOIN SECTIONS sf
	                       ON  ef.SEC_NO = sf.SEC_NO
	                  JOIN POSITION p ON p.POS_NO=ef.POS_NO
	           WHERE  r.RequestsID = @RequestID
	       )dt
	ORDER BY
	       dt.DateMoveUp
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_OVERS_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_OVERS_Delete			
/************************************************************************************/		
GO
/************************************************************************************/
CREATE PROCEDURE WF_OVERS_Delete
@RequestsID INT
AS
DECLARE @EMP_NO  FLOAT,@TIME_ SMALLINT,@fromDate FLOAT,@toDate FLOAT

SELECT	@EMP_NO=r.EMP_NO,
		@TIME_=CAST(r.Duration AS SMALLINT),
		@fromDate=CAST(r.StartDate AS INT)+2,
		@toDate=CAST(r.EndDate AS INT)+2
  FROM Requests r WHERE r.RequestsID=@RequestsID
  
DELETE FROM OVERS 
WHERE 
	EMP_NO=@EMP_NO	AND 
	TIME_=@TIME_	AND 
	DATE_ BETWEEN @fromDate AND @toDate	   
/**************************************************************************/
GO
/**************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_GetNewRequest]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_GetNewRequest			
/************************************************************************************/		
GO
/************************************************************************************/
CREATE PROCEDURE WF_GetNewRequest
@EmpNo FLOAT,
@StartDate DATETIME
AS
SELECT COUNT(1) cnt,c.TITLE,e.[NAME],e.FAMILY FROM Requests r 
JOIN CARDS c ON  r.[Type] = c.CARD_NO 
JOIN EMPLOYEE e ON  e.EMP_NO = r.EMP_NO 
WHERE  r.IsFinalApproved IS NULL AND r.SubmittedDate >= DATEADD(second,-6, GETDATE()) AND  
       r.CurEmp_NO = @EmpNo  AND 
       r.StartDate >= @StartDate
GROUP BY e.[NAME],e.FAMILY,c.TITLE
/************************************************************************************/		
GO
/************************************************************************************/
IF COL_LENGTH('Action','PrintAccess') IS NULL	           
	ALTER TABLE [Action] ADD PrintAccess BIT NOT NULL DEFAULT(0)
/************************************************************************************/		
GO
/************************************1393-09-11**************************************/
IF NOT exists (select * from sysobjects where id = object_id(N'[WFPrintSeting]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	CREATE TABLE [WFPrintSeting] (
		ID int IDENTITY (1,1) NOT NULL ,
		ActionId int NOT NULL ,
		HeaderName nvarchar(255),
		Context nvarchar(2000),
		CONSTRAINT [PK_WFPrintSeting] PRIMARY KEY  CLUSTERED 
		(
			[ID]
		)  ON [PRIMARY] 
	) ON [PRIMARY]

/************************************************************************************/	
GO
/************************************1393-10-08**************************************/
GO
/************************************************************************************/
IF COL_LENGTH('PARMFILE','RegisterTolerance') IS NULL
	ALTER TABLE PARMFILE ADD RegisterTolerance TINYINT NOT NULL DEFAULT(0)
/************************************************************************************/	
GO
/************************************************************************************/
ALTER PROCEDURE WF_UpdatePARMFILE
@Domain NVARCHAR(100),
@DomainFieldEmpNO NVARCHAR(255),
@DomainFieldAdmin NVARCHAR(255),
@DayArchive INT,
@Tolerance  INT,
@WFRequestMandeControl bit,
@WFIsAttachment BIT,
@DayArchiveKind BIT ,
@WF_ParallelApprove BIT,
@WFLimitMonthShowDaily TINYINT,
@WFIsChangeUserName BIT,
@WFDifrenceRequest BIT,
@WFNeedDesc BIT,
@RegisterTolerance TINYINT
AS
UPDATE PARMFILE 
SET 
	Domain = @Domain,
	DomainFieldEmpNO = @DomainFieldEmpNO,
	DomainFieldAdmin = @DomainFieldAdmin,
	DayArchive = @DayArchive,
	Tolerance = @Tolerance,
	WFRequestMandeControl=@WFRequestMandeControl,
	WFIsAttachment = @WFIsAttachment,
	DayArchiveKind=@DayArchiveKind,
	WF_ParallelApprove = @WF_ParallelApprove,
	WFLimitMonthShowDaily = @WFLimitMonthShowDaily,
	WFIsChangeUserName = @WFIsChangeUserName,
	WFDifrenceRequest = @WFDifrenceRequest,
	WFNeedDesc = @WFNeedDesc,
	RegisterTolerance = @RegisterTolerance
/************************************************************************************/	
GO
/************************************************************************************/
ALTER PROCEDURE [WF_EmployeeGetPerson]
@EmpNo FLOAT
AS
SELECT DISTINCT wgev.EmpManager,LTRIM(STR(wgev.EMP_NO))+' '+wgev.FullName FullName, wgev.SEC_NO, wgev.EMP_NO, 6 OperationsID,
       wgev.TITLE, wgev.SEmp_No, wgev.S_FDate, wgev.S_TDate, wgev.GRP_NO,LTRIM(STR(wgev.EMP_NO))+'#'+LTRIM(ISNULL(wgev.GRP_NO,0)) EmpInfo
FROM   WF_SelectEmploye_VI wgev
WHERE  (wgev.SEC_NO IN (SELECT s.SEC_NO
                       FROM   SECTIONS s
                       WHERE  s.EmpManager = @EmpNo
                              OR  (
                                      s.SEmp_No = @EmpNo
                                      AND CAST(ISNULL(REPLACE(s.S_FDate, '/', ''), 0) AS INT)
                                          < = CAST(ISNULL(REPLACE( dbo.ShamsyDate(GETDATE()), '/', ''), 0) AS INT)
                                      AND CAST(ISNULL(REPLACE(s.S_TDate, '/', ''), 0) AS INT)
                                          >= CAST(ISNULL(REPLACE( dbo.ShamsyDate(GETDATE()), '/', ''), 0) AS INT)
                                  ))
       OR ( wgev.Supervisor = @EmpNo)
       OR wgev.EMP_NO=@EmpNo)
       --AND ISNULL(OperationsID,6) IN (6)

ORDER BY wgev.EMP_NO
/************************************************************************************/	
GO
/************************************************************************************/	
ALTER PROC [WF_RequestsInsert]
	@EMP_NO	FLOAT,
	@SubmittedDate	DATETIME,
	@Type	SMALLINT,
	@StartDate	DATETIME,
	@EndDate	DATETIME,
	@StartHour	INT,
	@EndHour	INT,
	@Duration	VARCHAR(10),
	@SubmittedByEmployeeID	FLOAT,
	@IsFinalApproved	BIT,
	@ApprovalByManagerEmp_No	FLOAT,
	@ApprovalDate	DATETIME,
	@OperationsID	INT,
	@Description	NVARCHAR(500),
	@CurEmp_NO	FLOAT,
	@CurSection	INT,
	@RequestStatus TINYINT,
	@IOStatus TINYINT,
	@Source NVARCHAR(20),
	@Distination NVARCHAR(20),
	@DeviceWent TINYINT,
	@DeviceBack TINYINT,
	@LocationStatus BIT
AS 

INSERT INTO [Requests]
(	
	[EMP_NO],[SubmittedDate],[Type],[StartDate],[EndDate],[StartHour],[EndHour],[Duration],[SubmittedByEmployeeID],[IsFinalApproved],
	[ApprovalByManagerEmp_No],[ApprovalDate],[OperationsID],[Description],[CurEmp_NO],[CurSection],RequestStatus,
	IOStatus,[Source],Distination,DeviceWent,DeviceBack,LocationStatus
)
VALUES
(
    @EMP_NO,GETDATE(),@Type,@StartDate,@EndDate,@StartHour,@EndHour,@Duration,@SubmittedByEmployeeID,@IsFinalApproved,
    @ApprovalByManagerEmp_No,@ApprovalDate,@OperationsID,@Description,@CurEmp_NO,@CurSection,@RequestStatus,
    @IOStatus,@Source,@Distination,@DeviceWent,@DeviceBack,@LocationStatus
)
Select @@Identity AS NEWID	
/**************************************************************************/
GO
/************************************************************************************/
ALTER PROC [WF_EMPLOYEEGetManagersData]
AS
SELECT DISTINCT e.EMP_NO,e.[NAME],e.FAMILY,LTRIM(STR(e.EMP_NO))+' - '+ e.[NAME]+' '+e.FAMILY FullName,s.SEC_NO
  FROM SECTIONS s 
JOIN EMPLOYEE e ON e.EMP_NO=s.EmpManager
WHERE s.EmpManager IS NOT NULL      
ORDER BY e.EMP_NO
/************************************************************************************/	     
GO
/************************************************************************************/	     
ALTER PROCEDURE [dbo].[WF_Rep_Request]
@FromDate DATETIME ,
@ToDate DATETIME ,
@Type INT 
AS
DECLARE @tCard TABLE(CARD_NO INT)
IF(@Type=1)--Morakhasi Rozane
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@Type=2)--Mamoriat Rozane	
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@Type=3)--Morakhasi Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE IF(@Type=4)--Eslahe Vorod Khoroj
	INSERT INTO @tCard VALUES(101)
ELSE IF(@Type=5)--Ezafe Kari
	INSERT INTO @tCard VALUES(103)	
ELSE IF(@Type=6)--Jabejayee Shift
	INSERT INTO @tCard VALUES(102)	
ELSE IF(@Type=7)--Afzayesh Kahesh Morakhasi
	INSERT INTO @tCard VALUES(104)	
ELSE IF(@Type=8)--Vorod Khoroj Faramosh shode
	INSERT INTO @tCard VALUES(100)			
ELSE IF(@Type=9)--Mamoriat Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE INSERT INTO @tCard VALUES(@Type)

SELECT r.StartDate ,r.EMP_NO ,e.PERS_NO ,e.[NAME],e.FAMILY,s.TITLE ,r.IsFinalApproved,s.SEC_NO,r.RequestsID
,r.[Type],c.TITLE CardTITLE,r.Distination,c.IS_DAY
  FROM Requests r 
JOIN EMPLOYEE e ON e.EMP_NO = r.EMP_NO
JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
JOIN CARDS c ON c.CARD_NO=r.[Type]
WHERE r.[Type] IN (SELECT t.CARD_NO FROM @tCard t)
AND r.StartDate BETWEEN @FromDate AND @ToDate
ORDER BY r.StartDate
/************************************************************************************/	
GO
/************************************************************************************/	
IF COL_LENGTH('Requests','TransferCost') IS NULL
	ALTER TABLE Requests ADD TransferCost FLOAT NULL
/************************************************************************************/	
GO
/************************************************************************************/	
ALTER PROCEDURE [WF_RequestsInsert]
	@EMP_NO	FLOAT,
	@SubmittedDate	DATETIME,
	@Type	SMALLINT,
	@StartDate	DATETIME,
	@EndDate	DATETIME,
	@StartHour	INT,
	@EndHour	INT,
	@Duration	VARCHAR(10),
	@SubmittedByEmployeeID	FLOAT,
	@IsFinalApproved	BIT,
	@ApprovalByManagerEmp_No	FLOAT,
	@ApprovalDate	DATETIME,
	@OperationsID	INT,
	@Description	NVARCHAR(500),
	@CurEmp_NO	FLOAT,
	@CurSection	INT,
	@RequestStatus TINYINT,
	@IOStatus TINYINT,
	@Source NVARCHAR(20),
	@Distination NVARCHAR(20),
	@DeviceWent TINYINT,
	@DeviceBack TINYINT,
	@LocationStatus BIT,
	@TransferCost FLOAT,
	@IsFirstTimeShift BIT 
AS 

INSERT INTO [Requests]
(	
	[EMP_NO],[SubmittedDate],[Type],[StartDate],[EndDate],[StartHour],[EndHour],[Duration],[SubmittedByEmployeeID],[IsFinalApproved],
	[ApprovalByManagerEmp_No],[ApprovalDate],[OperationsID],[Description],[CurEmp_NO],[CurSection],RequestStatus,
	IOStatus,[Source],Distination,DeviceWent,DeviceBack,LocationStatus,TransferCost,IsFirstTimeShift
)
VALUES
(
    @EMP_NO,GETDATE(),@Type,@StartDate,@EndDate,@StartHour,@EndHour,@Duration,@SubmittedByEmployeeID,@IsFinalApproved,
    @ApprovalByManagerEmp_No,@ApprovalDate,@OperationsID,@Description,@CurEmp_NO,@CurSection,@RequestStatus,
    @IOStatus,@Source,@Distination,@DeviceWent,@DeviceBack,@LocationStatus,@TransferCost,@IsFirstTimeShift
)
Select @@Identity AS NEWID	
/**************************************************************************/
GO
/**************************************************************************/
ALTER PROC [WF_RequestsUpdate]
	@RequestsID	INT,
	@EMP_NO	FLOAT,
	@SubmittedDate	DATETIME,
	@Type	SMALLINT,
	@StartDate	DATETIME,
	@EndDate	DATETIME,
	@StartHour	INT,
	@EndHour	INT,
	@Duration	VARCHAR(10),
	@SubmittedByEmployeeID	FLOAT,
	@OperationsID	INT,
	@Description	NVARCHAR(500),
	@RequestStatus TINYINT,
	@IOStatus TINYINT,
	@Source NVARCHAR(20),
	@Distination NVARCHAR(20),
	@DeviceWent TINYINT,
	@DeviceBack TINYINT,
	@LocationStatus BIT,
	@CurEmp_NO FLOAT,
	@CurSection INT,
	@TransferCost FLOAT,
	@IsFirstTimeShift BIT 
AS
UPDATE [Requests]
SET    [EMP_NO] = @EMP_NO,
       [SubmittedDate] = @SubmittedDate,
       [Type] = @Type,
       [StartDate] = @StartDate,
       [EndDate] = @EndDate,
       [StartHour] = @StartHour,
       [EndHour] = @EndHour,
       [Duration] = @Duration,
       [SubmittedByEmployeeID] = @SubmittedByEmployeeID,
       [OperationsID] = @OperationsID,
       [Description] = @Description,
       RequestStatus = @RequestStatus,
       IOStatus = @IOStatus,
       [Source] = @Source,
       Distination = @Distination,
       DeviceWent = @DeviceWent,
       DeviceBack = @DeviceBack,
       LocationStatus = @LocationStatus,
       CurEmp_NO = @CurEmp_NO, 
       CurSection = @CurSection,
       TransferCost = @TransferCost,       
       IsFirstTimeShift =IsFirstTimeShift  
WHERE  ([RequestsID] = @RequestsID)	
/**************************************************************************/
GO
/************************************************************************************/	      
ALTER PROCEDURE [WF_EmployeeGetSubsetPerson]
@EmpNo FLOAT,
@subSec NVARCHAR(4000)
AS
select * from (
SELECT DISTINCT wgev.EmpManager,LTRIM(STR(wgev.EMP_NO))+' '+wgev.FullName FullName , wgev.SEC_NO, wgev.EMP_NO, 6 OperationsID,
       wgev.TITLE, wgev.SEmp_No, wgev.S_FDate, wgev.S_TDate, wgev.GRP_NO,LTRIM(STR(wgev.EMP_NO))+'#'+LTRIM(ISNULL(wgev.GRP_NO,0)) EmpInfo
FROM   WF_SelectEmploye_VI wgev
WHERE  wgev.SEC_NO IN (SELECT fs.item FROM dbo.fnSplit(@subSec) fs)
       OR ( wgev.Supervisor = @EmpNo)       
       AND ISNULL(OperationsID,6)=6
	   )dt
ORDER BY dt.FullName
/************************************************************************************/
GO
/******************************************************************/
ALTER PROCEDURE [dbo].[WF_Rep_Request]
@FromDate DATETIME ,
@ToDate DATETIME ,
@Type INT 
AS
DECLARE @tCard TABLE(CARD_NO INT)
IF(@Type=1)--Morakhasi Rozane
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@Type=2)--Mamoriat Rozane	
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@Type=3)--Morakhasi Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE IF(@Type=4)--Eslahe Vorod Khoroj
	INSERT INTO @tCard VALUES(101)
ELSE IF(@Type=5)--Ezafe Kari
	INSERT INTO @tCard VALUES(103)	
ELSE IF(@Type=6)--Jabejayee Shift
	INSERT INTO @tCard VALUES(102)	
ELSE IF(@Type=7)--Afzayesh Kahesh Morakhasi
	INSERT INTO @tCard VALUES(104)	
ELSE IF(@Type=8)--Vorod Khoroj Faramosh shode
	INSERT INTO @tCard VALUES(100)			
ELSE IF(@Type=9)--Mamoriat Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE INSERT INTO @tCard VALUES(@Type)

SELECT r.StartDate ,r.EMP_NO ,e.PERS_NO ,e.[NAME],e.FAMILY,s.TITLE ,r.IsFinalApproved,s.SEC_NO,r.RequestsID
,r.[Type],c.TITLE CardTITLE,r.Distination,c.IS_DAY,r.Duration,r.OperationsID,r.[Description]
  FROM Requests r 
JOIN EMPLOYEE e ON e.EMP_NO = r.EMP_NO
JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
JOIN CARDS c ON c.CARD_NO=r.[Type]
WHERE r.[Type] IN (SELECT t.CARD_NO FROM @tCard t)
AND r.StartDate BETWEEN @FromDate AND @ToDate
ORDER BY r.StartDate
/******************************************************************/
GO
/******************************************************************/
UPDATE Requests SET Duration = '-'+REPLACE(Duration,'-','') WHERE CHARINDEX('-',Duration)>0
/******************************************************************/
GO
/******************************************************************/
ALTER PROCEDURE WF_ParallelApproveCountAcceptState
@EmpNo FLOAT,
@IsNull BIT
AS
IF(@IsNull=1)
	SELECT COUNT(1) cnt FROM Requests r
	JOIN WFParallelApprove wa ON  r.[Type] = wa.CardNo AND (r.StartDate>=wa.DateModified OR r.ApprovalDate>=wa.DateModified-1)
	LEFT OUTER JOIN WFRequestParallelApproval wpa 
		ON	wpa.RequestID = r.RequestsID AND 
			wpa.ParallelApprovalEmpNo = wa.EmpNo
	WHERE  (r.[Type] IN(100,101) OR CAST(r.Duration AS INT) > wa.LimitDuration) AND wa.EmpNo=@EmpNo AND (IsApprove IS NULL)
ELSE 
	SELECT COUNT(1) cnt FROM Requests r
	JOIN WFParallelApprove wa ON  r.[Type] = wa.CardNo  AND r.StartDate>=wa.DateModified
	LEFT OUTER JOIN WFRequestParallelApproval wpa ON  wpa.RequestID = r.RequestsID AND 
		 wpa.ParallelApprovalEmpNo = wa.EmpNo
	WHERE  wa.EmpNo = @EmpNo AND wpa.RequestID IS NOT NULL
/************************************************************************************/
GO
/************************************************************************************/	           
ALTER PROCEDURE WF_CardsGetApproval
@IsNullApproval BIT 
AS
IF(@IsNullApproval=1)
	SELECT c.TITLE,c.CARD_NO,c.IS_DAY FROM CARDS c WHERE c.CARD_NO<>0 AND CARD_TYPE IN (2,3,5,30) AND c.SYS_ACTIVE=1 OR (c.CARD_TYPE=11 AND c.CARD_NO<>0 ) ORDER BY c.TITLE
ELSE 
	SELECT wa.*,c.TITLE,e.[NAME]+' '+e.FAMILY FullName,ISNULL(s.TITLE,'نامشخص') sectionName,dbo.ShamsyDate(wa.DateModified) DateModifiedFa 
	  FROM WFParallelApprove wa 
	left outer JOIN CARDS c ON wa.CardNo=c.CARD_NO
	left outer JOIN EMPLOYEE e ON wa.EmpNo=e.EMP_NO 
	left outer JOIN SECTIONS s ON wa.SecNo=s.SEC_NO
	ORDER BY wa.CardNo    	
  		
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROC [WF_EMPLOYEEGetManagersData]
AS
SELECT DISTINCT e.EMP_NO,e.[NAME],e.FAMILY,LTRIM(STR(e.EMP_NO))+' - '+ e.[NAME]+' '+e.FAMILY FullName,e.SEC_NO
  FROM SECTIONS s 
JOIN EMPLOYEE e ON e.EMP_NO=s.EmpManager
WHERE s.EmpManager IS NOT NULL      
ORDER BY e.EMP_NO
/************************************************************************************/	           
GO
/**********************************94-05-11**************************************************/	           
IF NOT exists (select * from sysobjects where id = object_id(N'[WardenCards]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [WardenCards] (
	[WardenEmp_NO] [float] NOT NULL ,
	[CardNo] [int] NOT NULL ,	
	CONSTRAINT [PK_WardenCards] PRIMARY KEY  CLUSTERED 
	(
		[CardNo],
		[WardenEmp_NO]
	)  ON [PRIMARY] 
) ON [PRIMARY]
/************************************************************************************/	           
GO
/************************************************************************************/	           
IF COL_LENGTH('PARMFILE','ShowRemainKardex') IS NULL
	ALTER TABLE PARMFILE ADD ShowRemainKardex BIT DEFAULT(1) NOT NULL
/************************************************************************************/
GO
/************************************************************************************/	           
ALTER PROCEDURE WF_UpdatePARMFILE
@Domain NVARCHAR(100),
@DomainFieldEmpNO NVARCHAR(255),
@DomainFieldAdmin NVARCHAR(255),
@DayArchive INT,
@Tolerance  INT,
@WFRequestMandeControl bit,
@WFIsAttachment BIT,
@DayArchiveKind BIT ,
@WF_ParallelApprove BIT,
@WFLimitMonthShowDaily TINYINT,
@WFIsChangeUserName BIT,
@WFDifrenceRequest BIT,
@WFNeedDesc BIT,
@RegisterTolerance TINYINT,
@ShowRemainKardex BIT
AS
UPDATE PARMFILE 
SET 
	Domain = @Domain,
	DomainFieldEmpNO = @DomainFieldEmpNO,
	DomainFieldAdmin = @DomainFieldAdmin,
	DayArchive = @DayArchive,
	Tolerance = @Tolerance,
	WFRequestMandeControl=@WFRequestMandeControl,
	WFIsAttachment = @WFIsAttachment,
	DayArchiveKind=@DayArchiveKind,
	WF_ParallelApprove = @WF_ParallelApprove,
	WFLimitMonthShowDaily = @WFLimitMonthShowDaily,
	WFIsChangeUserName = @WFIsChangeUserName,
	WFDifrenceRequest = @WFDifrenceRequest,
	WFNeedDesc = @WFNeedDesc,
	RegisterTolerance = @RegisterTolerance,
	ShowRemainKardex = @ShowRemainKardex
/************************************************************************************/
GO
/************************************************************************************/
IF COL_LENGTH('Requests','IOTime') IS NULL
	ALTER TABLE Requests ADD IOTime INT NULL
/************************************************************************************/
GO
/************************************************************************************/
IF COL_LENGTH('Requests','Tolerance') IS NULL
	ALTER TABLE Requests ADD Tolerance INT NULL
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROCEDURE WF_FindNearDataFile
@EMP_NO FLOAT,
@Date FLOAT,
@StartTime INT,
@EndTime	INT
AS
DECLARE @Tolerance INT,@IsExistsMaxDateFile INT
SELECT @Tolerance=dbo.Time2Min(p.Tolerance) FROM PARMFILE p

SELECT @IsExistsMaxDateFile=COUNT(1) FROM DataFile df 
	WHERE	df.DATE_=@Date AND df.EMP_NO=@EMP_NO AND 
			dbo.Time2Min(df.TIME_)>= dbo.Time2Min(@StartTime)- @Tolerance 
			
IF(@IsExistsMaxDateFile>0 OR ((dbo.Time2Min(CAST(REPLACE(CONVERT(VARCHAR(5),GETDATE(),108),':','') AS INT))-@Tolerance)>dbo.Time2Min(@StartTime)))
BEGIN
	SELECT DISTINCT TOP 1 df.*,ABS(dbo.Time2Min(@StartTime)-dbo.Time2Min(df.TIME_)) DifTime INTO #DF FROM DataFile df 
	LEFT OUTER JOIN CARDS c ON df.[STATUS] = c.CARD_NO
	WHERE df.EMP_NO=@EMP_NO  AND df.DATE_=@Date
	AND (dbo.Time2Min(df.TIME_) BETWEEN dbo.Time2Min(@StartTime)- @Tolerance AND dbo.Time2Min(@StartTime) + @Tolerance)
	ORDER BY ABS(dbo.Time2Min(@StartTime)-dbo.Time2Min(df.TIME_)) 	

	IF (EXISTS(SELECT * FROM #DF))
		SELECT *,@Tolerance Tolerance FROM #DF	
	ELSE 
	BEGIN
		DECLARE @GroupFirst  INT,@ShiftNew  INT,@Calen_T INT,@Year INT,@Month INT,@Day INT ,@ShamsyDate NVARCHAR(10),@S2_TIME INT,@START_TIME INT	
		DECLARE @Tdate FLOAT
		SET @Tdate=@Date-2
		SET @ShamsyDate= dbo.Miladi2Shamsi(CAST(@Tdate AS DATETIME),0)
		SET @Year=CAST(SUBSTRING(@ShamsyDate,0,5) AS INT)
		SET @Month=CAST(SUBSTRING(@ShamsyDate,5,2) AS INT)
		SET @Day=CAST(SUBSTRING(@ShamsyDate,7,2) AS INT)
		exec Sp_MixFindShift @GroupFirst OUT,@EMP_NO,@Date,@Year,@Month,@Day,@ShiftNew OUT,@Calen_T OUT
		
		IF EXISTS(SELECT * FROM PARMFILE p WHERE @Date BETWEEN p.StartDateRamedan AND p.EndDateRamedan)
			SELECT @START_TIME=s.START_TIME, @S2_TIME=s.RAMEZAN_S FROM SHIFTS s WHERE s.SHIFT_NO=@ShiftNew
		ELSE SELECT @START_TIME=s.START_TIME, @S2_TIME=s.S2_TIME FROM SHIFTS s WHERE s.SHIFT_NO=@ShiftNew
		  
		IF(dbo.Time2Min(@StartTime)<= dbo.Time2Min(@S2_TIME))
		BEGIN
				SELECT TOP 1 df.*,@Tolerance Tolerance FROM DataFile df 
					LEFT OUTER JOIN CARDS c ON df.[STATUS] = c.CARD_NO
				WHERE df.EMP_NO=@EMP_NO  AND df.DATE_=@Date
					AND (dbo.Time2Min(df.TIME_) BETWEEN dbo.Time2Min(@StartTime) AND dbo.Time2Min(@EndTime) + @Tolerance)
				ORDER BY df.TIME_
		END	
	END
	DROP TABLE #DF
END
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROCEDURE [WF_RequestsAcceptRequest]
	@IsFinalApproved BIT,
	@ApprovalByManagerEmp_No FLOAT,
	@RequestsID INT,
	@ManagerIdea NVARCHAR(500),
	@AcceptCode SMALLINT,
	@Requested_Time NVARCHAR(50),
	@IOTime INT,
	@Tolerance INT
AS
IF(@Requested_Time='')
BEGIN
	UPDATE Requests
	SET    IsFinalApproved = @IsFinalApproved,
	       ApprovalByManagerEmp_No = @ApprovalByManagerEmp_No,
	       ApprovalDate =CASE WHEN ApprovalDate IS NULL THEN GETDATE() ELSE ApprovalDate END,
	       ManagerIdea = @ManagerIdea,
	       AcceptCode =@AcceptCode,
	       IOTime =ISNULL(@IOTime,IOTime),
	       Tolerance =ISNULL(@Tolerance,Tolerance)
	WHERE RequestsID=@RequestsID
END 
ELSE 
BEGIN
UPDATE Requests
	SET    IsFinalApproved = @IsFinalApproved,
	       ApprovalByManagerEmp_No = @ApprovalByManagerEmp_No,
	       ApprovalDate =CASE WHEN ApprovalDate IS NULL THEN GETDATE() ELSE ApprovalDate END,
	       ManagerIdea = @ManagerIdea,
	       AcceptCode =@AcceptCode ,
	       Requested_Time = @Requested_Time,
	       IOTime =ISNULL(@IOTime,IOTime),
	       Tolerance =ISNULL(@Tolerance,Tolerance)
	WHERE RequestsID=@RequestsID         	
END
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE WF_GetSubmitCountRequest
@MangerEmpNo FLOAT,
@StartDate DATETIME
AS
DECLARE @curDate NVARCHAR(10)
SET @curDate=dbo.ShamsyDate(GETDATE())
SELECT e2.EMP_NO INTO #empnoTBL FROM EMPLOYEE e2 WHERE e2.EmpMngr=@MangerEmpNo
SELECT s.EmpManager INTO #managerTBL  FROM SECTIONS s WHERE s.EmpManager=@MangerEmpNo OR (s.SEmp_No=@MangerEmpNo AND @curDate BETWEEN s.S_FDate AND s.S_TDate)

DECLARE @ApproveCount INT ,@RejectCount INT ,@RequestCount INT ,@CancelCount INT ,@ExpireCount INT ,@MoveUpCount INT ,@ReviewCount INT

SELECT r.IsFinalApproved,r.AcceptCode,r.StartDate
INTO #temp  FROM Requests r 
WHERE 
	r.CurEmp_NO IN (SELECT EmpManager FROM #managerTBL )	
		OR 
	r.EMP_NO IN (SELECT EMP_NO FROM #empnoTBL) 

SELECT IsFinalApproved,count(*) cnt INTO #t1 FROM #temp 
WHERE StartDate >= @StartDate
 GROUP BY IsFinalApproved

	
SELECT @ApproveCount=t.cnt FROM #t1 t WHERE t.IsFinalApproved=1 

SELECT @RejectCount=t.cnt FROM #t1 t WHERE t.IsFinalApproved=0 

SELECT @RequestCount=t.cnt FROM #t1 t WHERE t.IsFinalApproved IS NULL 

SELECT @CancelCount=COUNT(1) FROM #temp t WHERE t.AcceptCode=21 AND t.StartDate >= @StartDate AND t.IsFinalApproved=1 

SELECT @ExpireCount=COUNT(1) FROM  #temp r WHERE r.StartDate <= @StartDate-1

SELECT @MoveUpCount=COUNT(1) FROM MoveUp mu WHERE mu.FromMgrNo=@MangerEmpNo AND mu.RequestID IN (SELECT r.RequestsID FROM Requests r)

SELECT @ReviewCount=COUNT(1) FROM Reviews r WHERE r.ReviewedByEmployeeID=@MangerEmpNo    

DROP TABLE #temp
DROP TABLE #t1
DROP TABLE #empnoTBL
DROP TABLE #managerTBL

SELECT @ApproveCount ApproveCount,@RejectCount RejectCount ,@RequestCount RequestCount ,@CancelCount CancelCount ,
		@ExpireCount ExpireCount ,@MoveUpCount MoveUpCount ,@ReviewCount ReviewCount 

/************************************************************************************/
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_Rep_Log]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_Rep_Log]
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE WF_Rep_Log
@Fromdate DATETIME ,
@ToDate DATETIME
AS
SELECT wl.*,e.[NAME]+' '+e.FAMILY EmployeeName FROM WF_Log wl
LEFT OUTER JOIN EMPLOYEE e ON e.EMP_NO = wl.EMP_NO
WHERE wl.LogDate BETWEEN @Fromdate AND @ToDate

/************************************************************************************/
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestGetAllNotExecute]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestGetAllNotExecute]
/************************************************************************************/
GO
/************************************************************************************/	  
CREATE PROCEDURE WF_RequestGetAllNotExecute
@SubmittedDate DATETIME
AS
SELECT * FROM Requests r 
JOIN CARDS c ON  r.[Type] = c.CARD_NO
JOIN WF_GetEmployee_VI wgev ON r.EMP_NO=wgev.EMP_NO
WHERE r.AcceptCode in(8,7,19) AND r.IsFinalApproved = 1 AND r.SubmittedDate>=@SubmittedDate
/************************************************************************************/	  
GO
/************************************************************************************/	  
CREATE PROCEDURE [WF_RequestsIsExist]
	@StartDate DATETIME,
	@EndDate DATETIME,
	@Emp_No FLOAT
AS
SELECT r.IsFinalApproved,COUNT(1) cnt FROM Requests r 
JOIN CARDS c ON r.[Type]=c.CARD_NO
WHERE c.IS_DAY=1
AND r.EMP_NO=@Emp_No
AND (	
		(CASE WHEN r.StartDate>@StartDate THEN r.StartDate ELSE @StartDate END)-
		(CASE WHEN ISNULL(r.EndDate,r.StartDate)<@EndDate THEN ISNULL(r.EndDate,r.StartDate) ELSE @EndDate END)
	)<=0
GROUP BY r.IsFinalApproved	
/************************************************************************************/
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsHourlyIsExist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsHourlyIsExist]	
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE WF_RequestsHourlyIsExist
	@StartDate DATETIME,
	@Emp_No FLOAT,
	@startTime INT,
	@endTime INT
AS
SELECT r.IsFinalApproved,COUNT(1) cnt FROM Requests r 
JOIN CARDS c ON r.[Type]=c.CARD_NO
WHERE c.IS_DAY=0
AND r.StartDate=@StartDate
AND r.EMP_NO=@Emp_No
AND r.StartHour IS NOT NULL
AND r.AcceptCode<>22
AND (	
		(CASE WHEN r.StartHour>@startTime THEN r.StartHour ELSE @startTime END)-
		(CASE WHEN ISNULL(r.EndHour,r.StartHour)<@endTime THEN ISNULL(r.EndHour,r.StartHour) ELSE @endTime END)
	)<=0
GROUP BY r.IsFinalApproved	
/************************************************************************************/
GO
/************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_RequestsIsExistByType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [WF_RequestsIsExistByType]	
/************************************************************************************/
GO
/************************************************************************************/
CREATE PROCEDURE [WF_RequestsIsExistByType]
	@StartDate DATETIME,
	@Emp_No FLOAT,
	@Type SMALLINT,
	@OperationsID INT,
	@StartTime INT,
	@EndTime INT
AS
	SELECT r.IsFinalApproved,COUNT(1) cnt FROM   Requests r
	WHERE  CAST(r.StartDate AS INT) =CAST(@StartDate AS INT)
	       AND r.OperationsID=@OperationsID
	       AND r.EMP_NO = @Emp_No
	       AND r.[Type]=@Type
	       AND (@StartTime BETWEEN r.StartHour AND r.EndHour OR @EndTime BETWEEN r.StartHour AND r.EndHour)
	       AND	(	
	       			(CASE WHEN r.StartHour>@StartTime THEN r.StartHour ELSE @StartTime END)-
	       			(CASE WHEN ISNULL(r.EndHour,r.StartHour)<@EndTime THEN ISNULL(r.EndHour,r.StartHour) ELSE @EndTime END)
				)<=0
	GROUP BY r.IsFinalApproved
/************************************************************************************/	     
GO
/************************************************************************************/	     
SELECT *,ROW_NUMBER()OVER(ORDER BY w.BaseId)-1 rn INTO #db FROM WFBase w
UPDATE WFBase SET BaseCode = (SELECT TOP 1 rn from #db db WHERE db.BaseId=WFBase.BaseId)
DROP TABLE #db
/************************************************************************************/	     
GO
/***********************************1394-12-24*************************************************/	     
IF COL_LENGTH('LimitedManager','LimitDurationPerMonth') IS NULL
	ALTER TABLE LimitedManager ADD LimitDurationPerMonth INT NULL 
GO
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'WorkPeriodAddMonth') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION WorkPeriodAddMonth
GO
CREATE FUNCTION [dbo].WorkPeriodAddMonth(
	 @SDate DATETIME ,
	 @Number INT,
	 @StartPeriodDay INT
)RETURNS DATETIME
BEGIN
	DECLARE @currentPersianDate NVARCHAR(10),@year INT,@month INT 
	SET @currentPersianDate=dbo.Miladi2ShamsiYMD(DATEPART(YEAR,@SDate),DATEPART(Month,@SDate),DATEPART(DAY,@SDate),1)

	SET @month=dbo.ShamsiDayPart('month',@currentPersianDate)+@Number
	SET @year=dbo.ShamsiDayPart('year',@currentPersianDate)

	IF((@month)>12)
	BEGIN
		SET @year=@year+((@month)/12)
		SET @month=(@month%12)
	END 
	ELSE IF((@month)<=0)
	BEGIN
		SET @year=@year+(@month/12)-1
		SET @month=12+(@month%12)
	END	
RETURN dbo.Shamsi2MiladiYMD(@year,@month,@StartPeriodDay,1)
END
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'WFCardToAction') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION WFCardToAction
GO
CREATE FUNCTION [dbo].WFCardToAction(	
	@CardNo INT,
	@OperationId INT
)RETURNS INT 
BEGIN
IF(@OperationId=4)	
	RETURN 12
IF(@CardNo=100) 
	RETURN 8
IF(@CardNo=101) 
	RETURN 4
IF(@CardNo=102) 
	RETURN 6
IF(@CardNo=103) 
	RETURN 5
IF(@CardNo=104) 
	RETURN 7
IF(@CardNo IN (59,70))
	RETURN 10

DECLARE @IsDay BIT 
SELECT @IsDay=c.IS_DAY  FROM CARDS c WHERE c.CARD_NO=@CardNo

IF(@IsDay=1 AND @OperationId=5)
	RETURN 1
IF(@IsDay=0 AND @OperationId=5)
	RETURN 3
	
IF(@IsDay=1 AND @OperationId=3)
	RETURN 2
IF(@IsDay=0 AND @OperationId=3)
	RETURN 9		
	
IF(@IsDay=0 AND @OperationId=1)
	RETURN 5

RETURN 0	
END
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'MinDate') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION MinDate
GO
create function dbo.MinDate(@val1 DATETIME, @val2 DATETIME)
returns DATETIME
as
begin
  if @val1 > @val2
    return @val2
  return isnull(@val1,@val2)
END
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'MaxDate') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION MaxDate
GO
create function dbo.MaxDate(@val1 DATETIME, @val2 DATETIME)
returns DATETIME
as
begin
  if @val1 > @val2
    return @val1
  return isnull(@val2,@val1)
END
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'ShamsiDayPart') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION ShamsiDayPart
GO
CREATE FUNCTION ShamsiDayPart
(
    @Interval VARCHAR(11),
    @date NVARCHAR(10)
)
RETURNS INT
AS
BEGIN
	SET @date=REPLACE(@date,'/','')
    -- Declare the return variable here
    DECLARE @result INT

    -- Add the T-SQL statements to compute the return value here
    SELECT @result = CASE
        WHEN @Interval IN ('year', 'yy', 'yyyy') THEN CAST(SUBSTRING(@date,0,5) AS INT)
        WHEN @Interval IN ('month', 'mm', 'm') THEN CAST(SUBSTRING(@date,5,2) AS INT)
        WHEN @Interval IN ('day', 'dd', 'd') THEN CAST(SUBSTRING(@date,7,2) AS INT)
    END

    -- Return the result of the function
    RETURN @result

END
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'WorkPeriodMonths') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION WorkPeriodMonths
GO
CREATE FUNCTION [dbo].WorkPeriodMonths(
	 @StartDate DATETIME ,
	 @EndDate DATETIME,
	 @StartPeriodDay INT
)RETURNS @result TABLE(workDate DATETIME)
BEGIN
	IF(@StartDate<dbo.WorkPeriodAddMonth(@StartDate, 0,@StartPeriodDay))
	BEGIN
		INSERT INTO @result
		SELECT dbo.WorkPeriodAddMonth(@StartDate, -1,@StartPeriodDay)
	END
	DECLARE @difMonth INT,@difDay INT
	
	SET @difDay=DATEDIFF(DAY, @StartDate, @EndDate);
	IF(@difDay<31)
		SET @difMonth=0
	ELSE SET @difMonth=DATEDIFF(MONTH, @StartDate, @EndDate)	
	
	INSERT INTO @result
	SELECT  dbo.WorkPeriodAddMonth(@StartDate, x.number,@StartPeriodDay) AS workDate 
		FROM    master.dbo.spt_values x
	WHERE   x.type = 'P'        
	AND     x.number <= @difMonth	
	AND dbo.WorkPeriodAddMonth(@StartDate, x.number,@StartPeriodDay)<@EndDate
RETURN
END	
	
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'WF_IsManagerAccess') AND type in (N'P', N'PC'))
	DROP PROCEDURE WF_IsManagerAccess
GO
--exec WF_IsManagerAccess 532,1,1,0
CREATE PROCEDURE WF_IsManagerAccess
	@EmpNo FLOAT,
	@ActionId INT,
	@IsDay BIT 	,
	@Limitvalue INT 
AS
DECLARE @startDay INT,@currentPersianDate NVARCHAR(10),@startDate DATETIME,@endDate  DATETIME
SELECT @startDay=p.START_DAY FROM PARMFILE p

SET @startDate=GETDATE() 
IF(dbo.PersianDatePart(@startDate,'day')<@startDay)
	SELECT @startDate=DATEADD(MONTH,-1,dbo.Shamsi2MiladiYMD(dbo.PersianDatePart(@startDate,'year'),dbo.PersianDatePart(@startDate,'month'),@startDay,1))
ELSE 
	SELECT @startDate=dbo.Shamsi2MiladiYMD(dbo.PersianDatePart(@startDate,'year'),dbo.PersianDatePart(@startDate,'month'),@startDay,1)


SELECT @endDate=DATEADD(MONTH,1,@startDate)-1

SET @currentPersianDate=dbo.ShamsyDate(@endDate)


IF(@IsDay=1)
BEGIN
	SELECT d.workDate StartPeriod,dbo.WorkPeriodAddMonth(d.workDate, 1,@startDay)-1 EndPeriod
	INTO #periods 
	FROM dbo.WorkPeriodMonths(@StartDate,@EndDate,@startDay) d

	IF(@ActionId=5)
	BEGIN
		SELECT dbo.ShamsiDayPart('month',dbo.ShamsyDate(p.EndPeriod)) Period,r.Duration,
		DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))+1 dif
		INTO #req1 FROM Requests r
		CROSS JOIN #periods p 
		WHERE	dbo.WFCardToAction(r.[Type], r.OperationsID) = @ActionId	
				AND(@StartDate BETWEEN r.StartDate AND r.EndDate OR @EndDate BETWEEN r.StartDate AND r.EndDate)
				AND DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))>=0
				AND r.EMP_NO=@EmpNo			
				AND r.IsFinalApproved=1	
		ORDER BY r.RequestsID		
		DROP TABLE #periods		

		SELECT r.Period,dbo.Min2Time(SUM(r.dif* dbo.Time2Min(r.Duration))) sumreq FROM #req1 r
		GROUP BY r.Period
		HAVING dbo.Min2Time(SUM(r.dif* dbo.Time2Min(r.Duration)))>@Limitvalue
		DROP TABLE #req1
	END
	ELSE
	BEGIN
		SELECT dbo.ShamsiDayPart('month', dbo.ShamsyDate(p.EndPeriod)) Period,DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))+1 dif
		INTO #req2 FROM Requests r
		CROSS JOIN #periods p 
		WHERE	dbo.WFCardToAction(r.[Type], r.OperationsID) = @ActionId	
				AND(r.StartDate BETWEEN @StartDate AND @EndDate OR r.EndDate BETWEEN @StartDate AND @EndDate)
				AND DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))>=0
				AND r.EMP_NO=@EmpNo			
				AND r.IsFinalApproved=1	
		DROP TABLE #periods					
		SELECT r.Period,dbo.Min2Time(SUM(r.dif)) sumreq FROM #req2 r
				GROUP BY r.Period
				HAVING SUM(r.dif)> dbo.Time2Min(@Limitvalue)
		DROP TABLE #req2	
	END					
	
END
ELSE 
BEGIN
	SELECT dbo.ShamsiDayPart('month', @currentPersianDate) Period, SUM(dbo.Time2Min(CAST(r.Duration AS INT))) dif
	INTO #req3 FROM Requests r
	WHERE r.EMP_NO=@EmpNo
	AND dbo.WFCardToAction(r.[Type],r.OperationsID)=@ActionId
	AND r.StartDate BETWEEN @startDate AND @endDate
	AND r.IsFinalApproved=1
	
	SELECT r.Period,dbo.Min2Time(SUM(r.dif)) sumreq FROM #req3 r
				GROUP BY r.Period
				HAVING SUM(r.dif)> dbo.Time2Min(@Limitvalue)
		DROP TABLE #req3	
END
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'WF_SectionOverTimeAccess') AND type in (N'P', N'PC'))
	DROP PROCEDURE WF_SectionOverTimeAccess
GO
--exec WF_SectionOverTimeAccess 217,10,'20160317'
CREATE PROCEDURE WF_SectionOverTimeAccess
	@secNo FLOAT,
	@Limitvalue INT,
	@startDate DATETIME
AS
SET @Limitvalue=@Limitvalue*100

DECLARE @startDay INT,@endDate  DATETIME
SELECT @startDay=p.START_DAY FROM PARMFILE p
IF(@startDay>=30)
BEGIN
	RAISERROR(N'مقدار تاریخ شروع دوره صحیح نمی باشد',15,1);
	RETURN 0;
END
IF(dbo.PersianDatePart(@startDate,'day')<@startDay)
	SELECT @startDate=DATEADD(MONTH,-1,dbo.Shamsi2MiladiYMD(dbo.PersianDatePart(@startDate,'year'),dbo.PersianDatePart(@startDate,'month'),@startDay,1))
ELSE 
	SELECT @startDate=dbo.Shamsi2MiladiYMD(dbo.PersianDatePart(@startDate,'year'),dbo.PersianDatePart(@startDate,'month'),@startDay,1)
	
SET @endDate=dbo.WorkPeriodAddMonth(@startDate,1,@startDay)-1

SELECT d.workDate StartPeriod,dbo.WorkPeriodAddMonth(d.workDate, 1,@startDay)-1 EndPeriod
	INTO #periods 
	FROM dbo.WorkPeriodMonths(@StartDate,@EndDate,@startDay) d

SELECT dbo.ShamsiDayPart('month',dbo.ShamsyDate(p.EndPeriod)) Period,r.Duration,
DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))+1 dif
INTO #req1 FROM Requests r
CROSS JOIN #periods p 
JOIN EMPLOYEE e ON e.EMP_NO=r.EMP_NO 
WHERE	dbo.WFCardToAction(r.[Type], r.OperationsID) = 5
		AND(r.StartDate BETWEEN @startDate AND @endDate OR r.EndDate BETWEEN @startDate AND @endDate)
		AND DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))>=0
		AND e.SEC_NO=@SecNo		
		AND r.IsFinalApproved=1	
ORDER BY r.RequestsID		
DROP TABLE #periods		


SELECT r.Period,dbo.Min2Time(SUM(r.dif* dbo.Time2Min(r.Duration))) sumreq FROM #req1 r
GROUP BY r.Period
HAVING dbo.Min2Time(SUM(r.dif* dbo.Time2Min(r.Duration)))>@Limitvalue AND @Limitvalue<999900
DROP TABLE #req1
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/
UPDATE LimitedManager
SET    LimitDurationPerMonth = CASE 
                                    WHEN ActionID = 1 THEN 31
                                    WHEN ActionID = 2 THEN 31
                                    WHEN ActionID = 3 THEN 99900
                                    WHEN ActionID = 4 THEN 1
                                    WHEN ActionID = 5 THEN 99900
                                    WHEN ActionID = 6 THEN 31
                                    WHEN ActionID = 7 THEN 99900
                                    WHEN ActionID = 8 THEN 1
                                    WHEN ActionID = 9 THEN 99900
                                    WHEN ActionID = 10 THEN 31
                                    WHEN ActionID = 11 THEN 0
                                    WHEN ActionID = 12 THEN 1
                                    WHEN ActionID = 13 THEN 1
                               END
WHERE  LimitDurationPerMonth IS NULL
       AND Manager_EmpNO > 0

/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/

ALTER PROC [WF_DataFileGetDataByDateAndAroundTime]
@Emp_No FLOAT,
@Date_	FLOAT,
@StartTime SMALLINT,
@EndTime SMALLINT
AS
SELECT DISTINCT DataFile.Clock_No, DataFile.Direction, DataFile.EMP_NO, DataFile.MODIFY, 
       DataFile.SR_Type, DataFile.STATUS, DataFile.TIME_, CAST(DataFile.DATE_ AS DATETIME) 
       - 2 AS DATE_, CARDS.TITLE AS CARDSTITLE
FROM   DataFile
       LEFT OUTER JOIN CARDS
            ON  DataFile.STATUS = CARDS.CARD_NO
WHERE  (DataFile.EMP_NO = @Emp_No)
		AND DataFile.[STATUS]<200
       AND (DataFile.DATE_ = @Date_)
       AND dbo.Time2Min(DataFile.TIME_) BETWEEN dbo.Time2Min(@StartTime)AND dbo.Time2Min(@EndTime)
ORDER BY
       DataFile.TIME_
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/       
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'WF_RequestGetStatistic') AND type in (N'P', N'PC'))
	DROP PROCEDURE WF_RequestGetStatistic
GO


--EXEC WF_RequestGetStatistic 180,'2012-01-01','2017-01-01',0
CREATE PROCEDURE WF_RequestGetStatistic
	@EmpManager FLOAT,	
	@StartDate DATETIME,
	@EndDate DATETIME,
	@SecNo INT
AS
DECLARE @CurDate NVARCHAR(10)
SET @CurDate=dbo.ShamsyDate(GETDATE())

SELECT r.Duration,r.[Type],r.IsFinalApproved,r.OperationsID,
DATEDIFF(DAY, dbo.MaxDate(r.StartDate,@StartDate),dbo.MinDate(r.EndDate,@EndDate))+1 overlap
INTO #req  FROM Requests r  
RIGHT OUTER JOIN SECTIONS s ON s.SEC_NO = r.CurSection
JOIN EMPLOYEE e ON r.EMP_NO=e.EMP_NO
WHERE	(
			(r.CurEmp_NO = @EmpManager)
			OR ((s.SEmp_No = @EmpManager) AND (@CurDate BETWEEN s.S_FDate  AND s.S_TDate))
			OR (r.EMP_NO IN (SELECT e2.EMP_NO FROM EMPLOYEE e2 WHERE e2.EmpMngr=@EmpManager))
		)		 		
		 AND DATEDIFF(DAY, dbo.MaxDate(r.StartDate,@StartDate),dbo.MinDate(ISNULL(r.EndDate,r.StartDate),@EndDate))>=0
		 AND (e.SEC_NO=@SecNo OR @SecNo=0)

SELECT c.CARD_TYPE,dbo.Min2Time(SUM(r.overlap*dbo.Time2Min(r.Duration))) sumdur,0 isDay,r.IsFinalApproved,a.Fdesc,a.ActionId,COUNT(1) cnt
  FROM #req r
JOIN CARDS c ON r.[Type]=c.CARD_NO
JOIN [Action] a ON a.ActionId=dbo.WFCardToAction(r.[Type], r.OperationsID)
WHERE c.IS_DAY=0 AND c.CARD_NO=103
GROUP BY c.CARD_TYPE,r.IsFinalApproved,a.Fdesc,a.ActionId

	UNION ALL

SELECT c.CARD_TYPE,dbo.Min2Time(SUM(dbo.Time2Min(r.Duration))) sumdur,0 isDay,r.IsFinalApproved,a.Fdesc,a.ActionId,COUNT(1) cnt
 FROM #req r
JOIN CARDS c ON r.[Type]=c.CARD_NO
JOIN [Action] a ON a.ActionId=dbo.WFCardToAction(r.[Type], r.OperationsID)
WHERE c.IS_DAY=0 AND c.CARD_NO<100
GROUP BY c.CARD_TYPE,r.IsFinalApproved,a.Fdesc,a.ActionId

	UNION ALL

SELECT c.CARD_TYPE,SUM(CAST(r.Duration AS INT)) sumdur,1 isDay,r.IsFinalApproved,a.Fdesc,a.ActionId,COUNT(1) cnt
 FROM #req r
JOIN CARDS c ON r.[Type]=c.CARD_NO
JOIN [Action] a ON a.ActionId=dbo.WFCardToAction(r.[Type], r.OperationsID)
WHERE c.IS_DAY=1 AND c.CARD_NO<100 
GROUP BY c.CARD_TYPE,r.IsFinalApproved,a.Fdesc,a.ActionId

DROP TABLE #req
/**************************************************************************/
GO
/**************************************************************************/       
IF COL_LENGTH('Sections','WF_ParallelApproveEmp_No') IS NULL
	ALTER TABLE Sections ADD WF_ParallelApproveEmp_No INT NULL
/**************************************************************************/
GO
/**************************************************************************/       	
IF COL_LENGTH('WFRequestParallelApproval','IsParallelForCard') IS NULL	
	ALTER TABLE WFRequestParallelApproval ADD IsParallelForCard BIT DEFAULT(1) NOT NULL
/**************************************************************************/
GO
/**************************************************************************/       	
IF COL_LENGTH('Sections','WF_ParallelApproveStartDate') IS NULL	
	ALTER TABLE Sections ADD WF_ParallelApproveStartDate DATETIME NULL
/**************************************************************************/
GO
/************************************************************************************/
ALTER PROCEDURE WF_ParallelApproveGetAcceptState
@RequestID INT,
@CardNo INT
AS
DECLARE @Duration INT,@AcceptCode SMALLINT,@IsFinalApproved BIT
SET @Duration=0
SELECT @Duration=CASE WHEN r.[Type]=100 THEN 999 ELSE r.Duration END,@AcceptCode = r.AcceptCode, @IsFinalApproved= r.IsFinalApproved
  FROM Requests r WHERE r.RequestsID=@RequestID AND ISNUMERIC(r.Duration)=1
			
IF(@IsFinalApproved IS NOT NULL AND @AcceptCode=0)
SELECT @RequestID RequestID
ELSE 
	SELECT (SELECT DISTINCT wpa.RequestID  FROM WFRequestParallelApproval wpa 
			WHERE	wpa.ParallelApprovalCardNo = wa.CardNo 
			AND wpa.ParallelApprovalEmpNo=wa.EmpNo  
			AND wpa.RequestID=@RequestID
			AND wpa.IsApprove=1		
			AND wpa.IsParallelForCard=1 
	) RequestID
	FROM WFParallelApprove wa
	WHERE wa.CardNo=@CardNo AND ISNULL(wa.LimitDuration,0) < @Duration
	UNION
	SELECT wpa.RequestID FROM Requests r 
		JOIN SECTIONS s ON r.CurSection=s.SEC_NO
		LEFT OUTER JOIN  WFRequestParallelApproval wpa  
			ON	wpa.ParallelApprovalEmpNo=s.WF_ParallelApproveEmp_No
			AND wpa.RequestID=r.RequestsID
			AND wpa.IsApprove=1	
			AND wpa.IsParallelForCard=0	
		WHERE r.RequestsID=@RequestID AND s.WF_ParallelApproveEmp_No IS NOT NULL AND s.WF_ParallelApproveStartDate<=GETDATE()
/**************************************************************************/
GO
/**************************************************************************/
ALTER PROCEDURE WF_RequestParallelApprovalInsert
@RequestID INT,
@ParallelApprovalEmpNo FLOAT,
@IsApprove BIT,
@FromDate DATETIME,
@Duration INT,
@IsParallelForCard BIT
AS
DECLARE @ParallelApprovalSecNo INT,@ParallelApprovalCardNo INT

IF(@Duration < 1)
	SELECT @ParallelApprovalCardNo=r.[Type],@FromDate=r.StartDate,@Duration=CAST(r.Duration AS INT) 
	  FROM Requests r WHERE r.RequestsID=@RequestID
ELSE 
	SELECT @ParallelApprovalCardNo=r.[Type]  FROM Requests r WHERE r.RequestsID=@RequestID

IF(@IsApprove=0)
	SET @Duration=0

SELECT @ParallelApprovalSecNo=wa.SecNo  FROM WFParallelApprove wa 
WHERE wa.EmpNo=@ParallelApprovalEmpNo AND wa.CardNo=@ParallelApprovalCardNo

UPDATE Requests SET Requested_Time = @Duration WHERE RequestsID=@RequestID

INSERT INTO WFRequestParallelApproval 
(RequestID,ParallelApprovalEmpNo,ParallelApprovalSecNo,ParallelApprovalCardNo,ChangeDate,IsApprove,FromDate,RequestDuration,IsParallelForCard)
VALUES(@RequestID,@ParallelApprovalEmpNo,@ParallelApprovalSecNo,@ParallelApprovalCardNo,GETDATE(),@IsApprove,@FromDate,@Duration,@IsParallelForCard)
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROC WF_EMPLOYEEGetDataByEmpNoForLogin
@EMP_NO	FLOAT
AS
SELECT s.TITLE,e.EMP_NO,e.NAME, e.FAMILY, e.Img, e.SEC_NO,e.SYS_ACTIVE,e.IsCut,e.GRP_NO,e.END_DATE,e.IS_UNIQ,e.IsWarden,e.IsPrintViewer,
		e.WardenDayCount,e.WardenJustInShift,e.WardenIsShowRequest,e.WardenIsShowReview,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 7) THEN 1 ELSE 0 END PrintViewer,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM Conferment c WHERE c.EMP_NO=e.EMP_NO AND GETDATE() BETWEEN c.StartDate AND DATEADD(minute,-1,c.EndDate+1)) 
				THEN 1 ELSE 0 END IsConferment,
				
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6)
				THEN 1 ELSE 0 END) AS BIT) AS Supervisor,
				 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,

CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO 
				AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
				AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute,
				
CASE WHEN EXISTS(SELECT TOP 1 1 FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO)  THEN 1 ELSE 0 END IsEmpMngr,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM WFParallelApprove wa WHERE wa.EmpNo=e.EMP_NO)  THEN 1 ELSE 0 END IsParallelApprove,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM SECTIONS s2 WHERE s2.WF_ParallelApproveEmp_No=e.EMP_NO AND s2.WF_ParallelApproveStartDate<=GETDATE()) THEN 1 ELSE 0 END IsParallelSectionKartabl

FROM EMPLOYEE e       
       RIGHT OUTER JOIN SECTIONS s
            ON  s.SEC_NO = e.SEC_NO
WHERE  (e.EMP_NO = @EMP_NO)

/************************************************************************************/
GO
/************************************************************************************/
ALTER PROC WF_EMPLOYEEGetDataByIdAndPassword
@WFUserName NVARCHAR(25),
@WFUserPass NVARCHAR(15)
AS
SELECT s.TITLE,e.EMP_NO,e.NAME, e.FAMILY, e.Img, e.SEC_NO,e.SYS_ACTIVE,e.IsCut,e.GRP_NO,e.END_DATE,e.IS_UNIQ,e.IsWarden,e.IsPrintViewer,
		e.WardenDayCount,e.WardenJustInShift,e.WardenIsShowRequest,e.WardenIsShowReview,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 7) THEN 1 ELSE 0 END PrintViewer,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM Conferment c WHERE c.EMP_NO=e.EMP_NO AND GETDATE() BETWEEN c.StartDate AND DATEADD(minute,-1,c.EndDate+1)) 
				THEN 1 ELSE 0 END IsConferment,
				
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6)
				THEN 1 ELSE 0 END) AS BIT) AS Supervisor,
				 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,

CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO 
				AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
				AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute,
				
CASE WHEN EXISTS(SELECT TOP 1 1 FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO)  THEN 1 ELSE 0 END IsEmpMngr,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM WFParallelApprove wa WHERE wa.EmpNo=e.EMP_NO)  THEN 1 ELSE 0 END IsParallelApprove,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM SECTIONS s2 WHERE s2.WF_ParallelApproveEmp_No=e.EMP_NO AND s2.WF_ParallelApproveStartDate<=GETDATE()) THEN 1 ELSE 0 END IsParallelSectionKartabl

FROM EMPLOYEE e       
       RIGHT OUTER JOIN SECTIONS s
            ON  s.SEC_NO = e.SEC_NO
WHERE  (e.WFUserName = @WFUserName)
       AND (e.WFUserPass = @WFUserPass)
/**************************************************************************/
GO
/**************************************************************************/
ALTER PROCEDURE WF_ParallelApproveGetData
@RequestID INT,
@CardNo INT
AS 
DECLARE @Duration INT,@AcceptCode SMALLINT,@IsFinalApproved BIT
SET @Duration=0
SELECT @Duration=CASE WHEN r.[Type]=100 THEN 999 ELSE r.Duration END ,@AcceptCode = r.AcceptCode, @IsFinalApproved= r.IsFinalApproved
FROM Requests r WHERE r.RequestsID=@RequestID AND ISNUMERIC(r.Duration)=1

SELECT wpa.RequestID, wpa.ParallelApprovalEmpNo AS EmpNo, wpa.ParallelApprovalSecNo AS SecNo,
	       wpa.ParallelApprovalCardNo AS CardNo, wpa.IsApprove, wpa.FromDate,wpa.RequestDuration,
	       c.IS_DAY,c.CARD_TYPE,c.TITLE,wgev.FullName,s.TITLE Section,0 IsParallelForCard  into #tbl1
FROM Requests r 
JOIN SECTIONS s ON r.CurSection=s.SEC_NO
LEFT OUTER JOIN WFRequestParallelApproval wpa ON wpa.RequestID=r.RequestsID AND wpa.ParallelApprovalEmpNo=s.WF_ParallelApproveEmp_No
LEFT OUTER JOIN CARDS c ON c.CARD_NO=r.[Type]
LEFT OUTER JOIN WF_GetEmployee_VI wgev ON  wgev.EMP_NO = s.WF_ParallelApproveEmp_No
WHERE r.RequestsID=@RequestID AND s.WF_ParallelApproveEmp_No IS NOT NULL AND s.WF_ParallelApproveStartDate<=GETDATE()


IF(@IsFinalApproved IS NOT NULL AND @AcceptCode IN (0,21))
BEGIN
	SELECT * FROM #tbl1
	UNION ALL
	SELECT wpa.RequestID, wpa.ParallelApprovalEmpNo AS EmpNo, wpa.ParallelApprovalSecNo AS SecNo,
	       wpa.ParallelApprovalCardNo AS CardNo, wpa.IsApprove, wpa.FromDate,wpa.RequestDuration,
	       c.IS_DAY,c.CARD_TYPE,c.TITLE,wgev.FullName,s.TITLE Section,1 IsParallelForCard 
	  FROM WFRequestParallelApproval wpa 
	  LEFT OUTER JOIN SECTIONS s ON s.SEC_NO=wpa.ParallelApprovalSecNo
	  LEFT OUTER JOIN CARDS c ON c.CARD_NO=wpa.ParallelApprovalCardNo
	  LEFT OUTER JOIN WF_GetEmployee_VI wgev ON wgev.EMP_NO=wpa.ParallelApprovalEmpNo
	WHERE wpa.RequestID=@RequestID	
END
ELSE
BEGIN
	SELECT * FROM #tbl1
	UNION ALL
	SELECT wpa.RequestID, wpa.ParallelApprovalEmpNo AS EmpNo, wpa.ParallelApprovalSecNo AS SecNo,
	       wpa.ParallelApprovalCardNo AS CardNo, wpa.IsApprove, wpa.FromDate,wpa.RequestDuration,
	       c.IS_DAY,c.CARD_TYPE,c.TITLE,CASE WHEN wpa.RequestID>0 THEN wgev1.FullName ELSE wgev.FullName END FullName,
	       s.TITLE Section,1 IsParallelForCard 
	  FROM WFParallelApprove wa 
	LEFT OUTER JOIN WFRequestParallelApproval wpa 
		ON wpa.ParallelApprovalCardNo=wa.CardNo 	
		AND wpa.ParallelApprovalEmpNo=wa.EmpNo
		AND wpa.RequestID=@RequestID
	left outer JOIN WF_GetEmployee_VI wgev ON wgev.EMP_NO=wa.EmpNo
	left outer JOIN WF_GetEmployee_VI wgev1 ON wgev1.EMP_NO=wpa.ParallelApprovalEmpNo
	left outer JOIN SECTIONS s ON s.SEC_NO=wa.SecNo
	LEFT OUTER JOIN CARDS c ON c.CARD_NO=wa.CardNo
	WHERE wa.CardNo=@CardNo AND ISNULL(wa.LimitDuration,0) < @Duration 		
END

DROP TABLE #tbl1
/**************************************************************************/
GO
/**************************************************************************/
ALTER PROC [WF_SECTIONSGetData]
AS
SELECT    s.*,e.[NAME]+' '+e.FAMILY ManagerName,LTRIM(RTRIM(STR(s.Sec_No)))+' '+s.Title sectionName
,e1.[NAME]+' '+e1.FAMILY Substitute
FROM         SECTIONS s
LEFT OUTER JOIN EMPLOYEE e ON e.EMP_NO=s.EmpManager
left OUTER JOIN EMPLOYEE e1 ON e1.EMP_NO=s.SEmp_No
/**************************************************************************/
GO
/**************************************************************************/
ALTER PROCEDURE WF_RequestParallelApprovalInsert
@RequestID INT,
@ParallelApprovalEmpNo FLOAT,
@IsApprove BIT,
@FromDate DATETIME,
@Duration INT,
@IsParallelForCard BIT
AS
DECLARE @ParallelApprovalSecNo INT,@ParallelApprovalCardNo INT

IF(@Duration < 1)
	SELECT @ParallelApprovalCardNo=r.[Type],@ParallelApprovalSecNo=r.CurSection,@FromDate=r.StartDate,@Duration=CAST(r.Duration AS INT) 
	  FROM Requests r WHERE r.RequestsID=@RequestID
ELSE 
	SELECT @ParallelApprovalCardNo=r.[Type],@ParallelApprovalSecNo=r.CurSection  FROM Requests r WHERE r.RequestsID=@RequestID

IF(@IsApprove=0)
	SET @Duration=0
	
IF(@IsParallelForCard=0)
BEGIN
	SELECT @ParallelApprovalSecNo=wa.SecNo  FROM WFParallelApprove wa WHERE wa.EmpNo=@ParallelApprovalEmpNo AND wa.CardNo=@ParallelApprovalCardNo
	UPDATE Requests SET Requested_Time = @Duration WHERE RequestsID=@RequestID
END

INSERT INTO WFRequestParallelApproval 
(RequestID,ParallelApprovalEmpNo,ParallelApprovalSecNo,ParallelApprovalCardNo,ChangeDate,IsApprove,FromDate,RequestDuration,IsParallelForCard)
VALUES(@RequestID,@ParallelApprovalEmpNo,@ParallelApprovalSecNo,@ParallelApprovalCardNo,GETDATE(),@IsApprove,@FromDate,@Duration,@IsParallelForCard)
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROCEDURE WF_RequestsHourlyIsExist
	@StartDate DATETIME,
	@Emp_No FLOAT,
	@startTime INT,
	@endTime INT
AS
SELECT r.IsFinalApproved,COUNT(1) cnt FROM Requests r 
JOIN CARDS c ON r.[Type]=c.CARD_NO
WHERE c.IS_DAY=0
AND r.StartDate=@StartDate
AND r.EMP_NO=@Emp_No
AND r.StartHour IS NOT NULL
AND r.AcceptCode<>22
AND (	
		(CASE WHEN r.StartHour>@startTime THEN r.StartHour ELSE @startTime END)-
		(CASE WHEN ISNULL(r.EndHour,r.StartHour)<@endTime THEN ISNULL(r.EndHour,r.StartHour) ELSE @endTime END)
	)<=0
AND r.IsFirstTimeShift=0	
GROUP BY r.IsFinalApproved	
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROCEDURE [dbo].Paging_Cursor
(
@Tables nvarchar(1000),
@Sort nvarchar(200) = 'RequestsID',
@PageNumber int = 1,
@PageSize int = 10,
@Fields nvarchar(1000) = '*',
@Filter nvarchar(1000) = NULL
)
AS

IF(@PageNumber<=0) SET @PageNumber=1

DECLARE @offset INT,@newsize INT,@sql NVARCHAR(MAX),@strFilter nvarchar(1000)

SET @offset=((@PageNumber-1)*@PageSize)+1;
SET @newsize=(@PageNumber*@PageSize)
       
IF @Filter IS NOT NULL AND @Filter != ''
BEGIN
      IF(CHARINDEX(N'Where', @Filter)>0)
            SET @strFilter = @Filter + ' '      
      ELSE SET @strFilter =' WHERE '+@Filter + ' '    
END ELSE
      SET @strFilter = ''
      
IF(CHARINDEX('MiladyStartDate',@Sort)=0)
       SET @Sort=REPLACE(@Sort,'StartDate','MiladyStartDate')
IF(CHARINDEX('MiladySubmittedDate',@Sort)=0)
    SET @Sort=REPLACE(@Sort,'SubmittedDate','MiladySubmittedDate')
    
SET NOCOUNT ON

SET @sql = 'WITH OrderedSet AS (SELECT '+@Fields+', ROW_NUMBER() OVER (ORDER BY ' + @sort + ') AS ''Index'' FROM '+@Tables+@strFilter+')
SELECT * FROM OrderedSet WHERE [Index] BETWEEN ' + CONVERT(NVARCHAR(12), @offset) + ' AND ' + CONVERT(NVARCHAR(12), (@newsize)) +
' SELECT COUNT(*) TotalPages FROM '+@Tables+@strFilter
EXECUTE (@sql)
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROC WF_GetPwkaraUsers
@USERS_ID NVARCHAR(25),
@USERS_PASSWORD NVARCHAR(15)
AS
SELECT s.TITLE,e.EMP_NO,e.NAME, e.FAMILY, e.Img, e.SEC_NO,e.SYS_ACTIVE,e.IsCut,e.GRP_NO,e.END_DATE,e.IS_UNIQ,e.IsWarden,e.IsPrintViewer,
		e.WardenDayCount,e.WardenJustInShift,e.WardenIsShowRequest,e.WardenIsShowReview,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 7) THEN 1 ELSE 0 END PrintViewer,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM Conferment c WHERE c.EMP_NO=e.EMP_NO AND GETDATE() BETWEEN c.StartDate AND DATEADD(minute,-1,c.EndDate+1)) 
				THEN 1 ELSE 0 END IsConferment,
				
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6)
				THEN 1 ELSE 0 END) AS BIT) AS Supervisor,
				 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,

CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO 
				AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
				AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute,
				
CASE WHEN EXISTS(SELECT TOP 1 1 FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO)  THEN 1 ELSE 0 END IsEmpMngr,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM WFParallelApprove wa WHERE wa.EmpNo=e.EMP_NO)  THEN 1 ELSE 0 END IsParallelApprove,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM SECTIONS s2 WHERE s2.WF_ParallelApproveEmp_No=e.EMP_NO AND s2.WF_ParallelApproveStartDate<=GETDATE()) THEN 1 ELSE 0 END IsParallelSectionKartabl 
FROM Users u 
	LEFT OUTER JOIN EMPLOYEE e ON u.USERS_EmpNo=e.EMP_NO
	LEFT OUTER JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
	
WHERE	u.USERS_PASSWORD=@USERS_PASSWORD AND 
		u.USERS_ID=@USERS_ID
/**************************************************************************/
GO
/************************************************************************************/
ALTER PROCEDURE WF_RequestsHourlyIsExist
	@StartDate DATETIME,
	@Emp_No FLOAT,
	@startTime INT,
	@endTime INT,
	@RequestsID INT 
AS
SELECT r.IsFinalApproved,COUNT(1) cnt FROM Requests r 
JOIN CARDS c ON r.[Type]=c.CARD_NO
WHERE c.IS_DAY=0
AND r.StartDate=@StartDate
AND r.EMP_NO=@Emp_No
AND r.StartHour IS NOT NULL
AND r.AcceptCode<>22
AND (	
		(CASE WHEN r.StartHour>@startTime THEN r.StartHour ELSE @startTime END)-
		(CASE WHEN ISNULL(r.EndHour,r.StartHour)<@endTime THEN ISNULL(r.EndHour,r.StartHour) ELSE @endTime END)
	)<=0
AND r.IsFirstTimeShift=0	
AND r.RequestsID<>@RequestsID
GROUP BY r.IsFinalApproved	
/************************************************************************************/
GO
/************************************************************************************/
ALTER PROCEDURE WF_FindNearDataFile
@EMP_NO FLOAT,
@Date FLOAT,
@StartTime INT,
@EndTime	INT
AS
DECLARE @Tolerance INT,@IsExistsMaxDateFile INT
SELECT @Tolerance=p.Tolerance FROM PARMFILE p

SELECT @IsExistsMaxDateFile=COUNT(1) FROM DataFile df 
	WHERE	df.DATE_=@Date AND df.EMP_NO=@EMP_NO AND 
			dbo.Time2Min(df.TIME_)>= dbo.Time2Min(@StartTime)- @Tolerance 
			
IF(@IsExistsMaxDateFile>0 OR ((dbo.Time2Min(CAST(REPLACE(CONVERT(VARCHAR(5),GETDATE(),108),':','') AS INT))-@Tolerance)>dbo.Time2Min(@StartTime)))
BEGIN
	SELECT DISTINCT TOP 1 df.*,ABS(dbo.Time2Min(@StartTime)-dbo.Time2Min(df.TIME_)) DifTime INTO #DF FROM DataFile df 
	LEFT OUTER JOIN CARDS c ON df.[STATUS] = c.CARD_NO
	WHERE df.EMP_NO=@EMP_NO  AND df.DATE_=@Date
	AND (dbo.Time2Min(df.TIME_) BETWEEN dbo.Time2Min(@StartTime)- @Tolerance AND dbo.Time2Min(@StartTime) + @Tolerance)
	ORDER BY ABS(dbo.Time2Min(@StartTime)-dbo.Time2Min(df.TIME_)) 	

	IF (EXISTS(SELECT * FROM #DF))
		SELECT *,@Tolerance Tolerance FROM #DF	
	ELSE 
	BEGIN
		DECLARE @GroupFirst  INT,@ShiftNew  INT,@Calen_T INT,@Year INT,@Month INT,@Day INT ,@ShamsyDate NVARCHAR(10),@S2_TIME INT,@START_TIME INT	
		DECLARE @Tdate FLOAT
		SET @Tdate=@Date-2
		SET @ShamsyDate= dbo.Miladi2Shamsi(CAST(@Tdate AS DATETIME),0)
		SET @Year=CAST(SUBSTRING(@ShamsyDate,0,5) AS INT)
		SET @Month=CAST(SUBSTRING(@ShamsyDate,5,2) AS INT)
		SET @Day=CAST(SUBSTRING(@ShamsyDate,7,2) AS INT)
		exec Sp_MixFindShift @GroupFirst OUT,@EMP_NO,@Date,@Year,@Month,@Day,@ShiftNew OUT,@Calen_T OUT
		
		IF EXISTS(SELECT * FROM PARMFILE p WHERE @Date BETWEEN p.StartDateRamedan AND p.EndDateRamedan)
			SELECT @START_TIME=s.START_TIME, @S2_TIME=s.RAMEZAN_S FROM SHIFTS s WHERE s.SHIFT_NO=@ShiftNew
		ELSE SELECT @START_TIME=s.START_TIME, @S2_TIME=s.S2_TIME FROM SHIFTS s WHERE s.SHIFT_NO=@ShiftNew
		  
		IF(dbo.Time2Min(@StartTime)<= dbo.Time2Min(@S2_TIME))
		BEGIN
				SELECT TOP 1 df.*,@Tolerance Tolerance FROM DataFile df 
					LEFT OUTER JOIN CARDS c ON df.[STATUS] = c.CARD_NO
				WHERE df.EMP_NO=@EMP_NO  AND df.DATE_=@Date
					AND (dbo.Time2Min(df.TIME_) BETWEEN dbo.Time2Min(@StartTime) AND dbo.Time2Min(@EndTime) + @Tolerance)
				ORDER BY df.TIME_
		END	
	END
	DROP TABLE #DF
END
/************************************************************************************/
GO
/************************************************************************************/   
ALTER PROCEDURE WF_GetTimeTypeByEmpNo
@Emp_NO FLOAT
AS
SELECT * FROM CARDS c WHERE c.IS_DAY=0 AND c.SYS_ACTIVE=1 AND c.CARD_TYPE IN (1,5,3)
AND c.CARD_NO NOT IN (SELECT wec.Card_NO FROM WF_EmpCard wec WHERE wec.Emp_NO=@Emp_NO)
AND c.Card_No NOT IN (2,1,222,228)
/************************************************************************************/
GO
/******************************************************************/
ALTER PROCEDURE [dbo].[WF_Rep_Request]
@FromDate DATETIME ,
@ToDate DATETIME ,
@Type INT 
AS
DECLARE @tCard TABLE(CARD_NO INT)
IF(@Type=1)--Morakhasi Rozane
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@Type=2)--Mamoriat Rozane	
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=1 AND c.SYS_ACTIVE=1
ELSE IF(@Type=3)--Morakhasi Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=5 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE IF(@Type=4)--Eslahe Vorod Khoroj
	INSERT INTO @tCard VALUES(101)
ELSE IF(@Type=5)--Ezafe Kari
	INSERT INTO @tCard VALUES(103)	
ELSE IF(@Type=6)--Jabejayee Shift
	INSERT INTO @tCard VALUES(102)	
ELSE IF(@Type=7)--Afzayesh Kahesh Morakhasi
	INSERT INTO @tCard VALUES(104)	
ELSE IF(@Type=8)--Vorod Khoroj Faramosh shode
	INSERT INTO @tCard VALUES(100)			
ELSE IF(@Type=9)--Mamoriat Saati
	INSERT INTO @tCard SELECT c.CARD_NO FROM CARDS c WHERE c.CARD_TYPE=3 AND c.IS_DAY=0 AND c.SYS_ACTIVE=1
ELSE INSERT INTO @tCard VALUES(@Type)

SELECT r.StartDate ,r.EMP_NO ,e.PERS_NO ,e.[NAME],e.FAMILY,s.TITLE ,r.IsFinalApproved,s.SEC_NO,r.RequestsID
,r.[Type],c.TITLE CardTITLE,r.Distination,c.IS_DAY,r.Duration,r.OperationsID,r.[Description],r.StartHour,
r.EndHour, r.Requested_Time
  FROM Requests r 
JOIN EMPLOYEE e ON e.EMP_NO = r.EMP_NO
JOIN SECTIONS s ON s.SEC_NO = e.SEC_NO
JOIN CARDS c ON c.CARD_NO=r.[Type]
WHERE r.[Type] IN (SELECT t.CARD_NO FROM @tCard t)
AND r.StartDate BETWEEN @FromDate AND @ToDate
ORDER BY r.StartDate
/******************************************************************/
GO
/******************************************************************/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.WFRequestParallelApproval
	DROP CONSTRAINT PK_WFRequestParallelApproval
GO
ALTER TABLE dbo.WFRequestParallelApproval ADD CONSTRAINT
	PK_WFRequestParallelApproval PRIMARY KEY CLUSTERED 
	(
	RequestID,
	ParallelApprovalEmpNo,
	ParallelApprovalSecNo,
	ParallelApprovalCardNo,
	IsParallelForCard
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.WFRequestParallelApproval SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
/******************************************************************/
GO
/**********************Ver 5.2.2.4**********************************/
IF (COL_LENGTH('Action','NeedDesc') IS NULL)
ALTER TABLE Action ADD NeedDesc BIT DEFAULT(0) NOT NULL
/**************************************************************************/
GO
/**************************************************************************/
ALTER PROCEDURE WF_ParallelApproveGetData
@RequestID INT,
@CardNo INT
AS 
DECLARE @Duration INT,@AcceptCode SMALLINT,@IsFinalApproved BIT
SET @Duration=0
SELECT @Duration=CASE WHEN r.[Type]=100 THEN 999 ELSE r.Duration END ,@AcceptCode = r.AcceptCode, @IsFinalApproved= r.IsFinalApproved
FROM Requests r WHERE r.RequestsID=@RequestID AND ISNUMERIC(r.Duration)=1

SELECT wpa.RequestID, wpa.ParallelApprovalEmpNo AS EmpNo, wpa.ParallelApprovalSecNo AS SecNo,
	       wpa.ParallelApprovalCardNo AS CardNo, wpa.IsApprove, wpa.FromDate,wpa.RequestDuration,
	       c.IS_DAY,c.CARD_TYPE,c.TITLE,wgev.FullName,s.TITLE Section,0 IsParallelForCard,wpa.ChangeDate  into #tbl1
FROM Requests r 
JOIN SECTIONS s ON r.CurSection=s.SEC_NO
LEFT OUTER JOIN WFRequestParallelApproval wpa ON wpa.RequestID=r.RequestsID AND wpa.ParallelApprovalEmpNo=s.WF_ParallelApproveEmp_No
LEFT OUTER JOIN CARDS c ON c.CARD_NO=r.[Type]
LEFT OUTER JOIN WF_GetEmployee_VI wgev ON  wgev.EMP_NO = s.WF_ParallelApproveEmp_No
WHERE r.RequestsID=@RequestID AND s.WF_ParallelApproveEmp_No IS NOT NULL AND s.WF_ParallelApproveStartDate<=GETDATE()


IF(@IsFinalApproved IS NOT NULL AND @AcceptCode IN (0,21))
BEGIN
	SELECT * FROM #tbl1
	UNION ALL
	SELECT wpa.RequestID, wpa.ParallelApprovalEmpNo AS EmpNo, wpa.ParallelApprovalSecNo AS SecNo,
	       wpa.ParallelApprovalCardNo AS CardNo, wpa.IsApprove, wpa.FromDate,wpa.RequestDuration,
	       c.IS_DAY,c.CARD_TYPE,c.TITLE,wgev.FullName,s.TITLE Section,1 IsParallelForCard,wpa.ChangeDate
	  FROM WFRequestParallelApproval wpa 
	  LEFT OUTER JOIN SECTIONS s ON s.SEC_NO=wpa.ParallelApprovalSecNo
	  LEFT OUTER JOIN CARDS c ON c.CARD_NO=wpa.ParallelApprovalCardNo
	  LEFT OUTER JOIN WF_GetEmployee_VI wgev ON wgev.EMP_NO=wpa.ParallelApprovalEmpNo
	WHERE wpa.RequestID=@RequestID	
END
ELSE
BEGIN
	SELECT * FROM #tbl1
	UNION ALL
	SELECT wpa.RequestID, wpa.ParallelApprovalEmpNo AS EmpNo, wpa.ParallelApprovalSecNo AS SecNo,
	       wpa.ParallelApprovalCardNo AS CardNo, wpa.IsApprove, wpa.FromDate,wpa.RequestDuration,
	       c.IS_DAY,c.CARD_TYPE,c.TITLE,CASE WHEN wpa.RequestID>0 THEN wgev1.FullName ELSE wgev.FullName END FullName,
	       s.TITLE Section,1 IsParallelForCard,wpa.ChangeDate
	  FROM WFParallelApprove wa 
	LEFT OUTER JOIN WFRequestParallelApproval wpa 
		ON wpa.ParallelApprovalCardNo=wa.CardNo 	
		AND wpa.ParallelApprovalEmpNo=wa.EmpNo
		AND wpa.RequestID=@RequestID
	left outer JOIN WF_GetEmployee_VI wgev ON wgev.EMP_NO=wa.EmpNo
	left outer JOIN WF_GetEmployee_VI wgev1 ON wgev1.EMP_NO=wpa.ParallelApprovalEmpNo
	left outer JOIN SECTIONS s ON s.SEC_NO=wa.SecNo
	LEFT OUTER JOIN CARDS c ON c.CARD_NO=wa.CardNo
	WHERE wa.CardNo=@CardNo AND ISNULL(wa.LimitDuration,0) < @Duration 		
END

DROP TABLE #tbl1
/**************************************************************************/
/**********************Ver 5.2.2.11**********************************/
/**************************************************************************/
GO
--سقف مرخصی استحقاقی منفی بعد از درخواست
IF (COL_LENGTH('PARMFILE','MaxNegativeDuration') IS NULL)
	ALTER TABLE PARMFILE ADD MaxNegativeDuration INT DEFAULT(0) NOT NULL
GO
/************************************************************************************/	           
ALTER PROCEDURE WF_UpdatePARMFILE
@Domain NVARCHAR(100),
@DomainFieldEmpNO NVARCHAR(255),
@DomainFieldAdmin NVARCHAR(255),
@DayArchive INT,
@Tolerance  INT,
@WFRequestMandeControl bit,
@WFIsAttachment BIT,
@DayArchiveKind BIT ,
@WF_ParallelApprove BIT,
@WFLimitMonthShowDaily TINYINT,
@WFIsChangeUserName BIT,
@WFDifrenceRequest BIT,
@WFNeedDesc BIT,
@RegisterTolerance TINYINT,
@ShowRemainKardex BIT,
@MaxNegativeDuration INT 
AS
UPDATE PARMFILE 
SET 
	Domain = @Domain,
	DomainFieldEmpNO = @DomainFieldEmpNO,
	DomainFieldAdmin = @DomainFieldAdmin,
	DayArchive = @DayArchive,
	Tolerance = @Tolerance,
	WFRequestMandeControl=@WFRequestMandeControl,
	WFIsAttachment = @WFIsAttachment,
	DayArchiveKind=@DayArchiveKind,
	WF_ParallelApprove = @WF_ParallelApprove,
	WFLimitMonthShowDaily = @WFLimitMonthShowDaily,
	WFIsChangeUserName = @WFIsChangeUserName,
	WFDifrenceRequest = @WFDifrenceRequest,
	WFNeedDesc = @WFNeedDesc,
	RegisterTolerance = @RegisterTolerance,
	ShowRemainKardex = @ShowRemainKardex,
	MaxNegativeDuration =@MaxNegativeDuration 
/************************************************************************************/
GO
IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N'[WF_EMPLOYEEGetDataByNationalIDForLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE WF_EMPLOYEEGetDataByNationalIDForLogin
GO
/************************************************************************************/
CREATE PROC WF_EMPLOYEEGetDataByNationalIDForLogin
@NationalID	NVARCHAR(10)
AS
SELECT s.TITLE,e.EMP_NO,e.NAME, e.FAMILY, e.Img, e.SEC_NO,e.SYS_ACTIVE,e.IsCut,e.GRP_NO,e.END_DATE,e.IS_UNIQ,e.IsWarden,e.IsPrintViewer,
		e.WardenDayCount,e.WardenJustInShift,e.WardenIsShowRequest,e.WardenIsShowReview,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 7) THEN 1 ELSE 0 END PrintViewer,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM Conferment c WHERE c.EMP_NO=e.EMP_NO AND GETDATE() BETWEEN c.StartDate AND DATEADD(minute,-1,c.EndDate+1)) 
				THEN 1 ELSE 0 END IsConferment,
				
CAST((CASE WHEN e.IS_KARMAND = 2 THEN 1 WHEN EXISTS(SELECT * FROM EmployeeManagers em WHERE  em.ManagerEmp_No = e.EMP_NO AND em.OperationsID = 6)
				THEN 1 ELSE 0 END) AS BIT) AS Supervisor,
				 
CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s2 WHERE  s2.EmpManager = e.EMP_NO) AS BIT) AS Manager,

CAST((SELECT TOP 1 COUNT(1)FROM   SECTIONS s3 WHERE  s3.SEmp_No = e.EMP_NO 
				AND CAST((REPLACE(s3.S_FDate, '/', '')) AS FLOAT) <= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)
				AND CAST((REPLACE(s3.S_TDate, '/', '')) AS FLOAT) >= CAST((REPLACE(dbo.ShamsyDate(GETDATE()), '/', '')) AS INT)) AS BIT) AS Substitute,
				
CASE WHEN EXISTS(SELECT TOP 1 1 FROM EMPLOYEE e2 WHERE e2.EmpMngr=e.EMP_NO)  THEN 1 ELSE 0 END IsEmpMngr,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM WFParallelApprove wa WHERE wa.EmpNo=e.EMP_NO)  THEN 1 ELSE 0 END IsParallelApprove,

CASE WHEN EXISTS(SELECT TOP 1 1 FROM SECTIONS s2 WHERE s2.WF_ParallelApproveEmp_No=e.EMP_NO AND s2.WF_ParallelApproveStartDate<=GETDATE()) THEN 1 ELSE 0 END IsParallelSectionKartabl

FROM EMPLOYEE e       
       RIGHT OUTER JOIN SECTIONS s
            ON  s.SEC_NO = e.SEC_NO
WHERE  e.NationalID=@NationalID

/************************************************************************************/
GO
/************************************************************************************/
ALTER PROCEDURE WF_IsManagerAccess
	@EmpNo FLOAT,
	@ActionId INT,
	@IsDay BIT 	,
	@Limitvalue INT 
AS
DECLARE @startDay INT,@currentPersianDate NVARCHAR(10),@startDate DATETIME,@endDate  DATETIME
SELECT @startDay=p.START_DAY FROM PARMFILE p

SET @startDate=GETDATE() 
IF(dbo.PersianDatePart(@startDate,'day')<@startDay)
	SELECT @startDate=DATEADD(MONTH,-1,dbo.Shamsi2MiladiYMD(dbo.PersianDatePart(@startDate,'year'),dbo.PersianDatePart(@startDate,'month'),@startDay,1))
ELSE 
	SELECT @startDate=dbo.Shamsi2MiladiYMD(dbo.PersianDatePart(@startDate,'year'),dbo.PersianDatePart(@startDate,'month'),@startDay,1)


SELECT @endDate=DATEADD(MONTH,1,@startDate)-1

SET @currentPersianDate=dbo.ShamsyDate(@endDate)


IF(@IsDay=1)
BEGIN
	SELECT d.workDate StartPeriod,dbo.WorkPeriodAddMonth(d.workDate, 1,@startDay)-1 EndPeriod
	INTO #periods 
	FROM dbo.WorkPeriodMonths(@StartDate,@EndDate,@startDay) d

	IF(@ActionId=5)
	BEGIN
		SELECT dbo.ShamsiDayPart('month',dbo.ShamsyDate(p.EndPeriod)) Period,r.Duration,
		DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))+1 dif
		INTO #req1 FROM Requests r
		CROSS JOIN #periods p 
		WHERE	dbo.WFCardToAction(r.[Type], r.OperationsID) = @ActionId	
				AND(@StartDate BETWEEN r.StartDate AND r.EndDate OR @EndDate BETWEEN r.StartDate AND r.EndDate)
				AND DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))>=0
				AND r.EMP_NO=@EmpNo			
				AND r.IsFinalApproved=1	
		ORDER BY r.RequestsID		
		DROP TABLE #periods		

		SELECT r.Period,dbo.Min2Time(SUM(r.dif* dbo.Time2Min(r.Duration))) sumreq FROM #req1 r
		GROUP BY r.Period
		HAVING dbo.Min2Time(SUM(r.dif* dbo.Time2Min(r.Duration)))>@Limitvalue
		DROP TABLE #req1
	END
	ELSE
	BEGIN
		SELECT dbo.ShamsiDayPart('month', dbo.ShamsyDate(p.EndPeriod)) Period,DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))+1 dif
		INTO #req2 FROM Requests r
		CROSS JOIN #periods p 
		WHERE	dbo.WFCardToAction(r.[Type], r.OperationsID) = @ActionId	
				AND(r.StartDate BETWEEN @StartDate AND @EndDate OR r.EndDate BETWEEN @StartDate AND @EndDate)
				AND DATEDIFF(DAY, dbo.MaxDate(r.StartDate,p.StartPeriod),dbo.MinDate(r.EndDate,p.EndPeriod))>=0
				AND r.EMP_NO=@EmpNo			
				AND r.IsFinalApproved=1	
		DROP TABLE #periods					
		SELECT r.Period,dbo.Min2Time(SUM(r.dif)) sumreq FROM #req2 r
				GROUP BY r.Period
				HAVING SUM(r.dif)> dbo.Time2Min(@Limitvalue)
		DROP TABLE #req2	
	END					
	
END
ELSE 
BEGIN
	SELECT dbo.ShamsiDayPart('month', @currentPersianDate) Period, SUM(dbo.Time2Min(CAST(r.Duration AS INT))) dif
	INTO #req3 FROM Requests r
	WHERE r.EMP_NO=@EmpNo
	AND dbo.WFCardToAction(r.[Type],r.OperationsID)=@ActionId
	AND r.StartDate BETWEEN @startDate AND @endDate
	AND r.IsFinalApproved=1
		
	SELECT r.Period,dbo.Min2Time(SUM(r.dif)) sumreq FROM #req3 r
				GROUP BY r.Period
				HAVING SUM(r.dif)> dbo.Time2Min(@Limitvalue*100)
		DROP TABLE #req3	
END
/************************************************************************************************************************************/
GO
/************************************************************************************************************************************/
ALTER PROCEDURE WF_MOR_MAMDelete
@Emp_No FLOAT,
@S_DATE FLOAT,
@E_DATE FLOAT,
@Typ SMALLINT,
@P7  NVARCHAR(50)
AS
DECLARE @RefNumber BIGINT
SET @RefNumber=0
SELECT @RefNumber=RefNumber  FROM MOR_MAM WHERE EMP_NO=@Emp_No AND  S_DATE = @S_DATE AND E_DATE = @E_DATE AND TYP=@Typ AND E_DATE>0

SELECT * FROM MOR_MAM WHERE  RefNumber=@RefNumber
IF(@RefNumber>0)
BEGIN	
	DELETE FROM MOR_MAM WHERE RefNumber=@RefNumber
END
/**************************************************************************/
GO
/**************************************************************************/
ALTER PROCEDURE WF_GetTurnoverManager
@FromDate DATETIME,
@ToDate DATETIME,
@CurEmp_NO NVARCHAR(4000),
@OperationID NVARCHAR(100),
@startDate DATETIME
AS

/*************Turnover Manager*******************/
SELECT wr.CurEmp_NO,e.Name+' '+e.Family fullName,
wr.IsFinalApproved* CASE WHEN wr.AcceptCode IN (0,21,23,24) THEN 1 ELSE  wr.AcceptCode END IsFinalApproved,COUNT(1) cnt,COUNT(wr2.Id) cntrev
  FROM Requests AS wr
left OUTER JOIN Reviews AS wr2 ON wr2.RequestID = wr.RequestsId
LEFT OUTER JOIN Employee AS e ON e.Emp_No = wr.CurEmp_NO
WHERE wr.StartDate BETWEEN @fromDate AND @todate
AND (wr.CurEmp_NO IN (SELECT fs.item from dbo.fnSplit(@CurEmp_NO) fs) OR  @CurEmp_NO=',')
AND (wr.OperationsID =@OperationID OR @OperationID=0)
GROUP BY wr.CurEmp_NO, wr.IsFinalApproved* CASE WHEN wr.AcceptCode IN (0,21,23,24) THEN 1 ELSE  wr.AcceptCode END ,e.Name, e.Family

/*************In Progress***********************/
SELECT wr.CurEmp_NO,e.Name+' '+e.Family fullName,COUNT(wr.RequestsId) cnt,COUNT(wr2.Id) cntrev 
FROM Requests AS wr
LEFT OUTER JOIN Reviews AS wr2 ON wr2.RequestID = wr.RequestsId
LEFT OUTER JOIN Employee AS e ON e.Emp_No = wr.CurEmp_NO
WHERE wr.IsFinalApproved IS NULL AND wr.StartDate > @startDate AND wr.StartDate BETWEEN @fromDate AND @todate
AND (wr.CurEmp_NO IN (SELECT fs.item from dbo.fnSplit(@CurEmp_NO) fs) OR  @CurEmp_NO=',')
AND (wr.OperationsID =@OperationID OR @OperationID=0)
GROUP BY wr.CurEmp_NO,e.Name, e.Family

/*************MoveUp*******************/
SELECT wmu.FromMgrNo CurEmp_NO,e.Name+' '+e.Family fullName,COUNT(1) cnt  FROM MoveUp AS wmu
JOIN Requests AS wr ON wr.RequestsId = wmu.RequestID
LEFT OUTER JOIN Employee AS e ON e.Emp_No = wmu.FromMgrNo
WHERE wr.StartDate BETWEEN @fromDate AND @todate
AND (wmu.FromMgrNo IN (SELECT fs.item from dbo.fnSplit(@CurEmp_NO) fs) OR  @CurEmp_NO=',')
AND (wr.OperationsID =@OperationID OR @OperationID=0)
GROUP BY wmu.FromMgrNo,e.Name, e.Family
/**************************************************************************/
