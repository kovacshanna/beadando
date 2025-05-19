
CREATE TABLE Eladok (
    elado_id INT PRIMARY KEY IDENTITY(1,1),
    nev NVARCHAR(100) NOT NULL,
    telefon NVARCHAR(20)
);

CREATE TABLE Ugyfelek (
    ugyfel_id INT PRIMARY KEY IDENTITY(1,1),
    nev NVARCHAR(100) NOT NULL,
    email NVARCHAR(100),
    telefon NVARCHAR(20),
    cim NVARCHAR(200)
);

CREATE TABLE Autok (
    auto_id INT PRIMARY KEY IDENTITY(1,1),
    marka NVARCHAR(50) NOT NULL,
    tipus NVARCHAR(50) NOT NULL,
    evjarat INT,
    szin NVARCHAR(30),
    ar FLOAT,
    elerheto BIT DEFAULT 1
);

CREATE TABLE Eladasok (
    eladas_id INT PRIMARY KEY IDENTITY(1,1),
    auto_id INT,
    ugyfel_id INT,
    elado_id INT,
    eladas_datum DATE,
    eladas_ar FLOAT,
    FOREIGN KEY (auto_id) REFERENCES Autok(auto_id),
    FOREIGN KEY (ugyfel_id) REFERENCES Ugyfelek(ugyfel_id),
    FOREIGN KEY (elado_id) REFERENCES Eladok(elado_id)
);

CREATE TABLE Szervizek (
    szerviz_id INT PRIMARY KEY IDENTITY(1,1),
    auto_id INT,
    datum DATE,
    leiras NVARCHAR(255),
    koltseg FLOAT,
    FOREIGN KEY (auto_id) REFERENCES Autok(auto_id)
);

INSERT INTO Eladok (nev, telefon) VALUES
(N'Kovács Béla', '06201234567'),
(N'Nagy Anna', '06209876543'),
(N'Tóth Zsolt', '06201118888'),
(N'Farkas Dóra', '06202345678'),
(N'Oláh Márk', '06203456789');

INSERT INTO Ugyfelek (nev, email, telefon, cim) VALUES
(N'Szabó László', 'szabo@gmail.com', '06201112222', N'Budapest, Fő utca 12'),
(N'Kiss Éva', 'kiss.eva@gmail.com', '06202223333', N'Debrecen, Kossuth u. 45'),
(N'Horváth Gábor', 'gabor.h@gmail.com', '06203334444', N'Győr, Bartók B. út 3'),
(N'Németh Katalin', 'kati.nemeth@gmail.com', '06204445555', N'Pécs, Rózsa u. 14'),
(N'Varga János', 'varga.j@gmail.com', '06205556666', N'Szeged, Tavasz tér 1'),
(N'Fekete Eszter', 'eszterfekete@gmail.com', '06206667777', N'Miskolc, Akácos utca 7'),
(N'Simon Balázs', 'balazs.s@gmail.com', '06207778888', N'Nyíregyháza, Kert u. 9'),
(N'Kovács Noémi', 'noemi.kovacs@gmail.com', '06208889999', N'Eger, Dobó tér 2'),
(N'Tóth András', 'andras.t@gmail.com', '06209990000', N'Zalaegerszeg, Béke u. 5'),
(N'Lakatos Nóra', 'nora.lakatos@gmail.com', '06201010101', N'Szolnok, Hársfa utca 20');

INSERT INTO Autok (marka, tipus, evjarat, szin, ar, elerheto) VALUES
(N'Toyota', N'Corolla', 2018, N'Fehér', 3200000, 1),
(N'Toyota', N'Corolla', 2019, N'Kék', 3300000, 1),
(N'Toyota', N'Corolla', 2020, N'Fekete', 3500000, 1),
(N'BMW', N'320d', 2020, N'Fekete', 5600000, 1),
(N'BMW', N'320d', 2019, N'Szürke', 5300000, 1),
(N'Ford', N'Focus', 2017, N'Kék', 2800000, 1),
(N'Ford', N'Focus', 2018, N'Fehér', 2900000, 1),
(N'Opel', N'Astra', 2019, N'Szürke', 3500000, 1),
(N'Volkswagen', N'Golf', 2021, N'Piros', 4100000, 1),
(N'Volkswagen', N'Golf', 2020, N'Fekete', 3900000, 1),
(N'Audi', N'A4', 2018, N'Fehér', 4700000, 1),
(N'Skoda', N'Octavia', 2020, N'Fekete', 3900000, 1),
(N'Renault', N'Megane', 2016, N'Kék', 2700000, 1),
(N'Hyundai', N'i30', 2022, N'Zöld', 4600000, 1),
(N'Mazda', N'3', 2019, N'Sárga', 3300000, 1),
(N'Peugeot', N'308', 2018, N'Piros', 3100000, 1),
(N'Peugeot', N'308', 2019, N'Kék', 3200000, 1),
(N'Kia', N'Ceed', 2020, N'Szürke', 3400000, 1),
(N'Honda', N'Civic', 2021, N'Fehér', 3600000, 1),
(N'Honda', N'Civic', 2020, N'Fekete', 3550000, 1);


INSERT INTO Eladasok (auto_id, ugyfel_id, elado_id, eladas_datum, eladas_ar) VALUES
(1, 1, 1, '2024-05-10', 3100000),
(2, 2, 1, '2024-05-12', 3200000),
(3, 3, 2, '2024-06-01', 3400000),
(4, 4, 2, '2024-06-03', 5400000),
(5, 5, 3, '2024-06-10', 5200000),
(6, 6, 3, '2024-06-12', 2750000),
(7, 7, 4, '2024-06-15', 2850000),
(8, 8, 4, '2024-06-18', 3450000),
(9, 9, 5, '2024-06-20', 4000000),
(10, 10, 5, '2024-06-22', 3800000),
(11, 1, 1, '2024-06-24', 3950000),
(12, 2, 1, '2024-06-26', 4650000),
(13, 3, 2, '2024-06-28', 2600000),
(14, 4, 2, '2024-06-30', 4500000),
(15, 5, 3, '2024-07-01', 3150000),
(16, 6, 3, '2024-07-02', 3250000),
(17, 7, 4, '2024-07-03', 3350000),
(18, 8, 4, '2024-07-04', 3500000),
(19, 9, 5, '2024-07-05', 3600000),
(20, 10, 5, '2024-07-06', 3450000);

INSERT INTO Szervizek (auto_id, datum, leiras, koltseg) VALUES
(1, '2023-12-01', N'Olajcsere', 20000),
(2, '2024-01-15', N'Féktárcsa csere', 55000),
(3, '2024-02-01', N'Olajcsere', 21000),
(4, '2024-02-10', N'Kuplung csere', 95000),
(5, '2024-03-01', N'Akkumulátor csere', 40000),
(6, '2024-03-10', N'Olajcsere és szűrőcsere', 30000),
(7, '2024-03-15', N'Fényszóró javítás', 15000),
(8, '2024-03-20', N'Olajcsere', 22000),
(9, '2024-03-25', N'Klímatöltés', 25000),
(10, '2024-04-01', N'Futómű beállítás', 22000),
(11, '2024-04-05', N'Olajcsere', 20000),
(12, '2024-04-10', N'Féktárcsa csere', 56000),
(13, '2024-04-15', N'Szűrők cseréje', 27000),
(14, '2024-04-20', N'Akkumulátor csere', 42000),
(15, '2024-04-25', N'Klímatöltés', 26000),
(16, '2024-05-01', N'Olajcsere', 21000),
(17, '2024-05-05', N'Futómű beállítás', 23000),
(18, '2024-05-10', N'Fényszóró javítás', 18000),
(19, '2024-05-15', N'Szűrők cseréje', 29000),
(20, '2024-05-20', N'Olajcsere', 22000);
