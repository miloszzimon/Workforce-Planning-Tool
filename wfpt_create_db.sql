USE [master]
GO
/****** Object:  Database [wfpt]    Script Date: 8/06/2017 13:39:42 ******/
CREATE DATABASE [wfpt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wfpt', FILENAME = N'e:\MSSQL\Data\wfpt.mdf' , SIZE = 2048000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 512000KB )
 LOG ON 
( NAME = N'wfpt_log', FILENAME = N'f:\MSSQL\Data\wfpt_log.ldf' , SIZE = 8396800KB , MAXSIZE = 2048GB , FILEGROWTH = 512000KB )
GO
ALTER DATABASE [wfpt] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wfpt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wfpt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wfpt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wfpt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wfpt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wfpt] SET ARITHABORT OFF 
GO
ALTER DATABASE [wfpt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wfpt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wfpt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wfpt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wfpt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wfpt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wfpt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wfpt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wfpt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wfpt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [wfpt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wfpt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wfpt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wfpt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wfpt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wfpt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wfpt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wfpt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [wfpt] SET  MULTI_USER 
GO
ALTER DATABASE [wfpt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wfpt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wfpt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wfpt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [wfpt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'wfpt', N'ON'
GO
ALTER DATABASE [wfpt] SET QUERY_STORE = OFF
GO
USE [wfpt]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [wfpt]
GO
/****** Object:  User [wfpt]    Script Date: 8/06/2017 13:39:43 ******/
CREATE USER [wfpt] FOR LOGIN [wfpt] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [wfpt]
GO
/****** Object:  Table [dbo].[wpt_predict]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_predict](
	[predict_oid] [int] IDENTITY(1,1) NOT NULL,
	[gtt_id] [int] NOT NULL,
	[term_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[student_count_actual] [int] NULL,
	[student_count_potential] [int] NULL,
	[student_count_var] [numeric](18, 0) NULL,
	[student_count_projected] [int] NULL,
	[count_projected_date] [date] NULL,
	[class_size] [int] NULL,
	[class_size_sc] [int] NULL,
	[student_count_actual_date] [date] NULL,
 CONSTRAINT [PK_wpt_gtt_predict] PRIMARY KEY CLUSTERED 
(
	[predict_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_subject]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_subject](
	[subject_oid] [int] IDENTITY(1,1) NOT NULL,
	[subject_code] [varchar](50) NULL,
	[subject_name] [varchar](100) NULL,
	[subject_level] [varchar](50) NULL,
	[subject_type] [varchar](20) NULL,
	[subject_discipline] [varchar](20) NULL,
	[active_yn] [varchar](1) NULL,
 CONSTRAINT [PK_wpt_subject] PRIMARY KEY CLUSTERED 
(
	[subject_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_course]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_course](
	[course_oid] [int] IDENTITY(1,1) NOT NULL,
	[course_code] [varchar](50) NULL,
	[course_name] [varchar](100) NULL,
	[active_yn] [varchar](1) NULL,
 CONSTRAINT [PK_wpt_course] PRIMARY KEY CLUSTERED 
(
	[course_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_term]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_term](
	[term_oid] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[term_year] [varchar](10) NOT NULL,
	[term_code] [varchar](100) NOT NULL,
	[term_admin_date] [date] NULL,
	[term_start_date] [date] NULL,
	[term_end_date] [date] NULL,
	[term_census_date] [date] NULL,
	[term_assessment_date] [date] NULL,
	[term_end_date2] [date] NULL,
	[assessment_release_date] [date] NULL,
 CONSTRAINT [PK_wpt_course_term] PRIMARY KEY CLUSTERED 
(
	[term_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[wpt_predict_view]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[wpt_predict_view]
AS
SELECT ter.term_year, ter.term_code, ter.term_admin_date, ter.term_start_date, ter.term_assessment_date, 
       sub.subject_name, sub.subject_code, cor.course_name, cor.course_code, 
	   pre.predict_oid, pre.gtt_id, pre.term_id, pre.subject_id, pre.course_id, pre.student_count_actual, 
	   pre.student_count_potential, pre.student_count_projected,
	   pre.student_count_var, pre.class_size, pre.class_size_sc, pre.student_count_actual_date
FROM            dbo.wpt_predict AS pre INNER JOIN
                         dbo.wpt_term AS ter ON pre.term_id = ter.term_oid INNER JOIN
                         dbo.wpt_subject AS sub ON pre.subject_id = sub.subject_oid INNER JOIN
                         dbo.wpt_course AS cor ON pre.course_id = cor.course_oid




GO
/****** Object:  Table [dbo].[wpt_predict_propose]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_predict_propose](
	[predict_oid] [int] IDENTITY(1,1) NOT NULL,
	[gtt_id] [int] NOT NULL,
	[term_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[student_count_actual] [int] NULL,
	[student_count_potential] [int] NULL,
	[student_count_var] [numeric](18, 0) NULL,
	[student_count_projected] [int] NULL,
	[count_projected_date] [date] NULL,
	[class_size] [int] NULL,
	[class_size_sc] [int] NULL,
	[student_count_actual_date] [date] NULL,
	[predict_id] [int] NULL,
 CONSTRAINT [PK_wpt_predict_propose] PRIMARY KEY CLUSTERED 
(
	[predict_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[wpt_predict_propose_view]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[wpt_predict_propose_view]
AS
SELECT ter.term_year, ter.term_code, ter.term_admin_date, ter.term_start_date, ter.term_assessment_date, 
       sub.subject_name, sub.subject_code, cor.course_name, cor.course_code, 
	   pre.predict_oid, pre.gtt_id, pre.term_id, pre.subject_id, pre.course_id, pre.student_count_actual, 
	   pre.student_count_potential, pre.student_count_projected,
	   pre.student_count_var, pre.class_size, pre.class_size_sc, pre.student_count_actual_date
FROM            dbo.wpt_predict_propose AS pre INNER JOIN
                         dbo.wpt_term AS ter ON pre.term_id = ter.term_oid INNER JOIN
                         dbo.wpt_subject AS sub ON pre.subject_id = sub.subject_oid INNER JOIN
                         dbo.wpt_course AS cor ON pre.course_id = cor.course_oid






GO
/****** Object:  Table [dbo].[wpt_staff]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_staff](
	[staff_oid] [int] IDENTITY(1,1) NOT NULL,
	[staff_prefix] [varchar](20) NULL,
	[staff_name] [varchar](100) NOT NULL,
	[staff_surname] [varchar](100) NOT NULL,
	[staff_suffix] [varchar](20) NULL,
	[staff_email_work] [varchar](100) NULL,
	[staff_email_home] [varchar](100) NULL,
	[staff_phone] [varchar](100) NULL,
	[staff_campus] [varchar](20) NULL,
	[staff_work_deed] [varchar](20) NULL,
	[staff_induction] [varchar](20) NULL,
	[staff_comment] [varchar](500) NULL,
	[date_joined] [date] NULL,
	[prof_equivalent] [varchar](500) NULL,
	[active_yn] [varchar](1) NULL,
 CONSTRAINT [PK_wpt_staff] PRIMARY KEY CLUSTERED 
(
	[staff_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_provision]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_provision](
	[provision_oid] [int] IDENTITY(1,1) NOT NULL,
	[predict_id] [int] NOT NULL,
	[class_name] [varchar](100) NOT NULL,
	[class_size_provision] [int] NOT NULL,
	[pool_role] [varchar](20) NOT NULL,
	[staff_id] [int] NULL,
	[work_instruction] [varchar](20) NULL,
	[subject_access] [varchar](20) NULL,
	[assessment_date] [date] NULL,
	[assessment_date_received] [date] NULL,
	[assessment_date_release] [date] NULL,
	[subject_feedback] [numeric](10, 4) NULL,
	[active_yn] [varchar](1) NULL,
	[active_yn_date] [date] NULL,
	[class_size_actual] [int] NULL,
	[provision_comment] [varchar](500) NULL,
 CONSTRAINT [PK_wpt_provision] PRIMARY KEY CLUSTERED 
(
	[provision_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[wpt_provision_view]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[wpt_provision_view]
AS
SELECT        pre.term_year, pre.term_code, pre.term_admin_date, pre.term_start_date, pre.term_assessment_date, pre.subject_name, pre.subject_code, pre.course_name, pre.course_code, pre.predict_oid, pre.gtt_id, 
                         pre.term_id, pre.subject_id, pre.course_id, pre.student_count_actual, pre.student_count_potential, pre.student_count_projected, pre.student_count_var, pre.class_size, pre.class_size_sc, pro.provision_oid, 
                         pro.predict_id, pro.class_name, pro.class_size_provision, pro.pool_role, pro.staff_id, pro.work_instruction, pro.subject_access, pro.assessment_date, pro.assessment_date_received, 
                         pro.assessment_date_release, pro.subject_feedback, pro.active_yn, pro.active_yn_date, pro.class_size_actual, sta.staff_oid, sta.staff_name, sta.staff_surname,
						 pro.provision_comment
FROM            dbo.wpt_provision AS pro INNER JOIN
                         dbo.wpt_predict_view AS pre ON pre.predict_oid = pro.predict_id LEFT OUTER JOIN
                         dbo.wpt_staff AS sta ON pro.staff_id = sta.staff_oid


GO
/****** Object:  Table [dbo].[code_detail]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[code_detail](
	[code_type] [varchar](20) NOT NULL,
	[code] [varchar](20) NOT NULL,
	[code_desc] [varchar](100) NOT NULL,
	[code_seq] [int] NOT NULL,
 CONSTRAINT [PK_code_detail] PRIMARY KEY CLUSTERED 
(
	[code_type] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[code_head]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[code_head](
	[code_type] [varchar](20) NOT NULL,
	[code_type_desc] [varchar](100) NOT NULL,
 CONSTRAINT [PK_code_head] PRIMARY KEY CLUSTERED 
(
	[code_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[fact_StudentEnrolmentAll]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_StudentEnrolmentAll](
	[AIBStudentID] [varchar](15) NOT NULL,
	[StudentID] [int] NOT NULL,
	[EnrolmentID] [bigint] NOT NULL,
	[StudentCourseID] [bigint] NULL,
	[CourseCode] [varchar](100) NULL,
	[CourseName] [varchar](500) NULL,
	[CourseStatus] [varchar](50) NULL,
	[Active] [bit] NULL,
	[IsProject] [bit] NULL,
	[HasWWPApproved] [bit] NULL,
	[SubjectInstanceID] [bigint] NULL,
	[SubjectInstanceCode] [varchar](50) NULL,
	[ParentSubjectID] [bigint] NULL,
	[ParentSubjectCode] [varchar](50) NULL,
	[EnrolmentActionType] [varchar](100) NULL,
	[SubjectInstanceStartDate] [datetime] NULL,
	[SubjectInstanceEndDate] [datetime] NULL,
	[SubjectInstanceName] [varchar](100) NULL,
	[SubjectInstanceExamDate] [datetime] NULL,
	[TeachingCentreID] [bigint] NULL,
	[TeachingCentreCode] [varchar](50) NULL,
	[TeachingCentreName] [varchar](100) NULL,
	[GradeID] [bigint] NULL,
	[GradeCode] [varchar](50) NULL,
	[Grade] [varchar](50) NULL,
	[EnrolmentIndex] [bigint] NULL,
	[EnrolmentFundingSource] [varchar](200) NULL,
	[SequenceIndex] [bigint] NULL,
	[ProgressIndex] [bigint] NULL,
	[CreatedDateTime] [datetime] NULL,
	[IsParticipated] [bit] NULL,
	[IsPassed] [bit] NULL,
	[IsComplete] [bit] NULL,
	[IsAttempted] [bit] NULL,
	[IsExemption] [bit] NULL,
	[IsTransferred] [bit] NULL,
	[IsLastTransfer] [bit] NULL,
	[IsOriginOfTransfer] [bit] NULL,
	[TEQSAFundingSourceID] [int] NULL,
	[TEQSAFundingSource] [varchar](200) NULL,
	[ProvisionalGradeID] [int] NULL,
	[ProvisionalGrade] [varchar](200) NULL,
	[ProvisionalGradeCode] [varchar](100) NULL,
	[Mark] [varchar](50) NULL,
	[ProvisionalMark] [varchar](50) NULL,
	[ProvisionalIsPassed] [bit] NULL,
	[IsPendingAssessment] [bit] NULL,
	[EFTSL] [real] NULL,
	[PassedEFTSL] [real] NULL,
	[FailedEFTSL] [real] NULL,
	[WithdrawnEFTSL] [real] NULL,
	[OtherEFTSL] [real] NULL,
	[IndeterminableEFTSL] [real] NULL,
	[EnrolmentCensusDate] [datetime] NULL,
	[GradeEffectiveDate] [datetime] NULL,
	[ExamOrEndDate] [datetime] NULL,
	[GradeStatus] [varchar](50) NULL,
	[IsFirstSubject] [bit] NULL,
	[OriginalEnrolmentID] [int] NULL,
	[OriginalActionID] [int] NULL,
	[OriginalCodeActionType] [varchar](50) NULL,
	[ActionID] [int] NULL,
	[TransferEnrolmentID] [int] NULL,
	[ReportableProgrammeID] [int] NULL,
	[SubjectInstanceTypeCode] [varchar](50) NULL,
	[SubjectInstanceType] [varchar](200) NULL,
	[IsAsStudied] [bit] NULL,
	[Cost] [float] NULL,
	[FeeSetName] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_available]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_available](
	[av_oid] [int] IDENTITY(1,1) NOT NULL,
	[av_code] [varchar](20) NOT NULL,
	[av_desc] [varchar](100) NOT NULL,
	[av_count] [int] NOT NULL,
	[active_yn] [varchar](1) NULL,
 CONSTRAINT [PK_wpt_available] PRIMARY KEY CLUSTERED 
(
	[av_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_course_subject]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_course_subject](
	[course_subject_oid] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
 CONSTRAINT [PK_wpt_course_subject] PRIMARY KEY CLUSTERED 
(
	[course_subject_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_enrolment_proposal]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_enrolment_proposal](
	[enrolment_oid] [int] IDENTITY(1,1) NOT NULL,
	[term_admin_date] [date] NOT NULL,
	[subject_code] [varchar](50) NOT NULL,
	[student_name] [varchar](100) NOT NULL,
	[enrolment_type] [varchar](50) NULL,
	[student_id] [varchar](50) NULL,
	[stage_type] [varchar](100) NULL,
	[enrolment_category] [varchar](100) NULL,
	[specialisation] [varchar](100) NULL,
	[insert_date] [date] NULL,
 CONSTRAINT [PK_wpt_enrolment_proposal] PRIMARY KEY CLUSTERED 
(
	[enrolment_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_gtt]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_gtt](
	[gtt_oid] [int] IDENTITY(1,1) NOT NULL,
	[term_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[course_subject_id] [int] NOT NULL,
 CONSTRAINT [PK_wpt_gtt] PRIMARY KEY CLUSTERED 
(
	[gtt_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_staff_experience]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_staff_experience](
	[staff_experience_oid] [int] IDENTITY(1,1) NOT NULL,
	[staff_id] [int] NOT NULL,
	[experience_type] [varchar](20) NOT NULL,
	[experience_duration] [varchar](1000) NULL,
	[experience_title] [varchar](1000) NULL,
	[organisation_name] [varchar](1000) NULL,
	[experience_rank] [int] NULL,
 CONSTRAINT [PK_wpt_staff_experience] PRIMARY KEY CLUSTERED 
(
	[staff_experience_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_staff_file]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_staff_file](
	[staff_file_oid] [int] IDENTITY(1,1) NOT NULL,
	[staff_id] [int] NOT NULL,
	[file_received_date] [date] NULL,
	[file_uploaded_date] [date] NULL,
	[file_name] [varchar](100) NULL,
	[file_desc] [varchar](200) NULL,
	[file_blob] [varbinary](max) NULL,
 CONSTRAINT [PK_wpt_staff_file] PRIMARY KEY CLUSTERED 
(
	[staff_file_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_staff_qualification]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_staff_qualification](
	[staff_course_oid] [int] IDENTITY(1,1) NOT NULL,
	[staff_id] [int] NOT NULL,
	[course_name] [varchar](100) NULL,
	[course_type] [varchar](20) NULL,
	[course_discipline] [varchar](1000) NULL,
	[course_institution] [varchar](1000) NULL,
	[course_year] [varchar](100) NULL,
	[course_rank] [int] NULL,
 CONSTRAINT [PK_wpt_staff_qualification] PRIMARY KEY CLUSTERED 
(
	[staff_course_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_staff_subject]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_staff_subject](
	[staff_subject_oid] [int] IDENTITY(1,1) NOT NULL,
	[staff_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[pool_role] [varchar](20) NOT NULL,
	[pool_rank] [varchar](20) NULL,
	[pool_feedback] [varchar](500) NULL,
	[pool_comment] [varchar](1000) NULL,
	[subject_verify] [varchar](1000) NULL,
 CONSTRAINT [PK_wpt_staff_subject] PRIMARY KEY CLUSTERED 
(
	[staff_subject_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wpt_staff_term]    Script Date: 8/06/2017 13:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wpt_staff_term](
	[staff_term_oid] [int] IDENTITY(1,1) NOT NULL,
	[staff_id] [int] NOT NULL,
	[term_id] [int] NOT NULL,
	[staff_term_status] [varchar](20) NULL,
 CONSTRAINT [PK_wpt_staff_term] PRIMARY KEY CLUSTERED 
(
	[staff_term_oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [UK_course_subject]    Script Date: 8/06/2017 13:39:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_course_subject] ON [dbo].[wpt_course_subject]
(
	[course_id] ASC,
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_WPT_GTT]    Script Date: 8/06/2017 13:39:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_WPT_GTT] ON [dbo].[wpt_gtt]
(
	[term_id] ASC,
	[subject_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_staff_subject_role]    Script Date: 8/06/2017 13:39:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_staff_subject_role] ON [dbo].[wpt_staff_subject]
(
	[staff_id] ASC,
	[subject_id] ASC,
	[pool_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_wpt_staff_term]    Script Date: 8/06/2017 13:39:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_wpt_staff_term] ON [dbo].[wpt_staff_term]
(
	[staff_id] ASC,
	[term_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_wpt_term_course_code_year]    Script Date: 8/06/2017 13:39:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_wpt_term_course_code_year] ON [dbo].[wpt_term]
(
	[term_year] ASC,
	[term_code] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[code_detail]  WITH CHECK ADD  CONSTRAINT [FK_code_detail_code_head] FOREIGN KEY([code_type])
REFERENCES [dbo].[code_head] ([code_type])
GO
ALTER TABLE [dbo].[code_detail] CHECK CONSTRAINT [FK_code_detail_code_head]
GO
ALTER TABLE [dbo].[wpt_course_subject]  WITH CHECK ADD  CONSTRAINT [FK_wpt_course_subject_course] FOREIGN KEY([course_id])
REFERENCES [dbo].[wpt_course] ([course_oid])
GO
ALTER TABLE [dbo].[wpt_course_subject] CHECK CONSTRAINT [FK_wpt_course_subject_course]
GO
ALTER TABLE [dbo].[wpt_course_subject]  WITH CHECK ADD  CONSTRAINT [FK_wpt_course_subject_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[wpt_subject] ([subject_oid])
GO
ALTER TABLE [dbo].[wpt_course_subject] CHECK CONSTRAINT [FK_wpt_course_subject_subject]
GO
ALTER TABLE [dbo].[wpt_gtt]  WITH CHECK ADD  CONSTRAINT [FK_wpt_gtt_course_subject] FOREIGN KEY([course_subject_id])
REFERENCES [dbo].[wpt_course_subject] ([course_subject_oid])
GO
ALTER TABLE [dbo].[wpt_gtt] CHECK CONSTRAINT [FK_wpt_gtt_course_subject]
GO
ALTER TABLE [dbo].[wpt_gtt]  WITH CHECK ADD  CONSTRAINT [FK_wpt_gtt_term] FOREIGN KEY([term_id])
REFERENCES [dbo].[wpt_term] ([term_oid])
GO
ALTER TABLE [dbo].[wpt_gtt] CHECK CONSTRAINT [FK_wpt_gtt_term]
GO
ALTER TABLE [dbo].[wpt_provision]  WITH CHECK ADD  CONSTRAINT [FK_wpt_provision_predict] FOREIGN KEY([predict_id])
REFERENCES [dbo].[wpt_predict] ([predict_oid])
GO
ALTER TABLE [dbo].[wpt_provision] CHECK CONSTRAINT [FK_wpt_provision_predict]
GO
ALTER TABLE [dbo].[wpt_provision]  WITH CHECK ADD  CONSTRAINT [FK_wpt_provision_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[wpt_staff] ([staff_oid])
GO
ALTER TABLE [dbo].[wpt_provision] CHECK CONSTRAINT [FK_wpt_provision_staff]
GO
ALTER TABLE [dbo].[wpt_staff_experience]  WITH CHECK ADD  CONSTRAINT [FK_wpt_staff_experience] FOREIGN KEY([staff_id])
REFERENCES [dbo].[wpt_staff] ([staff_oid])
GO
ALTER TABLE [dbo].[wpt_staff_experience] CHECK CONSTRAINT [FK_wpt_staff_experience]
GO
ALTER TABLE [dbo].[wpt_staff_file]  WITH CHECK ADD  CONSTRAINT [FK_wpt_staff_file_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[wpt_staff] ([staff_oid])
GO
ALTER TABLE [dbo].[wpt_staff_file] CHECK CONSTRAINT [FK_wpt_staff_file_staff]
GO
ALTER TABLE [dbo].[wpt_staff_qualification]  WITH CHECK ADD  CONSTRAINT [FK_wpt_staff_qualification] FOREIGN KEY([staff_id])
REFERENCES [dbo].[wpt_staff] ([staff_oid])
GO
ALTER TABLE [dbo].[wpt_staff_qualification] CHECK CONSTRAINT [FK_wpt_staff_qualification]
GO
ALTER TABLE [dbo].[wpt_staff_subject]  WITH CHECK ADD  CONSTRAINT [FK_wpt_staff_subject_staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[wpt_staff] ([staff_oid])
GO
ALTER TABLE [dbo].[wpt_staff_subject] CHECK CONSTRAINT [FK_wpt_staff_subject_staff]
GO
ALTER TABLE [dbo].[wpt_staff_subject]  WITH CHECK ADD  CONSTRAINT [FK_wpt_staff_subject_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[wpt_subject] ([subject_oid])
GO
ALTER TABLE [dbo].[wpt_staff_subject] CHECK CONSTRAINT [FK_wpt_staff_subject_subject]
GO
ALTER TABLE [dbo].[wpt_staff_term]  WITH CHECK ADD  CONSTRAINT [FK_wpt_staff_term__staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[wpt_staff] ([staff_oid])
GO
ALTER TABLE [dbo].[wpt_staff_term] CHECK CONSTRAINT [FK_wpt_staff_term__staff]
GO
ALTER TABLE [dbo].[wpt_staff_term]  WITH CHECK ADD  CONSTRAINT [FK_wpt_staff_term__term] FOREIGN KEY([term_id])
REFERENCES [dbo].[wpt_term] ([term_oid])
GO
ALTER TABLE [dbo].[wpt_staff_term] CHECK CONSTRAINT [FK_wpt_staff_term__term]
GO
ALTER TABLE [dbo].[wpt_term]  WITH CHECK ADD  CONSTRAINT [FK_wpt_course_term] FOREIGN KEY([course_id])
REFERENCES [dbo].[wpt_course] ([course_oid])
GO
ALTER TABLE [dbo].[wpt_term] CHECK CONSTRAINT [FK_wpt_course_term]
GO
USE [master]
GO
ALTER DATABASE [wfpt] SET  READ_WRITE 
GO
