CREATE TABLE Eladok (
    elado_id INT PRIMARY KEY,
    nev NVARCHAR(100) NOT NULL,
    telefon NVARCHAR(20)
);

CREATE TABLE Ugyfelek (
    ugyfel_id INT PRIMARY KEY,
    nev NVARCHAR(100) NOT NULL,
    email NVARCHAR(100),
    telefon NVARCHAR(20),
    cim NVARCHAR(200)
);

CREATE TABLE Autok (
    auto_id INT PRIMARY KEY,
    marka NVARCHAR(50) NOT NULL,
    tipus NVARCHAR(50) NOT NULL,
    evjarat INT,
    szin NVARCHAR(30),
    ar FLOAT,
    elerheto BIT DEFAULT 1
);

CREATE TABLE Eladasok (
    eladas_id INT PRIMARY KEY,
    auto_id INT FOREIGN KEY REFERENCES Autok(auto_id),
    ugyfel_id INT FOREIGN KEY REFERENCES Ugyfelek(ugyfel_id),
    elado_id INT FOREIGN KEY REFERENCES Eladok(elado_id),
    eladas_datum DATE,
    eladas_ar FLOAT
);

CREATE TABLE Szervizek (
    szerviz_id INT PRIMARY KEY,
    auto_id INT FOREIGN KEY REFERENCES Autok(auto_id),
    datum DATE,
    leiras NVARCHAR(500),
    koltseg FLOAT
);
