
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/05/2020 12:25:40
-- Generated from EDMX file: C:\OSPanel\domains\ISPDnWeb\WebServiseISPDN\WebApplicationISPDn\ModelISPDn.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ISPDnBDSQL];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CeliObrabotkiPD_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CeliObrabotkiPD] DROP CONSTRAINT [FK_CeliObrabotkiPD_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_ISPDnHarakteristikIshod_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ISPDnHarakteristikIshod] DROP CONSTRAINT [FK_ISPDnHarakteristikIshod_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_ISPDnOperator_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ISPDnOperator] DROP CONSTRAINT [FK_ISPDnOperator_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_ISPDnOperator_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ISPDnOperator] DROP CONSTRAINT [FK_ISPDnOperator_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_ISPDnOperator_FK02]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ISPDnOperator] DROP CONSTRAINT [FK_ISPDnOperator_FK02];
GO
IF OBJECT_ID(N'[dbo].[FK_ISPDnOperator_FK03]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ISPDnOperator] DROP CONSTRAINT [FK_ISPDnOperator_FK03];
GO
IF OBJECT_ID(N'[dbo].[FK_ISPDnOperator_FK04]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ISPDnOperator] DROP CONSTRAINT [FK_ISPDnOperator_FK04];
GO
IF OBJECT_ID(N'[dbo].[FK_ISPDnOperator_FK05]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ISPDnOperator] DROP CONSTRAINT [FK_ISPDnOperator_FK05];
GO
IF OBJECT_ID(N'[dbo].[FK_KategoryPdBio_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KategoryPdBio] DROP CONSTRAINT [FK_KategoryPdBio_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_KategoryPdDop_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KategoryPdDop] DROP CONSTRAINT [FK_KategoryPdDop_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_KategorySubj_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KategorySubj] DROP CONSTRAINT [FK_KategorySubj_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieCeliObrabotkiISPDn_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieCeliObrabotkiISPDn] DROP CONSTRAINT [FK_MnogieCeliObrabotkiISPDn_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieCeliObrabotkiISPDn_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieCeliObrabotkiISPDn] DROP CONSTRAINT [FK_MnogieCeliObrabotkiISPDn_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieCeliOtdel_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieCeliOtdel] DROP CONSTRAINT [FK_MnogieCeliOtdel_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieCeliOtdel_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieCeliOtdel] DROP CONSTRAINT [FK_MnogieCeliOtdel_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieHarakteristikiIshod_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieHarakteristikiIshod] DROP CONSTRAINT [FK_MnogieHarakteristikiIshod_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieHarakteristikiIshod_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieHarakteristikiIshod] DROP CONSTRAINT [FK_MnogieHarakteristikiIshod_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieISPDnKategoryPD_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieISPDnKategoryPD] DROP CONSTRAINT [FK_MnogieISPDnKategoryPD_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieISPDnKategoryPD_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieISPDnKategoryPD] DROP CONSTRAINT [FK_MnogieISPDnKategoryPD_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieISPDnRabotniki_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieISPDnRabotniki] DROP CONSTRAINT [FK_MnogieISPDnRabotniki_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieISPDnRabotniki_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieISPDnRabotniki] DROP CONSTRAINT [FK_MnogieISPDnRabotniki_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieISPDnSubj_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieISPDnSubj] DROP CONSTRAINT [FK_MnogieISPDnSubj_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieISPDnSubj_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieISPDnSubj] DROP CONSTRAINT [FK_MnogieISPDnSubj_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoriSpecOtdel_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoriSpecOtdel] DROP CONSTRAINT [FK_MnogieKategoriSpecOtdel_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoriSpecOtdel_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoriSpecOtdel] DROP CONSTRAINT [FK_MnogieKategoriSpecOtdel_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryBioOtdel_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryBioOtdel] DROP CONSTRAINT [FK_MnogieKategoryBioOtdel_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryBioOtdel_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryBioOtdel] DROP CONSTRAINT [FK_MnogieKategoryBioOtdel_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryDopOtdel_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryDopOtdel] DROP CONSTRAINT [FK_MnogieKategoryDopOtdel_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryDopOtdel_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryDopOtdel] DROP CONSTRAINT [FK_MnogieKategoryDopOtdel_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryPdBioISPDn_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryPdBioISPDn] DROP CONSTRAINT [FK_MnogieKategoryPdBioISPDn_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryPdBioISPDn_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryPdBioISPDn] DROP CONSTRAINT [FK_MnogieKategoryPdBioISPDn_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryPdDopISPDn_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryPdDopISPDn] DROP CONSTRAINT [FK_MnogieKategoryPdDopISPDn_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryPdDopISPDn_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryPdDopISPDn] DROP CONSTRAINT [FK_MnogieKategoryPdDopISPDn_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryPdOtdel_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryPdOtdel] DROP CONSTRAINT [FK_MnogieKategoryPdOtdel_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryPdOtdel_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryPdOtdel] DROP CONSTRAINT [FK_MnogieKategoryPdOtdel_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryPdSpecISPDn_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryPdSpecISPDn] DROP CONSTRAINT [FK_MnogieKategoryPdSpecISPDn_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieKategoryPdSpecISPDn_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieKategoryPdSpecISPDn] DROP CONSTRAINT [FK_MnogieKategoryPdSpecISPDn_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieOpasnUgrozIS_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieOpasnUgrozIS] DROP CONSTRAINT [FK_MnogieOpasnUgrozIS_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieOpasnUgrozIS_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieOpasnUgrozIS] DROP CONSTRAINT [FK_MnogieOpasnUgrozIS_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieOpasnUgrozIS_FK02]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieOpasnUgrozIS] DROP CONSTRAINT [FK_MnogieOpasnUgrozIS_FK02];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieOtdelSubj_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieOtdelSubj] DROP CONSTRAINT [FK_MnogieOtdelSubj_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieOtdelSubj_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieOtdelSubj] DROP CONSTRAINT [FK_MnogieOtdelSubj_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieRabotnikiOtdel_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieRabotnikiOtdel] DROP CONSTRAINT [FK_MnogieRabotnikiOtdel_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieRabotnikiOtdel_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieRabotnikiOtdel] DROP CONSTRAINT [FK_MnogieRabotnikiOtdel_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieRealizUgroz_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieRealizUgroz] DROP CONSTRAINT [FK_MnogieRealizUgroz_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieRealizUgroz_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieRealizUgroz] DROP CONSTRAINT [FK_MnogieRealizUgroz_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieRealizUgroz_FK02]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieRealizUgroz] DROP CONSTRAINT [FK_MnogieRealizUgroz_FK02];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieUgrozaActual_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieUgrozaActual] DROP CONSTRAINT [FK_MnogieUgrozaActual_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieUgrozaActual_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieUgrozaActual] DROP CONSTRAINT [FK_MnogieUgrozaActual_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieUgrozaActual_FK02]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieUgrozaActual] DROP CONSTRAINT [FK_MnogieUgrozaActual_FK02];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieVerUgrozIS_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieVerUgrozIS] DROP CONSTRAINT [FK_MnogieVerUgrozIS_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieVerUgrozIS_FK01]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieVerUgrozIS] DROP CONSTRAINT [FK_MnogieVerUgrozIS_FK01];
GO
IF OBJECT_ID(N'[dbo].[FK_MnogieVerUgrozIS_FK02]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MnogieVerUgrozIS] DROP CONSTRAINT [FK_MnogieVerUgrozIS_FK02];
GO
IF OBJECT_ID(N'[dbo].[FK_NazvanieUgroz_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NazvanieUgroz] DROP CONSTRAINT [FK_NazvanieUgroz_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_OtdelOrg_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OtdelOrg] DROP CONSTRAINT [FK_OtdelOrg_FK00];
GO
IF OBJECT_ID(N'[dbo].[FK_RabotnikiOrg_FK00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RabotnikiOrg] DROP CONSTRAINT [FK_RabotnikiOrg_FK00];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Actualnost]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Actualnost];
GO
IF OBJECT_ID(N'[dbo].[CeliObrabotkiPD]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CeliObrabotkiPD];
GO
IF OBJECT_ID(N'[dbo].[ISPDnHarakteristikIshod]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ISPDnHarakteristikIshod];
GO
IF OBJECT_ID(N'[dbo].[ISPDnIshodZashita]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ISPDnIshodZashita];
GO
IF OBJECT_ID(N'[dbo].[ISPDnKategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ISPDnKategory];
GO
IF OBJECT_ID(N'[dbo].[ISPDnKlass]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ISPDnKlass];
GO
IF OBJECT_ID(N'[dbo].[ISPDnObem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ISPDnObem];
GO
IF OBJECT_ID(N'[dbo].[ISPDnOperator]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ISPDnOperator];
GO
IF OBJECT_ID(N'[dbo].[ISPDnTipSpecial]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ISPDnTipSpecial];
GO
IF OBJECT_ID(N'[dbo].[KategoryPd]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KategoryPd];
GO
IF OBJECT_ID(N'[dbo].[KategoryPdBio]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KategoryPdBio];
GO
IF OBJECT_ID(N'[dbo].[KategoryPdDop]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KategoryPdDop];
GO
IF OBJECT_ID(N'[dbo].[KategoryPdSpec]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KategoryPdSpec];
GO
IF OBJECT_ID(N'[dbo].[KategorySubj]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KategorySubj];
GO
IF OBJECT_ID(N'[dbo].[MnogieCeliObrabotkiISPDn]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieCeliObrabotkiISPDn];
GO
IF OBJECT_ID(N'[dbo].[MnogieCeliOtdel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieCeliOtdel];
GO
IF OBJECT_ID(N'[dbo].[MnogieHarakteristikiIshod]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieHarakteristikiIshod];
GO
IF OBJECT_ID(N'[dbo].[MnogieISPDnKategoryPD]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieISPDnKategoryPD];
GO
IF OBJECT_ID(N'[dbo].[MnogieISPDnRabotniki]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieISPDnRabotniki];
GO
IF OBJECT_ID(N'[dbo].[MnogieISPDnSubj]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieISPDnSubj];
GO
IF OBJECT_ID(N'[dbo].[MnogieKategoriSpecOtdel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieKategoriSpecOtdel];
GO
IF OBJECT_ID(N'[dbo].[MnogieKategoryBioOtdel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieKategoryBioOtdel];
GO
IF OBJECT_ID(N'[dbo].[MnogieKategoryDopOtdel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieKategoryDopOtdel];
GO
IF OBJECT_ID(N'[dbo].[MnogieKategoryPdBioISPDn]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieKategoryPdBioISPDn];
GO
IF OBJECT_ID(N'[dbo].[MnogieKategoryPdDopISPDn]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieKategoryPdDopISPDn];
GO
IF OBJECT_ID(N'[dbo].[MnogieKategoryPdOtdel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieKategoryPdOtdel];
GO
IF OBJECT_ID(N'[dbo].[MnogieKategoryPdSpecISPDn]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieKategoryPdSpecISPDn];
GO
IF OBJECT_ID(N'[dbo].[MnogieOpasnUgrozIS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieOpasnUgrozIS];
GO
IF OBJECT_ID(N'[dbo].[MnogieOtdelSubj]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieOtdelSubj];
GO
IF OBJECT_ID(N'[dbo].[MnogieRabotnikiOtdel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieRabotnikiOtdel];
GO
IF OBJECT_ID(N'[dbo].[MnogieRealizUgroz]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieRealizUgroz];
GO
IF OBJECT_ID(N'[dbo].[MnogieUgrozaActual]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieUgrozaActual];
GO
IF OBJECT_ID(N'[dbo].[MnogieVerUgrozIS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MnogieVerUgrozIS];
GO
IF OBJECT_ID(N'[dbo].[NazvanieUgroz]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NazvanieUgroz];
GO
IF OBJECT_ID(N'[dbo].[OpasnostUgroz]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OpasnostUgroz];
GO
IF OBJECT_ID(N'[dbo].[OrgOperator]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrgOperator];
GO
IF OBJECT_ID(N'[dbo].[OtdelOrg]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OtdelOrg];
GO
IF OBJECT_ID(N'[dbo].[RabotnikiOrg]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RabotnikiOrg];
GO
IF OBJECT_ID(N'[dbo].[RealizationUgroz]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RealizationUgroz];
GO
IF OBJECT_ID(N'[dbo].[VeroyatnostUgroz]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VeroyatnostUgroz];
GO
IF OBJECT_ID(N'[dbo].[VidIshodHarakteristik]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VidIshodHarakteristik];
GO
IF OBJECT_ID(N'[dbo].[VidUgroz]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VidUgroz];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Actualnost'
CREATE TABLE [dbo].[Actualnost] (
    [ActualnostID] int IDENTITY(1,1) NOT NULL,
    [ActualnostName] nvarchar(255)  NULL
);
GO

-- Creating table 'CeliObrabotkiPD'
CREATE TABLE [dbo].[CeliObrabotkiPD] (
    [CeliObrabotkiPDID] int IDENTITY(1,1) NOT NULL,
    [CeliObrabotkiName] nvarchar(255)  NULL,
    [CeliObrabotkiSelect] bit  NOT NULL,
    [OrgOperatorID] int  NULL
);
GO

-- Creating table 'ISPDnHarakteristikIshod'
CREATE TABLE [dbo].[ISPDnHarakteristikIshod] (
    [ISPDnHarakteristikIshodID] int IDENTITY(1,1) NOT NULL,
    [ISPDnHarakteristikIshodName] nvarchar(255)  NULL,
    [VidIshodHarakteristikID] int  NULL
);
GO

-- Creating table 'ISPDnIshodZashita'
CREATE TABLE [dbo].[ISPDnIshodZashita] (
    [ISPDnIshodZashitaID] int IDENTITY(1,1) NOT NULL,
    [ISPDnIshodZashitaName] nvarchar(255)  NULL,
    [IshodKofY1] int  NULL
);
GO

-- Creating table 'ISPDnKategory'
CREATE TABLE [dbo].[ISPDnKategory] (
    [ISPDnKategoryID] int IDENTITY(1,1) NOT NULL,
    [ISPDnKategoryName] nvarchar(255)  NULL,
    [ISPDnKategoryOpisanie] nvarchar(max)  NULL
);
GO

-- Creating table 'ISPDnKlass'
CREATE TABLE [dbo].[ISPDnKlass] (
    [ISPDnKlassID] int IDENTITY(1,1) NOT NULL,
    [ISPDnPrisvoenKlass] nvarchar(255)  NULL,
    [OpisanieKlass] nvarchar(255)  NULL
);
GO

-- Creating table 'ISPDnObem'
CREATE TABLE [dbo].[ISPDnObem] (
    [ISPDnObemID] int IDENTITY(1,1) NOT NULL,
    [ISPDnObemOpisanie] nvarchar(max)  NULL
);
GO

-- Creating table 'ISPDnOperator'
CREATE TABLE [dbo].[ISPDnOperator] (
    [ISPDnOperatorID] int IDENTITY(1,1) NOT NULL,
    [ISPDnOperatorName] nvarchar(255)  NULL,
    [OrgOperatorID] int  NULL,
    [ISPDnKategoryID] int  NULL,
    [ISPDnObemID] int  NULL,
    [ISPDnKlassID] int  NULL,
    [ISPDnIshodZashitaID] int  NULL,
    [ISPDnTipSpecialID] int  NULL,
    [ISPDnTipModeli] int  NULL
);
GO

-- Creating table 'ISPDnTipSpecial'
CREATE TABLE [dbo].[ISPDnTipSpecial] (
    [ISPDnTipSpecialID] int IDENTITY(1,1) NOT NULL,
    [ISPDnTipSpecialName] nvarchar(255)  NULL,
    [ISPDnTipSpecialOpisanie] nvarchar(max)  NULL
);
GO

-- Creating table 'KategoryPd'
CREATE TABLE [dbo].[KategoryPd] (
    [KategoryPdID] int IDENTITY(1,1) NOT NULL,
    [KategoryPdName] nvarchar(255)  NULL
);
GO

-- Creating table 'KategoryPdBio'
CREATE TABLE [dbo].[KategoryPdBio] (
    [KategoryPdBioID] int IDENTITY(1,1) NOT NULL,
    [KategoryPdBioName] nvarchar(255)  NULL,
    [OrgOperatorID] int  NULL,
    [KategoryPdBioSelect] bit  NOT NULL
);
GO

-- Creating table 'KategoryPdDop'
CREATE TABLE [dbo].[KategoryPdDop] (
    [KategoryPdDopID] int IDENTITY(1,1) NOT NULL,
    [KategoryPdDopName] nvarchar(255)  NULL,
    [KategoryPdDopSelect] bit  NOT NULL,
    [OrgOperatorID] int  NULL
);
GO

-- Creating table 'KategoryPdSpec'
CREATE TABLE [dbo].[KategoryPdSpec] (
    [KategoryPdSpecID] int IDENTITY(1,1) NOT NULL,
    [KategoryPdSpecName] nvarchar(255)  NULL
);
GO

-- Creating table 'KategorySubj'
CREATE TABLE [dbo].[KategorySubj] (
    [KategorySubjID] int IDENTITY(1,1) NOT NULL,
    [KategorySubjName] nvarchar(255)  NULL,
    [KategorySubjSelect] bit  NOT NULL,
    [OrgOperatorID] int  NULL
);
GO

-- Creating table 'MnogieISPDnSubj'
CREATE TABLE [dbo].[MnogieISPDnSubj] (
    [KategorySubjID] int  NOT NULL,
    [ISPDnOperatorID] int  NOT NULL,
    [MnogISPDnSubj] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'MnogieOpasnUgrozIS'
CREATE TABLE [dbo].[MnogieOpasnUgrozIS] (
    [NazvanieUgrozID] int  NOT NULL,
    [ISPDnOperatorID] int  NOT NULL,
    [OpasnostUgrozID] int  NULL
);
GO

-- Creating table 'MnogieRealizUgroz'
CREATE TABLE [dbo].[MnogieRealizUgroz] (
    [RealizationUgrozID] int  NULL,
    [ISPDnOperatorID] int  NOT NULL,
    [NazvanieUgrozID] int  NOT NULL,
    [KofRealization] nvarchar(255)  NULL
);
GO

-- Creating table 'MnogieUgrozaActual'
CREATE TABLE [dbo].[MnogieUgrozaActual] (
    [NazvanieUgrozID] int  NOT NULL,
    [ISPDnOperatorID] int  NOT NULL,
    [ActualnostID] int  NULL
);
GO

-- Creating table 'MnogieVerUgrozIS'
CREATE TABLE [dbo].[MnogieVerUgrozIS] (
    [NazvanieUgrozID] int  NOT NULL,
    [ISPDnOperatorID] int  NOT NULL,
    [VeroyatnostUgrozID] int  NULL
);
GO

-- Creating table 'NazvanieUgroz'
CREATE TABLE [dbo].[NazvanieUgroz] (
    [NazvanieUgrozID] int IDENTITY(1,1) NOT NULL,
    [NazvanieUgrozName] nvarchar(max)  NULL,
    [VidUgrozID] int  NULL,
    [C1] bit  NOT NULL,
    [C2] bit  NOT NULL,
    [C3] bit  NOT NULL,
    [C4] bit  NOT NULL
);
GO

-- Creating table 'OpasnostUgroz'
CREATE TABLE [dbo].[OpasnostUgroz] (
    [OpasnostUgrozID] int IDENTITY(1,1) NOT NULL,
    [OpasnostUgrozName] nvarchar(255)  NULL
);
GO

-- Creating table 'OrgOperator'
CREATE TABLE [dbo].[OrgOperator] (
    [OrgOperatorID] int IDENTITY(1,1) NOT NULL,
    [OrgOperatorKratkName] nvarchar(255)  NULL,
    [OrgOperatorFullName] nvarchar(255)  NULL,
    [OrgOperatorINN] nvarchar(255)  NULL,
    [OrgOperatorRukovoditelName] nvarchar(255)  NULL,
    [OrgOperatorRukovoditelDolgn] nvarchar(255)  NULL,
    [OrgOperatorAdress] nvarchar(255)  NULL,
    [UserID] nvarchar(50)  NULL
);
GO

-- Creating table 'OtdelOrg'
CREATE TABLE [dbo].[OtdelOrg] (
    [OtdelOrgID] int IDENTITY(1,1) NOT NULL,
    [OtdelOrgName] nvarchar(255)  NULL,
    [OrgOperatorID] int  NULL
);
GO

-- Creating table 'RabotnikiOrg'
CREATE TABLE [dbo].[RabotnikiOrg] (
    [RabotnikiOrgID] int IDENTITY(1,1) NOT NULL,
    [RabotnikiOrgFio] nvarchar(255)  NULL,
    [RabotnikiOrgDolgn] nvarchar(255)  NULL,
    [RabotnikiOrgSelect] bit  NOT NULL,
    [OrgOperatorID] int  NULL
);
GO

-- Creating table 'RealizationUgroz'
CREATE TABLE [dbo].[RealizationUgroz] (
    [RealizationUgrozID] int IDENTITY(1,1) NOT NULL,
    [RealizationUgrozName] nvarchar(255)  NULL,
    [RealizationUgrozKof] int  NULL
);
GO

-- Creating table 'VeroyatnostUgroz'
CREATE TABLE [dbo].[VeroyatnostUgroz] (
    [VeroyatnostUgrozID] int IDENTITY(1,1) NOT NULL,
    [VeroyatnostUgrozName] nvarchar(255)  NULL,
    [OpisanieVeroyatnosti] nvarchar(max)  NULL,
    [VeroyantnKofY2] int  NULL
);
GO

-- Creating table 'VidIshodHarakteristik'
CREATE TABLE [dbo].[VidIshodHarakteristik] (
    [VidIshodHarakteristikID] int IDENTITY(1,1) NOT NULL,
    [VidIshodHarakteristikName] nvarchar(255)  NULL
);
GO

-- Creating table 'VidUgroz'
CREATE TABLE [dbo].[VidUgroz] (
    [VidUgrozID] int IDENTITY(1,1) NOT NULL,
    [VidUgrozName] nvarchar(255)  NULL
);
GO

-- Creating table 'MnogieCeliObrabotkiISPDn'
CREATE TABLE [dbo].[MnogieCeliObrabotkiISPDn] (
    [CeliObrabotkiPD_CeliObrabotkiPDID] int  NOT NULL,
    [ISPDnOperator_ISPDnOperatorID] int  NOT NULL
);
GO

-- Creating table 'MnogieCeliOtdel'
CREATE TABLE [dbo].[MnogieCeliOtdel] (
    [CeliObrabotkiPD_CeliObrabotkiPDID] int  NOT NULL,
    [OtdelOrg_OtdelOrgID] int  NOT NULL
);
GO

-- Creating table 'MnogieHarakteristikiIshod'
CREATE TABLE [dbo].[MnogieHarakteristikiIshod] (
    [ISPDnHarakteristikIshod_ISPDnHarakteristikIshodID] int  NOT NULL,
    [ISPDnOperator_ISPDnOperatorID] int  NOT NULL
);
GO

-- Creating table 'MnogieISPDnKategoryPD'
CREATE TABLE [dbo].[MnogieISPDnKategoryPD] (
    [ISPDnOperator_ISPDnOperatorID] int  NOT NULL,
    [KategoryPd_KategoryPdID] int  NOT NULL
);
GO

-- Creating table 'MnogieISPDnRabotniki'
CREATE TABLE [dbo].[MnogieISPDnRabotniki] (
    [ISPDnOperator_ISPDnOperatorID] int  NOT NULL,
    [RabotnikiOrg_RabotnikiOrgID] int  NOT NULL
);
GO

-- Creating table 'MnogieKategoriSpecOtdel'
CREATE TABLE [dbo].[MnogieKategoriSpecOtdel] (
    [KategoryPdSpec_KategoryPdSpecID] int  NOT NULL,
    [OtdelOrg_OtdelOrgID] int  NOT NULL
);
GO

-- Creating table 'MnogieKategoryBioOtdel'
CREATE TABLE [dbo].[MnogieKategoryBioOtdel] (
    [KategoryPdBio_KategoryPdBioID] int  NOT NULL,
    [OtdelOrg_OtdelOrgID] int  NOT NULL
);
GO

-- Creating table 'MnogieKategoryDopOtdel'
CREATE TABLE [dbo].[MnogieKategoryDopOtdel] (
    [KategoryPdDop_KategoryPdDopID] int  NOT NULL,
    [OtdelOrg_OtdelOrgID] int  NOT NULL
);
GO

-- Creating table 'MnogieKategoryPdBioISPDn'
CREATE TABLE [dbo].[MnogieKategoryPdBioISPDn] (
    [ISPDnOperator_ISPDnOperatorID] int  NOT NULL,
    [KategoryPdBio_KategoryPdBioID] int  NOT NULL
);
GO

-- Creating table 'MnogieKategoryPdDopISPDn'
CREATE TABLE [dbo].[MnogieKategoryPdDopISPDn] (
    [ISPDnOperator_ISPDnOperatorID] int  NOT NULL,
    [KategoryPdDop_KategoryPdDopID] int  NOT NULL
);
GO

-- Creating table 'MnogieKategoryPdOtdel'
CREATE TABLE [dbo].[MnogieKategoryPdOtdel] (
    [KategoryPd_KategoryPdID] int  NOT NULL,
    [OtdelOrg_OtdelOrgID] int  NOT NULL
);
GO

-- Creating table 'MnogieKategoryPdSpecISPDn'
CREATE TABLE [dbo].[MnogieKategoryPdSpecISPDn] (
    [ISPDnOperator_ISPDnOperatorID] int  NOT NULL,
    [KategoryPdSpec_KategoryPdSpecID] int  NOT NULL
);
GO

-- Creating table 'MnogieOtdelSubj'
CREATE TABLE [dbo].[MnogieOtdelSubj] (
    [KategorySubj_KategorySubjID] int  NOT NULL,
    [OtdelOrg_OtdelOrgID] int  NOT NULL
);
GO

-- Creating table 'MnogieRabotnikiOtdel'
CREATE TABLE [dbo].[MnogieRabotnikiOtdel] (
    [OtdelOrg_OtdelOrgID] int  NOT NULL,
    [RabotnikiOrg_RabotnikiOrgID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ActualnostID] in table 'Actualnost'
ALTER TABLE [dbo].[Actualnost]
ADD CONSTRAINT [PK_Actualnost]
    PRIMARY KEY CLUSTERED ([ActualnostID] ASC);
GO

-- Creating primary key on [CeliObrabotkiPDID] in table 'CeliObrabotkiPD'
ALTER TABLE [dbo].[CeliObrabotkiPD]
ADD CONSTRAINT [PK_CeliObrabotkiPD]
    PRIMARY KEY CLUSTERED ([CeliObrabotkiPDID] ASC);
GO

-- Creating primary key on [ISPDnHarakteristikIshodID] in table 'ISPDnHarakteristikIshod'
ALTER TABLE [dbo].[ISPDnHarakteristikIshod]
ADD CONSTRAINT [PK_ISPDnHarakteristikIshod]
    PRIMARY KEY CLUSTERED ([ISPDnHarakteristikIshodID] ASC);
GO

-- Creating primary key on [ISPDnIshodZashitaID] in table 'ISPDnIshodZashita'
ALTER TABLE [dbo].[ISPDnIshodZashita]
ADD CONSTRAINT [PK_ISPDnIshodZashita]
    PRIMARY KEY CLUSTERED ([ISPDnIshodZashitaID] ASC);
GO

-- Creating primary key on [ISPDnKategoryID] in table 'ISPDnKategory'
ALTER TABLE [dbo].[ISPDnKategory]
ADD CONSTRAINT [PK_ISPDnKategory]
    PRIMARY KEY CLUSTERED ([ISPDnKategoryID] ASC);
GO

-- Creating primary key on [ISPDnKlassID] in table 'ISPDnKlass'
ALTER TABLE [dbo].[ISPDnKlass]
ADD CONSTRAINT [PK_ISPDnKlass]
    PRIMARY KEY CLUSTERED ([ISPDnKlassID] ASC);
GO

-- Creating primary key on [ISPDnObemID] in table 'ISPDnObem'
ALTER TABLE [dbo].[ISPDnObem]
ADD CONSTRAINT [PK_ISPDnObem]
    PRIMARY KEY CLUSTERED ([ISPDnObemID] ASC);
GO

-- Creating primary key on [ISPDnOperatorID] in table 'ISPDnOperator'
ALTER TABLE [dbo].[ISPDnOperator]
ADD CONSTRAINT [PK_ISPDnOperator]
    PRIMARY KEY CLUSTERED ([ISPDnOperatorID] ASC);
GO

-- Creating primary key on [ISPDnTipSpecialID] in table 'ISPDnTipSpecial'
ALTER TABLE [dbo].[ISPDnTipSpecial]
ADD CONSTRAINT [PK_ISPDnTipSpecial]
    PRIMARY KEY CLUSTERED ([ISPDnTipSpecialID] ASC);
GO

-- Creating primary key on [KategoryPdID] in table 'KategoryPd'
ALTER TABLE [dbo].[KategoryPd]
ADD CONSTRAINT [PK_KategoryPd]
    PRIMARY KEY CLUSTERED ([KategoryPdID] ASC);
GO

-- Creating primary key on [KategoryPdBioID] in table 'KategoryPdBio'
ALTER TABLE [dbo].[KategoryPdBio]
ADD CONSTRAINT [PK_KategoryPdBio]
    PRIMARY KEY CLUSTERED ([KategoryPdBioID] ASC);
GO

-- Creating primary key on [KategoryPdDopID] in table 'KategoryPdDop'
ALTER TABLE [dbo].[KategoryPdDop]
ADD CONSTRAINT [PK_KategoryPdDop]
    PRIMARY KEY CLUSTERED ([KategoryPdDopID] ASC);
GO

-- Creating primary key on [KategoryPdSpecID] in table 'KategoryPdSpec'
ALTER TABLE [dbo].[KategoryPdSpec]
ADD CONSTRAINT [PK_KategoryPdSpec]
    PRIMARY KEY CLUSTERED ([KategoryPdSpecID] ASC);
GO

-- Creating primary key on [KategorySubjID] in table 'KategorySubj'
ALTER TABLE [dbo].[KategorySubj]
ADD CONSTRAINT [PK_KategorySubj]
    PRIMARY KEY CLUSTERED ([KategorySubjID] ASC);
GO

-- Creating primary key on [KategorySubjID], [ISPDnOperatorID], [MnogISPDnSubj] in table 'MnogieISPDnSubj'
ALTER TABLE [dbo].[MnogieISPDnSubj]
ADD CONSTRAINT [PK_MnogieISPDnSubj]
    PRIMARY KEY CLUSTERED ([KategorySubjID], [ISPDnOperatorID], [MnogISPDnSubj] ASC);
GO

-- Creating primary key on [NazvanieUgrozID], [ISPDnOperatorID] in table 'MnogieOpasnUgrozIS'
ALTER TABLE [dbo].[MnogieOpasnUgrozIS]
ADD CONSTRAINT [PK_MnogieOpasnUgrozIS]
    PRIMARY KEY CLUSTERED ([NazvanieUgrozID], [ISPDnOperatorID] ASC);
GO

-- Creating primary key on [ISPDnOperatorID], [NazvanieUgrozID] in table 'MnogieRealizUgroz'
ALTER TABLE [dbo].[MnogieRealizUgroz]
ADD CONSTRAINT [PK_MnogieRealizUgroz]
    PRIMARY KEY CLUSTERED ([ISPDnOperatorID], [NazvanieUgrozID] ASC);
GO

-- Creating primary key on [NazvanieUgrozID], [ISPDnOperatorID] in table 'MnogieUgrozaActual'
ALTER TABLE [dbo].[MnogieUgrozaActual]
ADD CONSTRAINT [PK_MnogieUgrozaActual]
    PRIMARY KEY CLUSTERED ([NazvanieUgrozID], [ISPDnOperatorID] ASC);
GO

-- Creating primary key on [NazvanieUgrozID], [ISPDnOperatorID] in table 'MnogieVerUgrozIS'
ALTER TABLE [dbo].[MnogieVerUgrozIS]
ADD CONSTRAINT [PK_MnogieVerUgrozIS]
    PRIMARY KEY CLUSTERED ([NazvanieUgrozID], [ISPDnOperatorID] ASC);
GO

-- Creating primary key on [NazvanieUgrozID] in table 'NazvanieUgroz'
ALTER TABLE [dbo].[NazvanieUgroz]
ADD CONSTRAINT [PK_NazvanieUgroz]
    PRIMARY KEY CLUSTERED ([NazvanieUgrozID] ASC);
GO

-- Creating primary key on [OpasnostUgrozID] in table 'OpasnostUgroz'
ALTER TABLE [dbo].[OpasnostUgroz]
ADD CONSTRAINT [PK_OpasnostUgroz]
    PRIMARY KEY CLUSTERED ([OpasnostUgrozID] ASC);
GO

-- Creating primary key on [OrgOperatorID] in table 'OrgOperator'
ALTER TABLE [dbo].[OrgOperator]
ADD CONSTRAINT [PK_OrgOperator]
    PRIMARY KEY CLUSTERED ([OrgOperatorID] ASC);
GO

-- Creating primary key on [OtdelOrgID] in table 'OtdelOrg'
ALTER TABLE [dbo].[OtdelOrg]
ADD CONSTRAINT [PK_OtdelOrg]
    PRIMARY KEY CLUSTERED ([OtdelOrgID] ASC);
GO

-- Creating primary key on [RabotnikiOrgID] in table 'RabotnikiOrg'
ALTER TABLE [dbo].[RabotnikiOrg]
ADD CONSTRAINT [PK_RabotnikiOrg]
    PRIMARY KEY CLUSTERED ([RabotnikiOrgID] ASC);
GO

-- Creating primary key on [RealizationUgrozID] in table 'RealizationUgroz'
ALTER TABLE [dbo].[RealizationUgroz]
ADD CONSTRAINT [PK_RealizationUgroz]
    PRIMARY KEY CLUSTERED ([RealizationUgrozID] ASC);
GO

-- Creating primary key on [VeroyatnostUgrozID] in table 'VeroyatnostUgroz'
ALTER TABLE [dbo].[VeroyatnostUgroz]
ADD CONSTRAINT [PK_VeroyatnostUgroz]
    PRIMARY KEY CLUSTERED ([VeroyatnostUgrozID] ASC);
GO

-- Creating primary key on [VidIshodHarakteristikID] in table 'VidIshodHarakteristik'
ALTER TABLE [dbo].[VidIshodHarakteristik]
ADD CONSTRAINT [PK_VidIshodHarakteristik]
    PRIMARY KEY CLUSTERED ([VidIshodHarakteristikID] ASC);
GO

-- Creating primary key on [VidUgrozID] in table 'VidUgroz'
ALTER TABLE [dbo].[VidUgroz]
ADD CONSTRAINT [PK_VidUgroz]
    PRIMARY KEY CLUSTERED ([VidUgrozID] ASC);
GO

-- Creating primary key on [CeliObrabotkiPD_CeliObrabotkiPDID], [ISPDnOperator_ISPDnOperatorID] in table 'MnogieCeliObrabotkiISPDn'
ALTER TABLE [dbo].[MnogieCeliObrabotkiISPDn]
ADD CONSTRAINT [PK_MnogieCeliObrabotkiISPDn]
    PRIMARY KEY CLUSTERED ([CeliObrabotkiPD_CeliObrabotkiPDID], [ISPDnOperator_ISPDnOperatorID] ASC);
GO

-- Creating primary key on [CeliObrabotkiPD_CeliObrabotkiPDID], [OtdelOrg_OtdelOrgID] in table 'MnogieCeliOtdel'
ALTER TABLE [dbo].[MnogieCeliOtdel]
ADD CONSTRAINT [PK_MnogieCeliOtdel]
    PRIMARY KEY CLUSTERED ([CeliObrabotkiPD_CeliObrabotkiPDID], [OtdelOrg_OtdelOrgID] ASC);
GO

-- Creating primary key on [ISPDnHarakteristikIshod_ISPDnHarakteristikIshodID], [ISPDnOperator_ISPDnOperatorID] in table 'MnogieHarakteristikiIshod'
ALTER TABLE [dbo].[MnogieHarakteristikiIshod]
ADD CONSTRAINT [PK_MnogieHarakteristikiIshod]
    PRIMARY KEY CLUSTERED ([ISPDnHarakteristikIshod_ISPDnHarakteristikIshodID], [ISPDnOperator_ISPDnOperatorID] ASC);
GO

-- Creating primary key on [ISPDnOperator_ISPDnOperatorID], [KategoryPd_KategoryPdID] in table 'MnogieISPDnKategoryPD'
ALTER TABLE [dbo].[MnogieISPDnKategoryPD]
ADD CONSTRAINT [PK_MnogieISPDnKategoryPD]
    PRIMARY KEY CLUSTERED ([ISPDnOperator_ISPDnOperatorID], [KategoryPd_KategoryPdID] ASC);
GO

-- Creating primary key on [ISPDnOperator_ISPDnOperatorID], [RabotnikiOrg_RabotnikiOrgID] in table 'MnogieISPDnRabotniki'
ALTER TABLE [dbo].[MnogieISPDnRabotniki]
ADD CONSTRAINT [PK_MnogieISPDnRabotniki]
    PRIMARY KEY CLUSTERED ([ISPDnOperator_ISPDnOperatorID], [RabotnikiOrg_RabotnikiOrgID] ASC);
GO

-- Creating primary key on [KategoryPdSpec_KategoryPdSpecID], [OtdelOrg_OtdelOrgID] in table 'MnogieKategoriSpecOtdel'
ALTER TABLE [dbo].[MnogieKategoriSpecOtdel]
ADD CONSTRAINT [PK_MnogieKategoriSpecOtdel]
    PRIMARY KEY CLUSTERED ([KategoryPdSpec_KategoryPdSpecID], [OtdelOrg_OtdelOrgID] ASC);
GO

-- Creating primary key on [KategoryPdBio_KategoryPdBioID], [OtdelOrg_OtdelOrgID] in table 'MnogieKategoryBioOtdel'
ALTER TABLE [dbo].[MnogieKategoryBioOtdel]
ADD CONSTRAINT [PK_MnogieKategoryBioOtdel]
    PRIMARY KEY CLUSTERED ([KategoryPdBio_KategoryPdBioID], [OtdelOrg_OtdelOrgID] ASC);
GO

-- Creating primary key on [KategoryPdDop_KategoryPdDopID], [OtdelOrg_OtdelOrgID] in table 'MnogieKategoryDopOtdel'
ALTER TABLE [dbo].[MnogieKategoryDopOtdel]
ADD CONSTRAINT [PK_MnogieKategoryDopOtdel]
    PRIMARY KEY CLUSTERED ([KategoryPdDop_KategoryPdDopID], [OtdelOrg_OtdelOrgID] ASC);
GO

-- Creating primary key on [ISPDnOperator_ISPDnOperatorID], [KategoryPdBio_KategoryPdBioID] in table 'MnogieKategoryPdBioISPDn'
ALTER TABLE [dbo].[MnogieKategoryPdBioISPDn]
ADD CONSTRAINT [PK_MnogieKategoryPdBioISPDn]
    PRIMARY KEY CLUSTERED ([ISPDnOperator_ISPDnOperatorID], [KategoryPdBio_KategoryPdBioID] ASC);
GO

-- Creating primary key on [ISPDnOperator_ISPDnOperatorID], [KategoryPdDop_KategoryPdDopID] in table 'MnogieKategoryPdDopISPDn'
ALTER TABLE [dbo].[MnogieKategoryPdDopISPDn]
ADD CONSTRAINT [PK_MnogieKategoryPdDopISPDn]
    PRIMARY KEY CLUSTERED ([ISPDnOperator_ISPDnOperatorID], [KategoryPdDop_KategoryPdDopID] ASC);
GO

-- Creating primary key on [KategoryPd_KategoryPdID], [OtdelOrg_OtdelOrgID] in table 'MnogieKategoryPdOtdel'
ALTER TABLE [dbo].[MnogieKategoryPdOtdel]
ADD CONSTRAINT [PK_MnogieKategoryPdOtdel]
    PRIMARY KEY CLUSTERED ([KategoryPd_KategoryPdID], [OtdelOrg_OtdelOrgID] ASC);
GO

-- Creating primary key on [ISPDnOperator_ISPDnOperatorID], [KategoryPdSpec_KategoryPdSpecID] in table 'MnogieKategoryPdSpecISPDn'
ALTER TABLE [dbo].[MnogieKategoryPdSpecISPDn]
ADD CONSTRAINT [PK_MnogieKategoryPdSpecISPDn]
    PRIMARY KEY CLUSTERED ([ISPDnOperator_ISPDnOperatorID], [KategoryPdSpec_KategoryPdSpecID] ASC);
GO

-- Creating primary key on [KategorySubj_KategorySubjID], [OtdelOrg_OtdelOrgID] in table 'MnogieOtdelSubj'
ALTER TABLE [dbo].[MnogieOtdelSubj]
ADD CONSTRAINT [PK_MnogieOtdelSubj]
    PRIMARY KEY CLUSTERED ([KategorySubj_KategorySubjID], [OtdelOrg_OtdelOrgID] ASC);
GO

-- Creating primary key on [OtdelOrg_OtdelOrgID], [RabotnikiOrg_RabotnikiOrgID] in table 'MnogieRabotnikiOtdel'
ALTER TABLE [dbo].[MnogieRabotnikiOtdel]
ADD CONSTRAINT [PK_MnogieRabotnikiOtdel]
    PRIMARY KEY CLUSTERED ([OtdelOrg_OtdelOrgID], [RabotnikiOrg_RabotnikiOrgID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ActualnostID] in table 'MnogieUgrozaActual'
ALTER TABLE [dbo].[MnogieUgrozaActual]
ADD CONSTRAINT [FK_MnogieUgrozaActual_FK00]
    FOREIGN KEY ([ActualnostID])
    REFERENCES [dbo].[Actualnost]
        ([ActualnostID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieUgrozaActual_FK00'
CREATE INDEX [IX_FK_MnogieUgrozaActual_FK00]
ON [dbo].[MnogieUgrozaActual]
    ([ActualnostID]);
GO

-- Creating foreign key on [OrgOperatorID] in table 'CeliObrabotkiPD'
ALTER TABLE [dbo].[CeliObrabotkiPD]
ADD CONSTRAINT [FK_CeliObrabotkiPD_FK00]
    FOREIGN KEY ([OrgOperatorID])
    REFERENCES [dbo].[OrgOperator]
        ([OrgOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CeliObrabotkiPD_FK00'
CREATE INDEX [IX_FK_CeliObrabotkiPD_FK00]
ON [dbo].[CeliObrabotkiPD]
    ([OrgOperatorID]);
GO

-- Creating foreign key on [VidIshodHarakteristikID] in table 'ISPDnHarakteristikIshod'
ALTER TABLE [dbo].[ISPDnHarakteristikIshod]
ADD CONSTRAINT [FK_ISPDnHarakteristikIshod_FK00]
    FOREIGN KEY ([VidIshodHarakteristikID])
    REFERENCES [dbo].[VidIshodHarakteristik]
        ([VidIshodHarakteristikID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ISPDnHarakteristikIshod_FK00'
CREATE INDEX [IX_FK_ISPDnHarakteristikIshod_FK00]
ON [dbo].[ISPDnHarakteristikIshod]
    ([VidIshodHarakteristikID]);
GO

-- Creating foreign key on [ISPDnIshodZashitaID] in table 'ISPDnOperator'
ALTER TABLE [dbo].[ISPDnOperator]
ADD CONSTRAINT [FK_ISPDnOperator_FK00]
    FOREIGN KEY ([ISPDnIshodZashitaID])
    REFERENCES [dbo].[ISPDnIshodZashita]
        ([ISPDnIshodZashitaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ISPDnOperator_FK00'
CREATE INDEX [IX_FK_ISPDnOperator_FK00]
ON [dbo].[ISPDnOperator]
    ([ISPDnIshodZashitaID]);
GO

-- Creating foreign key on [ISPDnKategoryID] in table 'ISPDnOperator'
ALTER TABLE [dbo].[ISPDnOperator]
ADD CONSTRAINT [FK_ISPDnOperator_FK01]
    FOREIGN KEY ([ISPDnKategoryID])
    REFERENCES [dbo].[ISPDnKategory]
        ([ISPDnKategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ISPDnOperator_FK01'
CREATE INDEX [IX_FK_ISPDnOperator_FK01]
ON [dbo].[ISPDnOperator]
    ([ISPDnKategoryID]);
GO

-- Creating foreign key on [ISPDnKlassID] in table 'ISPDnOperator'
ALTER TABLE [dbo].[ISPDnOperator]
ADD CONSTRAINT [FK_ISPDnOperator_FK02]
    FOREIGN KEY ([ISPDnKlassID])
    REFERENCES [dbo].[ISPDnKlass]
        ([ISPDnKlassID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ISPDnOperator_FK02'
CREATE INDEX [IX_FK_ISPDnOperator_FK02]
ON [dbo].[ISPDnOperator]
    ([ISPDnKlassID]);
GO

-- Creating foreign key on [ISPDnObemID] in table 'ISPDnOperator'
ALTER TABLE [dbo].[ISPDnOperator]
ADD CONSTRAINT [FK_ISPDnOperator_FK03]
    FOREIGN KEY ([ISPDnObemID])
    REFERENCES [dbo].[ISPDnObem]
        ([ISPDnObemID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ISPDnOperator_FK03'
CREATE INDEX [IX_FK_ISPDnOperator_FK03]
ON [dbo].[ISPDnOperator]
    ([ISPDnObemID]);
GO

-- Creating foreign key on [ISPDnTipSpecialID] in table 'ISPDnOperator'
ALTER TABLE [dbo].[ISPDnOperator]
ADD CONSTRAINT [FK_ISPDnOperator_FK04]
    FOREIGN KEY ([ISPDnTipSpecialID])
    REFERENCES [dbo].[ISPDnTipSpecial]
        ([ISPDnTipSpecialID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ISPDnOperator_FK04'
CREATE INDEX [IX_FK_ISPDnOperator_FK04]
ON [dbo].[ISPDnOperator]
    ([ISPDnTipSpecialID]);
GO

-- Creating foreign key on [OrgOperatorID] in table 'ISPDnOperator'
ALTER TABLE [dbo].[ISPDnOperator]
ADD CONSTRAINT [FK_ISPDnOperator_FK05]
    FOREIGN KEY ([OrgOperatorID])
    REFERENCES [dbo].[OrgOperator]
        ([OrgOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ISPDnOperator_FK05'
CREATE INDEX [IX_FK_ISPDnOperator_FK05]
ON [dbo].[ISPDnOperator]
    ([OrgOperatorID]);
GO

-- Creating foreign key on [ISPDnOperatorID] in table 'MnogieISPDnSubj'
ALTER TABLE [dbo].[MnogieISPDnSubj]
ADD CONSTRAINT [FK_MnogieISPDnSubj_FK00]
    FOREIGN KEY ([ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieISPDnSubj_FK00'
CREATE INDEX [IX_FK_MnogieISPDnSubj_FK00]
ON [dbo].[MnogieISPDnSubj]
    ([ISPDnOperatorID]);
GO

-- Creating foreign key on [ISPDnOperatorID] in table 'MnogieOpasnUgrozIS'
ALTER TABLE [dbo].[MnogieOpasnUgrozIS]
ADD CONSTRAINT [FK_MnogieOpasnUgrozIS_FK00]
    FOREIGN KEY ([ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieOpasnUgrozIS_FK00'
CREATE INDEX [IX_FK_MnogieOpasnUgrozIS_FK00]
ON [dbo].[MnogieOpasnUgrozIS]
    ([ISPDnOperatorID]);
GO

-- Creating foreign key on [ISPDnOperatorID] in table 'MnogieRealizUgroz'
ALTER TABLE [dbo].[MnogieRealizUgroz]
ADD CONSTRAINT [FK_MnogieRealizUgroz_FK00]
    FOREIGN KEY ([ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ISPDnOperatorID] in table 'MnogieUgrozaActual'
ALTER TABLE [dbo].[MnogieUgrozaActual]
ADD CONSTRAINT [FK_MnogieUgrozaActual_FK01]
    FOREIGN KEY ([ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieUgrozaActual_FK01'
CREATE INDEX [IX_FK_MnogieUgrozaActual_FK01]
ON [dbo].[MnogieUgrozaActual]
    ([ISPDnOperatorID]);
GO

-- Creating foreign key on [ISPDnOperatorID] in table 'MnogieVerUgrozIS'
ALTER TABLE [dbo].[MnogieVerUgrozIS]
ADD CONSTRAINT [FK_MnogieVerUgrozIS_FK00]
    FOREIGN KEY ([ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieVerUgrozIS_FK00'
CREATE INDEX [IX_FK_MnogieVerUgrozIS_FK00]
ON [dbo].[MnogieVerUgrozIS]
    ([ISPDnOperatorID]);
GO

-- Creating foreign key on [OrgOperatorID] in table 'KategoryPdBio'
ALTER TABLE [dbo].[KategoryPdBio]
ADD CONSTRAINT [FK_KategoryPdBio_FK00]
    FOREIGN KEY ([OrgOperatorID])
    REFERENCES [dbo].[OrgOperator]
        ([OrgOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KategoryPdBio_FK00'
CREATE INDEX [IX_FK_KategoryPdBio_FK00]
ON [dbo].[KategoryPdBio]
    ([OrgOperatorID]);
GO

-- Creating foreign key on [OrgOperatorID] in table 'KategoryPdDop'
ALTER TABLE [dbo].[KategoryPdDop]
ADD CONSTRAINT [FK_KategoryPdDop_FK00]
    FOREIGN KEY ([OrgOperatorID])
    REFERENCES [dbo].[OrgOperator]
        ([OrgOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KategoryPdDop_FK00'
CREATE INDEX [IX_FK_KategoryPdDop_FK00]
ON [dbo].[KategoryPdDop]
    ([OrgOperatorID]);
GO

-- Creating foreign key on [OrgOperatorID] in table 'KategorySubj'
ALTER TABLE [dbo].[KategorySubj]
ADD CONSTRAINT [FK_KategorySubj_FK00]
    FOREIGN KEY ([OrgOperatorID])
    REFERENCES [dbo].[OrgOperator]
        ([OrgOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KategorySubj_FK00'
CREATE INDEX [IX_FK_KategorySubj_FK00]
ON [dbo].[KategorySubj]
    ([OrgOperatorID]);
GO

-- Creating foreign key on [KategorySubjID] in table 'MnogieISPDnSubj'
ALTER TABLE [dbo].[MnogieISPDnSubj]
ADD CONSTRAINT [FK_MnogieISPDnSubj_FK01]
    FOREIGN KEY ([KategorySubjID])
    REFERENCES [dbo].[KategorySubj]
        ([KategorySubjID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [NazvanieUgrozID] in table 'MnogieOpasnUgrozIS'
ALTER TABLE [dbo].[MnogieOpasnUgrozIS]
ADD CONSTRAINT [FK_MnogieOpasnUgrozIS_FK01]
    FOREIGN KEY ([NazvanieUgrozID])
    REFERENCES [dbo].[NazvanieUgroz]
        ([NazvanieUgrozID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [OpasnostUgrozID] in table 'MnogieOpasnUgrozIS'
ALTER TABLE [dbo].[MnogieOpasnUgrozIS]
ADD CONSTRAINT [FK_MnogieOpasnUgrozIS_FK02]
    FOREIGN KEY ([OpasnostUgrozID])
    REFERENCES [dbo].[OpasnostUgroz]
        ([OpasnostUgrozID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieOpasnUgrozIS_FK02'
CREATE INDEX [IX_FK_MnogieOpasnUgrozIS_FK02]
ON [dbo].[MnogieOpasnUgrozIS]
    ([OpasnostUgrozID]);
GO

-- Creating foreign key on [NazvanieUgrozID] in table 'MnogieRealizUgroz'
ALTER TABLE [dbo].[MnogieRealizUgroz]
ADD CONSTRAINT [FK_MnogieRealizUgroz_FK01]
    FOREIGN KEY ([NazvanieUgrozID])
    REFERENCES [dbo].[NazvanieUgroz]
        ([NazvanieUgrozID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieRealizUgroz_FK01'
CREATE INDEX [IX_FK_MnogieRealizUgroz_FK01]
ON [dbo].[MnogieRealizUgroz]
    ([NazvanieUgrozID]);
GO

-- Creating foreign key on [RealizationUgrozID] in table 'MnogieRealizUgroz'
ALTER TABLE [dbo].[MnogieRealizUgroz]
ADD CONSTRAINT [FK_MnogieRealizUgroz_FK02]
    FOREIGN KEY ([RealizationUgrozID])
    REFERENCES [dbo].[RealizationUgroz]
        ([RealizationUgrozID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieRealizUgroz_FK02'
CREATE INDEX [IX_FK_MnogieRealizUgroz_FK02]
ON [dbo].[MnogieRealizUgroz]
    ([RealizationUgrozID]);
GO

-- Creating foreign key on [NazvanieUgrozID] in table 'MnogieUgrozaActual'
ALTER TABLE [dbo].[MnogieUgrozaActual]
ADD CONSTRAINT [FK_MnogieUgrozaActual_FK02]
    FOREIGN KEY ([NazvanieUgrozID])
    REFERENCES [dbo].[NazvanieUgroz]
        ([NazvanieUgrozID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [NazvanieUgrozID] in table 'MnogieVerUgrozIS'
ALTER TABLE [dbo].[MnogieVerUgrozIS]
ADD CONSTRAINT [FK_MnogieVerUgrozIS_FK01]
    FOREIGN KEY ([NazvanieUgrozID])
    REFERENCES [dbo].[NazvanieUgroz]
        ([NazvanieUgrozID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [VeroyatnostUgrozID] in table 'MnogieVerUgrozIS'
ALTER TABLE [dbo].[MnogieVerUgrozIS]
ADD CONSTRAINT [FK_MnogieVerUgrozIS_FK02]
    FOREIGN KEY ([VeroyatnostUgrozID])
    REFERENCES [dbo].[VeroyatnostUgroz]
        ([VeroyatnostUgrozID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieVerUgrozIS_FK02'
CREATE INDEX [IX_FK_MnogieVerUgrozIS_FK02]
ON [dbo].[MnogieVerUgrozIS]
    ([VeroyatnostUgrozID]);
GO

-- Creating foreign key on [VidUgrozID] in table 'NazvanieUgroz'
ALTER TABLE [dbo].[NazvanieUgroz]
ADD CONSTRAINT [FK_NazvanieUgroz_FK00]
    FOREIGN KEY ([VidUgrozID])
    REFERENCES [dbo].[VidUgroz]
        ([VidUgrozID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NazvanieUgroz_FK00'
CREATE INDEX [IX_FK_NazvanieUgroz_FK00]
ON [dbo].[NazvanieUgroz]
    ([VidUgrozID]);
GO

-- Creating foreign key on [OrgOperatorID] in table 'OtdelOrg'
ALTER TABLE [dbo].[OtdelOrg]
ADD CONSTRAINT [FK_OtdelOrg_FK00]
    FOREIGN KEY ([OrgOperatorID])
    REFERENCES [dbo].[OrgOperator]
        ([OrgOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OtdelOrg_FK00'
CREATE INDEX [IX_FK_OtdelOrg_FK00]
ON [dbo].[OtdelOrg]
    ([OrgOperatorID]);
GO

-- Creating foreign key on [OrgOperatorID] in table 'RabotnikiOrg'
ALTER TABLE [dbo].[RabotnikiOrg]
ADD CONSTRAINT [FK_RabotnikiOrg_FK00]
    FOREIGN KEY ([OrgOperatorID])
    REFERENCES [dbo].[OrgOperator]
        ([OrgOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RabotnikiOrg_FK00'
CREATE INDEX [IX_FK_RabotnikiOrg_FK00]
ON [dbo].[RabotnikiOrg]
    ([OrgOperatorID]);
GO

-- Creating foreign key on [CeliObrabotkiPD_CeliObrabotkiPDID] in table 'MnogieCeliObrabotkiISPDn'
ALTER TABLE [dbo].[MnogieCeliObrabotkiISPDn]
ADD CONSTRAINT [FK_MnogieCeliObrabotkiISPDn_CeliObrabotkiPD]
    FOREIGN KEY ([CeliObrabotkiPD_CeliObrabotkiPDID])
    REFERENCES [dbo].[CeliObrabotkiPD]
        ([CeliObrabotkiPDID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ISPDnOperator_ISPDnOperatorID] in table 'MnogieCeliObrabotkiISPDn'
ALTER TABLE [dbo].[MnogieCeliObrabotkiISPDn]
ADD CONSTRAINT [FK_MnogieCeliObrabotkiISPDn_ISPDnOperator]
    FOREIGN KEY ([ISPDnOperator_ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieCeliObrabotkiISPDn_ISPDnOperator'
CREATE INDEX [IX_FK_MnogieCeliObrabotkiISPDn_ISPDnOperator]
ON [dbo].[MnogieCeliObrabotkiISPDn]
    ([ISPDnOperator_ISPDnOperatorID]);
GO

-- Creating foreign key on [CeliObrabotkiPD_CeliObrabotkiPDID] in table 'MnogieCeliOtdel'
ALTER TABLE [dbo].[MnogieCeliOtdel]
ADD CONSTRAINT [FK_MnogieCeliOtdel_CeliObrabotkiPD]
    FOREIGN KEY ([CeliObrabotkiPD_CeliObrabotkiPDID])
    REFERENCES [dbo].[CeliObrabotkiPD]
        ([CeliObrabotkiPDID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [OtdelOrg_OtdelOrgID] in table 'MnogieCeliOtdel'
ALTER TABLE [dbo].[MnogieCeliOtdel]
ADD CONSTRAINT [FK_MnogieCeliOtdel_OtdelOrg]
    FOREIGN KEY ([OtdelOrg_OtdelOrgID])
    REFERENCES [dbo].[OtdelOrg]
        ([OtdelOrgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieCeliOtdel_OtdelOrg'
CREATE INDEX [IX_FK_MnogieCeliOtdel_OtdelOrg]
ON [dbo].[MnogieCeliOtdel]
    ([OtdelOrg_OtdelOrgID]);
GO

-- Creating foreign key on [ISPDnHarakteristikIshod_ISPDnHarakteristikIshodID] in table 'MnogieHarakteristikiIshod'
ALTER TABLE [dbo].[MnogieHarakteristikiIshod]
ADD CONSTRAINT [FK_MnogieHarakteristikiIshod_ISPDnHarakteristikIshod]
    FOREIGN KEY ([ISPDnHarakteristikIshod_ISPDnHarakteristikIshodID])
    REFERENCES [dbo].[ISPDnHarakteristikIshod]
        ([ISPDnHarakteristikIshodID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ISPDnOperator_ISPDnOperatorID] in table 'MnogieHarakteristikiIshod'
ALTER TABLE [dbo].[MnogieHarakteristikiIshod]
ADD CONSTRAINT [FK_MnogieHarakteristikiIshod_ISPDnOperator]
    FOREIGN KEY ([ISPDnOperator_ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieHarakteristikiIshod_ISPDnOperator'
CREATE INDEX [IX_FK_MnogieHarakteristikiIshod_ISPDnOperator]
ON [dbo].[MnogieHarakteristikiIshod]
    ([ISPDnOperator_ISPDnOperatorID]);
GO

-- Creating foreign key on [ISPDnOperator_ISPDnOperatorID] in table 'MnogieISPDnKategoryPD'
ALTER TABLE [dbo].[MnogieISPDnKategoryPD]
ADD CONSTRAINT [FK_MnogieISPDnKategoryPD_ISPDnOperator]
    FOREIGN KEY ([ISPDnOperator_ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [KategoryPd_KategoryPdID] in table 'MnogieISPDnKategoryPD'
ALTER TABLE [dbo].[MnogieISPDnKategoryPD]
ADD CONSTRAINT [FK_MnogieISPDnKategoryPD_KategoryPd]
    FOREIGN KEY ([KategoryPd_KategoryPdID])
    REFERENCES [dbo].[KategoryPd]
        ([KategoryPdID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieISPDnKategoryPD_KategoryPd'
CREATE INDEX [IX_FK_MnogieISPDnKategoryPD_KategoryPd]
ON [dbo].[MnogieISPDnKategoryPD]
    ([KategoryPd_KategoryPdID]);
GO

-- Creating foreign key on [ISPDnOperator_ISPDnOperatorID] in table 'MnogieISPDnRabotniki'
ALTER TABLE [dbo].[MnogieISPDnRabotniki]
ADD CONSTRAINT [FK_MnogieISPDnRabotniki_ISPDnOperator]
    FOREIGN KEY ([ISPDnOperator_ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RabotnikiOrg_RabotnikiOrgID] in table 'MnogieISPDnRabotniki'
ALTER TABLE [dbo].[MnogieISPDnRabotniki]
ADD CONSTRAINT [FK_MnogieISPDnRabotniki_RabotnikiOrg]
    FOREIGN KEY ([RabotnikiOrg_RabotnikiOrgID])
    REFERENCES [dbo].[RabotnikiOrg]
        ([RabotnikiOrgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieISPDnRabotniki_RabotnikiOrg'
CREATE INDEX [IX_FK_MnogieISPDnRabotniki_RabotnikiOrg]
ON [dbo].[MnogieISPDnRabotniki]
    ([RabotnikiOrg_RabotnikiOrgID]);
GO

-- Creating foreign key on [KategoryPdSpec_KategoryPdSpecID] in table 'MnogieKategoriSpecOtdel'
ALTER TABLE [dbo].[MnogieKategoriSpecOtdel]
ADD CONSTRAINT [FK_MnogieKategoriSpecOtdel_KategoryPdSpec]
    FOREIGN KEY ([KategoryPdSpec_KategoryPdSpecID])
    REFERENCES [dbo].[KategoryPdSpec]
        ([KategoryPdSpecID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [OtdelOrg_OtdelOrgID] in table 'MnogieKategoriSpecOtdel'
ALTER TABLE [dbo].[MnogieKategoriSpecOtdel]
ADD CONSTRAINT [FK_MnogieKategoriSpecOtdel_OtdelOrg]
    FOREIGN KEY ([OtdelOrg_OtdelOrgID])
    REFERENCES [dbo].[OtdelOrg]
        ([OtdelOrgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieKategoriSpecOtdel_OtdelOrg'
CREATE INDEX [IX_FK_MnogieKategoriSpecOtdel_OtdelOrg]
ON [dbo].[MnogieKategoriSpecOtdel]
    ([OtdelOrg_OtdelOrgID]);
GO

-- Creating foreign key on [KategoryPdBio_KategoryPdBioID] in table 'MnogieKategoryBioOtdel'
ALTER TABLE [dbo].[MnogieKategoryBioOtdel]
ADD CONSTRAINT [FK_MnogieKategoryBioOtdel_KategoryPdBio]
    FOREIGN KEY ([KategoryPdBio_KategoryPdBioID])
    REFERENCES [dbo].[KategoryPdBio]
        ([KategoryPdBioID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [OtdelOrg_OtdelOrgID] in table 'MnogieKategoryBioOtdel'
ALTER TABLE [dbo].[MnogieKategoryBioOtdel]
ADD CONSTRAINT [FK_MnogieKategoryBioOtdel_OtdelOrg]
    FOREIGN KEY ([OtdelOrg_OtdelOrgID])
    REFERENCES [dbo].[OtdelOrg]
        ([OtdelOrgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieKategoryBioOtdel_OtdelOrg'
CREATE INDEX [IX_FK_MnogieKategoryBioOtdel_OtdelOrg]
ON [dbo].[MnogieKategoryBioOtdel]
    ([OtdelOrg_OtdelOrgID]);
GO

-- Creating foreign key on [KategoryPdDop_KategoryPdDopID] in table 'MnogieKategoryDopOtdel'
ALTER TABLE [dbo].[MnogieKategoryDopOtdel]
ADD CONSTRAINT [FK_MnogieKategoryDopOtdel_KategoryPdDop]
    FOREIGN KEY ([KategoryPdDop_KategoryPdDopID])
    REFERENCES [dbo].[KategoryPdDop]
        ([KategoryPdDopID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [OtdelOrg_OtdelOrgID] in table 'MnogieKategoryDopOtdel'
ALTER TABLE [dbo].[MnogieKategoryDopOtdel]
ADD CONSTRAINT [FK_MnogieKategoryDopOtdel_OtdelOrg]
    FOREIGN KEY ([OtdelOrg_OtdelOrgID])
    REFERENCES [dbo].[OtdelOrg]
        ([OtdelOrgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieKategoryDopOtdel_OtdelOrg'
CREATE INDEX [IX_FK_MnogieKategoryDopOtdel_OtdelOrg]
ON [dbo].[MnogieKategoryDopOtdel]
    ([OtdelOrg_OtdelOrgID]);
GO

-- Creating foreign key on [ISPDnOperator_ISPDnOperatorID] in table 'MnogieKategoryPdBioISPDn'
ALTER TABLE [dbo].[MnogieKategoryPdBioISPDn]
ADD CONSTRAINT [FK_MnogieKategoryPdBioISPDn_ISPDnOperator]
    FOREIGN KEY ([ISPDnOperator_ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [KategoryPdBio_KategoryPdBioID] in table 'MnogieKategoryPdBioISPDn'
ALTER TABLE [dbo].[MnogieKategoryPdBioISPDn]
ADD CONSTRAINT [FK_MnogieKategoryPdBioISPDn_KategoryPdBio]
    FOREIGN KEY ([KategoryPdBio_KategoryPdBioID])
    REFERENCES [dbo].[KategoryPdBio]
        ([KategoryPdBioID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieKategoryPdBioISPDn_KategoryPdBio'
CREATE INDEX [IX_FK_MnogieKategoryPdBioISPDn_KategoryPdBio]
ON [dbo].[MnogieKategoryPdBioISPDn]
    ([KategoryPdBio_KategoryPdBioID]);
GO

-- Creating foreign key on [ISPDnOperator_ISPDnOperatorID] in table 'MnogieKategoryPdDopISPDn'
ALTER TABLE [dbo].[MnogieKategoryPdDopISPDn]
ADD CONSTRAINT [FK_MnogieKategoryPdDopISPDn_ISPDnOperator]
    FOREIGN KEY ([ISPDnOperator_ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [KategoryPdDop_KategoryPdDopID] in table 'MnogieKategoryPdDopISPDn'
ALTER TABLE [dbo].[MnogieKategoryPdDopISPDn]
ADD CONSTRAINT [FK_MnogieKategoryPdDopISPDn_KategoryPdDop]
    FOREIGN KEY ([KategoryPdDop_KategoryPdDopID])
    REFERENCES [dbo].[KategoryPdDop]
        ([KategoryPdDopID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieKategoryPdDopISPDn_KategoryPdDop'
CREATE INDEX [IX_FK_MnogieKategoryPdDopISPDn_KategoryPdDop]
ON [dbo].[MnogieKategoryPdDopISPDn]
    ([KategoryPdDop_KategoryPdDopID]);
GO

-- Creating foreign key on [KategoryPd_KategoryPdID] in table 'MnogieKategoryPdOtdel'
ALTER TABLE [dbo].[MnogieKategoryPdOtdel]
ADD CONSTRAINT [FK_MnogieKategoryPdOtdel_KategoryPd]
    FOREIGN KEY ([KategoryPd_KategoryPdID])
    REFERENCES [dbo].[KategoryPd]
        ([KategoryPdID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [OtdelOrg_OtdelOrgID] in table 'MnogieKategoryPdOtdel'
ALTER TABLE [dbo].[MnogieKategoryPdOtdel]
ADD CONSTRAINT [FK_MnogieKategoryPdOtdel_OtdelOrg]
    FOREIGN KEY ([OtdelOrg_OtdelOrgID])
    REFERENCES [dbo].[OtdelOrg]
        ([OtdelOrgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieKategoryPdOtdel_OtdelOrg'
CREATE INDEX [IX_FK_MnogieKategoryPdOtdel_OtdelOrg]
ON [dbo].[MnogieKategoryPdOtdel]
    ([OtdelOrg_OtdelOrgID]);
GO

-- Creating foreign key on [ISPDnOperator_ISPDnOperatorID] in table 'MnogieKategoryPdSpecISPDn'
ALTER TABLE [dbo].[MnogieKategoryPdSpecISPDn]
ADD CONSTRAINT [FK_MnogieKategoryPdSpecISPDn_ISPDnOperator]
    FOREIGN KEY ([ISPDnOperator_ISPDnOperatorID])
    REFERENCES [dbo].[ISPDnOperator]
        ([ISPDnOperatorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [KategoryPdSpec_KategoryPdSpecID] in table 'MnogieKategoryPdSpecISPDn'
ALTER TABLE [dbo].[MnogieKategoryPdSpecISPDn]
ADD CONSTRAINT [FK_MnogieKategoryPdSpecISPDn_KategoryPdSpec]
    FOREIGN KEY ([KategoryPdSpec_KategoryPdSpecID])
    REFERENCES [dbo].[KategoryPdSpec]
        ([KategoryPdSpecID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieKategoryPdSpecISPDn_KategoryPdSpec'
CREATE INDEX [IX_FK_MnogieKategoryPdSpecISPDn_KategoryPdSpec]
ON [dbo].[MnogieKategoryPdSpecISPDn]
    ([KategoryPdSpec_KategoryPdSpecID]);
GO

-- Creating foreign key on [KategorySubj_KategorySubjID] in table 'MnogieOtdelSubj'
ALTER TABLE [dbo].[MnogieOtdelSubj]
ADD CONSTRAINT [FK_MnogieOtdelSubj_KategorySubj]
    FOREIGN KEY ([KategorySubj_KategorySubjID])
    REFERENCES [dbo].[KategorySubj]
        ([KategorySubjID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [OtdelOrg_OtdelOrgID] in table 'MnogieOtdelSubj'
ALTER TABLE [dbo].[MnogieOtdelSubj]
ADD CONSTRAINT [FK_MnogieOtdelSubj_OtdelOrg]
    FOREIGN KEY ([OtdelOrg_OtdelOrgID])
    REFERENCES [dbo].[OtdelOrg]
        ([OtdelOrgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieOtdelSubj_OtdelOrg'
CREATE INDEX [IX_FK_MnogieOtdelSubj_OtdelOrg]
ON [dbo].[MnogieOtdelSubj]
    ([OtdelOrg_OtdelOrgID]);
GO

-- Creating foreign key on [OtdelOrg_OtdelOrgID] in table 'MnogieRabotnikiOtdel'
ALTER TABLE [dbo].[MnogieRabotnikiOtdel]
ADD CONSTRAINT [FK_MnogieRabotnikiOtdel_OtdelOrg]
    FOREIGN KEY ([OtdelOrg_OtdelOrgID])
    REFERENCES [dbo].[OtdelOrg]
        ([OtdelOrgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RabotnikiOrg_RabotnikiOrgID] in table 'MnogieRabotnikiOtdel'
ALTER TABLE [dbo].[MnogieRabotnikiOtdel]
ADD CONSTRAINT [FK_MnogieRabotnikiOtdel_RabotnikiOrg]
    FOREIGN KEY ([RabotnikiOrg_RabotnikiOrgID])
    REFERENCES [dbo].[RabotnikiOrg]
        ([RabotnikiOrgID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MnogieRabotnikiOtdel_RabotnikiOrg'
CREATE INDEX [IX_FK_MnogieRabotnikiOtdel_RabotnikiOrg]
ON [dbo].[MnogieRabotnikiOtdel]
    ([RabotnikiOrg_RabotnikiOrgID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------