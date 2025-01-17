/****** Object:  Database [Challenge9b]    Script Date: 08/11/2020 16:56:17 ******/
CREATE DATABASE [Challenge9b]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [Challenge9b] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [Challenge9b] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Challenge9b] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Challenge9b] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Challenge9b] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Challenge9b] SET ARITHABORT OFF 
GO
ALTER DATABASE [Challenge9b] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Challenge9b] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Challenge9b] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Challenge9b] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Challenge9b] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Challenge9b] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Challenge9b] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Challenge9b] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Challenge9b] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [Challenge9b] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Challenge9b] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Challenge9b] SET  MULTI_USER 
GO
ALTER DATABASE [Challenge9b] SET ENCRYPTION ON
GO
ALTER DATABASE [Challenge9b] SET QUERY_STORE = ON
GO
ALTER DATABASE [Challenge9b] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Schema [STG]    Script Date: 08/11/2020 16:56:17 ******/
CREATE SCHEMA [STG]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Client] [nvarchar](50) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MilestoneType]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MilestoneType](
	[MilestoneTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MilestoneType] [nvarchar](50) NULL,
 CONSTRAINT [PK_MilestoneType] PRIMARY KEY CLUSTERED 
(
	[MilestoneTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phase]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phase](
	[PhaseId] [int] IDENTITY(1,1) NOT NULL,
	[Phase] [nvarchar](50) NULL,
	[Progress] [decimal](18, 6) NULL,
 CONSTRAINT [PK_Phase] PRIMARY KEY CLUSTERED 
(
	[PhaseId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhaseResources]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhaseResources](
	[PhaseId] [int] NOT NULL,
	[ResourceId] [int] NOT NULL,
 CONSTRAINT [PK_PhaseResources] PRIMARY KEY CLUSTERED 
(
	[PhaseId] ASC,
	[ResourceId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[WorkRequest] [int] NULL,
	[Title] [varchar](100) NULL,
	[RefreshDate] [date] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAGStatus]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAGStatus](
	[RAGStatusId] [int] IDENTITY(1,1) NOT NULL,
	[RAGStatus] [nchar](10) NULL,
	[RAGStatusScore] [int] NULL,
 CONSTRAINT [PK_RAGStatus] PRIMARY KEY CLUSTERED 
(
	[RAGStatusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resources]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resources](
	[ResourceId] [int] IDENTITY(1,1) NOT NULL,
	[ResourceCode] [nvarchar](100) NULL,
	[ResourceName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskResources]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskResources](
	[TaskId] [int] NOT NULL,
	[ResourceId] [int] NOT NULL,
 CONSTRAINT [PK_TaskResources] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC,
	[ResourceId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[Task] [nvarchar](255) NULL,
	[Progress] [decimal](18, 6) NULL,
	[BaselineStart] [date] NULL,
	[BaselineEnd] [date] NULL,
	[ForecastStart] [date] NULL,
	[ForecastEnd] [date] NULL,
	[ActualStart] [date] NULL,
	[ActualEnd] [date] NULL,
	[IsMilestone] [bit] NULL,
	[MilestoneTypeId] [int] NULL,
	[ClientId] [int] NULL,
	[ProjectId] [int] NULL,
	[PhaseId] [int] NULL,
	[ResourceId] [int] NULL,
	[RefreshDate] [date] NULL,
	[RAGStatusId] [int] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timesheets]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheets](
	[TimesheetId] [int] NOT NULL,
	[RefreshDate] [date] NULL,
	[ProjectId] [int] NULL,
	[PhaseId] [int] NULL,
	[ClientId] [int] NULL,
	[ResourceId] [int] NULL,
	[Period] [date] NULL,
	[Unit] [nchar](10) NULL,
	[Amount] [decimal](18, 6) NULL,
	[Type] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Timesheets] PRIMARY KEY CLUSTERED 
(
	[TimesheetId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[TaskResources]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[TaskResources](
	[TaskId] [int] NOT NULL,
	[ResourceId] [int] NULL,
	[Resource] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[Tasks]    Script Date: 08/11/2020 16:56:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[SourceFilename] [nvarchar](1000) NULL,
	[MilestonePhase] [nchar](10) NULL,
	[MilestoneType] [nchar](10) NULL,
	[Task] [nvarchar](255) NULL,
	[Resources] [nvarchar](50) NULL,
	[Progress] [decimal](18, 6) NULL,
	[Duration] [int] NULL,
	[BaselineStart] [date] NULL,
	[BaselineEnd] [date] NULL,
	[ForecastStart] [date] NULL,
	[ForecastEnd] [date] NULL,
	[ActualStart] [date] NULL,
	[ActualEnd] [date] NULL,
	[IsMilestone] [bit] NULL,
	[Phase] [nvarchar](50) NULL,
	[RAG] [nchar](10) NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Timesheets]  WITH CHECK ADD  CONSTRAINT [FK_Timesheets_Timesheets] FOREIGN KEY([TimesheetId])
REFERENCES [dbo].[Timesheets] ([TimesheetId])
GO
ALTER TABLE [dbo].[Timesheets] CHECK CONSTRAINT [FK_Timesheets_Timesheets]
GO
ALTER DATABASE [Challenge9b] SET  READ_WRITE 
GO
