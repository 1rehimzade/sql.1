CREATE DATABASE PLAYLISTS;
USE PLAYLISTS;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(50),
    Gender VARCHAR(10)
);

INSERT INTO Users (UserID, Name, Surname, Username, Password, Gender)
VALUES
    (1, 'Shamama', 'Guliyeva', 'CrazyCAT', 'kod1234', 'Famale'),
    (2, 'Asiman', 'Yaddancixdiyev', 'BackEndDDeveloper', 'KOD333', 'Male'),
    (3, 'Zulu', 'hmmmmmzade', 'WHYCAT', 'kod12345', 'Famale'),
    (4, 'Nihat', 'Rehimzade', 'ComeBAck', '1.rehimzade', 'Male');

CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(255),
    Surname VARCHAR(255),
    Birthday DATE,
    Gender VARCHAR(10)
);

INSERT INTO Artists (ArtistID, Name, Surname, Birthday, Gender)
VALUES
    (1, 'Billie', 'eilish', '1988-05-05', 'Female'),
    (2, 'Mashadibaba', 'Aydamirov', '1991-02-17', 'Male');

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(255)
);

INSERT INTO Categories (CategoryID, Name)
VALUES
    (1, 'Pop'),
    (2, 'Meyxana');

CREATE TABLE Musics (
    MusicID INT PRIMARY KEY,
    Name VARCHAR(255),
    Duration INT,
    CategoryID INT,
    ArtistID INT
);

INSERT INTO Musics (MusicID, Name, Duration, CategoryID, ArtistID)
VALUES
    (1, 'everything i want', 295, 1, 1),
    (2, 'Goturub Aparram seni', 234, 1, 2),
    (3, 'Bury a Friend', 228, 1, 1),
    (4, 'Ruzigar icinde', 281, 1, 2);

CREATE VIEW MusicInfo  
AS
SELECT
    M.Name AS [Mahnı Adı],
    M.Duration AS [Uzunluq (saniyə)],
    C.Name AS [Kateqoriya],
    CONCAT(A.Name, ' ', A.Surname) AS [Songer]
FROM
    Musics M
    JOIN Categories C ON M.CategoryID = C.CategoryID
    JOIN Artists A ON M.ArtistID = A.ArtistID;