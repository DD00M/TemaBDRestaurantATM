CREATE DATABASE Restaurant_ATM
ON PRIMARY
(
	Name = mta_data_1,
	FileName = 'D:\Dumitrascu_Andrei_TEMA_DB\ATM_mdata1.mdf',
	size = 10MB,
	maxsize = unlimited,
	filegrowth = 1GB
),
(
	Name = mta_data_2,
	FileName = 'D:\Dumitrascu_Andrei_TEMA_DB\ATM_ndata.ndf',
	size = 10MB,
	maxsize = unlimited,
	filegrowth = 1GB
),
(
	Name = mta_data_1_2,
	FileName = 'D:\Dumitrascu_Andrei_TEMA_DB\ATM_mdata1_2.mdf',
	size = 10MB,
	maxsize = unlimited,
	filegrowth = 1GB
)
LOG ON
(
	Name = mta_log_1,
	FileName = 'D:\Dumitrascu_Andrei_TEMA_DB\ATM_ldata1.ldf',
	size = 10MB,
	maxsize = unlimited,
	filegrowth = 1024MB
),
(
	Name = mta_log_2,
	FileName = 'D:\Dumitrascu_Andrei_TEMA_DB\ATM_ldata2.ldf',
	size = 10MB,
	maxsize = unlimited,
	filegrowth = 1024MB
)

USE Restaurant_ATM
IF OBJECT_ID('Produse','U') IS NOT NULL
DROP TABLE Produse
CREATE TABLE [Produse]
(
	[ID Produs] int IDENTITY(1,1),
	[Nume produs] nvarchar(32) NOT NULL,
	[ID Categorie Produs] int NOT NULL,
	Pret int NOT NULL,
	Stoc int NOT NULL
)

IF OBJECT_ID('Categorie Produs','U') IS NOT NULL
DROP TABLE [Categorie Produs]
CREATE TABLE [Categorie Produs]
(
	[ID Categorie Produs] int IDENTITY(1,1),
	Nume nvarchar(32) NOT NULL
)

IF OBJECT_ID('Comanda Client','U') IS NOT NULL
DROP TABLE [Comanda Client]
CREATE TABLE [Comanda Client]
(
	[ID Comanda] int IDENTITY(1,1),
	[ID Categorie Produs] int NOT NULL,
	[ID Client] int NOT NULL,
	[ID Livrare] int NOT NULL,
)

ALTER TABLE [Comanda Client]
ADD [ID Livrator] int NOT NULL

IF OBJECT_ID('Comanda Detalii','U') IS NOT NULL
DROP TABLE [Comanda Detalii]
CREATE TABLE [Comanda Detalii]
(
	--[ID detalii comanda]
	[ID Comanda] int NOT NULL,
	[ID Produs] int NOT NULL,
	Cantitate int NOT NULL,
	Pret int,
	[ID Discount] int
)

ALTER TABLE [Comanda Detalii]
ADD [ID Detalii Comanda] int IDENTITY(1,1)

IF OBJECT_ID('Discount','U') IS NOT NULL
DROP TABLE Discount
CREATE TABLE Discount
(
	[ID Discount] int IDENTITY(1,1),
	Nume nvarchar(32) NOT NULL--Tip discount int not null
)

ALTER TABLE Discount
DROP COLUMN Nume

ALTER TABLE Discount
ADD [Tip Discount] decimal(18,2) NOT NULL

IF OBJECT_ID('Angajati','U') IS NOT NULL
DROP TABLE Angajati
CREATE TABLE Angajati
(
	[ID Angajat] int IDENTITY(1,1),
	Nume nvarchar(32) NOT NULL,
	Prenume nvarchar(64) NOT NULL,
	CNP nvarchar(32) NOT NULL,
	Sex nvarchar(32) NOT NULL
	--data nasterii
)

--INSERT INTO Angajati (Nume, Prenume, CNP, Sex, [Data Nasterii]) VALUES
--('Enache', 'Stefan', '5020903160031', 'Masculin', '2002-09-03'),
--('Mitran', 'Luca', '5010101010102', 'Masculin', '2001-01-02'),
--('Dicu', 'Andrei', '5011001284567', 'Masculin', '2001-04-06')

ALTER TABLE Angajati
ADD [Data Nasterii] date

ALTER TABLE Angajati
ALTER COLUMN [Data Nasterii] date NOT NULL

IF OBJECT_ID('Functie','U') IS NOT NULL
DROP TABLE Functie
CREATE TABLE Functie
(
	[ID Functie] int IDENTITY(1,1),
	Nume nvarchar(32) NOT NULL,
	[ID Salariu] int NOT NULL
)

IF OBJECT_ID('Functie Angajati','U') IS NOT NULL
DROP TABLE [Functie Angajati]
CREATE TABLE [Functie Angajati]
(
	[ID FUNCTIE ANGAJAT] int IDENTITY(1,1),
	[ID Angajat] int NOT NULL,
	[ID Functie] int NOT NULL,
	--id sef angajat int,
	[Data intrare in functie] date NOT NULL,
	[Data iesire din functie] date
)

ALTER TABLE [Functie Angajati]
ADD [ID Sef] int

IF OBJECT_ID('Salariu','U') IS NOT NULL
DROP TABLE Salariu
CREATE TABLE Salariu
(
	[ID Salariu]  int IDENTITY(1,1),
	[Salariu brut] int NOT NULL,
	[Data intrare in vigoare] date NOT NULL,
	[Data iesire din vigoare] date,
	[Impozit venit] int,
	[Impozit sanatate] int
)

ALTER TABLE Salariu
ALTER COLUMN [Impozit venit] int NOT NULL

ALTER TABLE Salariu
ALTER COLUMN [Impozit sanatate] int NOT NULL

IF OBJECT_ID('Clienti','U') IS NOT NULL
DROP TABLE Clienti
CREATE TABLE Clienti
(
	[ID Client] int IDENTITY(1,1),
	Nume nvarchar(32) NOT NULL,
	Prenume nvarchar(64) NOT NULL,
	[ID Tip Client] int NOT NULL,
	CNP nvarchar(32) NOT NULL,
	Sex nvarchar(32) NOT NULL
)

IF OBJECT_ID('Tip Clienti','U') IS NOT NULL
DROP TABLE [Tip Clienti]
CREATE TABLE [Tip Clienti]
(
	[ID Tip Client] int IDENTITY(1,1),
	[Tip Client] nvarchar(16)
)

IF OBJECT_ID('Loc Livrare','U') IS NOT NULL
DROP TABLE [Loc livrare]
CREATE TABLE [Loc livrare]
(
	[ID] int IDENTITY(1,1),
	[Cladire] nvarchar(32) NOT NULL,
)

IF OBJECT_ID('Tip Materie Prima','U') IS NOT NULL
DROP TABLE [Tip Materie Prima]
CREATE TABLE [Tip Materie Prima]
(
	[ID Tip Materie Prima] int IDENTITY(1,1) NOT NULL,
	[Nume Tip] nvarchar(32)
)

IF OBJECT_ID('Materie Prima','U') IS NOT NULL
DROP TABLE [Materie prima]
CREATE TABLE [Materie prima]
(
	[ID Marfa] int IDENTITY(1,1),
	[ID Loc Aprovizionare] int,
	[Nume produs] nvarchar(32) NOT NULL,
	Cantintate int NOT NULL
)

ALTER TABLE [Materie prima]
ADD [ID Tip Materie Prima] int not null

IF OBJECT_ID('Loc Aprovizionare','U') IS NOT NULL
DROP TABLE [Loc Aprovizionare]
CREATE TABLE [Loc Aprovizionare]
(
	[ID Localitate] int IDENTITY(1,1),
	Nume nvarchar(32) NOT NULL,
	Firma nvarchar(32) NOT NULL
)

IF OBJECT_ID('Provenienta Materiale','U') IS NOT NULL
DROP TABLE [Provenienta Materiale]
CREATE TABLE [Provenienta Materiale]
(
	[ID Localitate] int IDENTITY(1,1),
	Nume nvarchar(32) NOT NULL,
	Firma nvarchar(32) NOT NULL
)

IF OBJECT_ID('Materiale','U') IS NOT NULL
DROP TABLE Materiale
CREATE TABLE Materiale
(
	[ID Material] int IDENTITY(1,1),
	[ID Loc Cumparare] int,
	[Nume material] nvarchar(32) NOT NULL,
	Cantitate int NOT NULL
)

IF OBJECT_ID('Utilitati','U') IS NOT NULL
DROP TABLE Utilitati
CREATE TABLE Utilitati
(
	[ID Utilitati] int IDENTITY(1,1),
	[ID Sursa] int,
	[Nume Utilitate] nvarchar(32) NOT NULL,
)

IF OBJECT_ID('Sursa Utilitati','U') IS NOT NULL
DROP TABLE [Sursa Utilitati]
CREATE TABLE [Sursa Utilitati]
(
	[ID Sursa] int IDENTITY(1,1),
	[Nume Sursa] nvarchar(32) NOT NULL,
	[Nume Firma] nvarchar(32) NOT NULL
)

IF OBJECT_ID('Livratori','U') IS NOT NULL
DROP TABLE Livratori
CREATE TABLE Livratori
(
	[ID Livrator] int identity(1,1),
	[Nume firma] nvarchar(32) NOT NULL,
	[Numar telefon] nvarchar(10) NOT NULL,
)
