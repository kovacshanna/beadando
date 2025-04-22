CREATE TABLE Eladok (
    elado_id INTEGER PRIMARY KEY,
    nev TEXT NOT NULL,
    telefon TEXT
);

CREATE TABLE Ugyfelek (
    ugyfel_id INTEGER PRIMARY KEY,
    nev TEXT NOT NULL,
    email TEXT,
    telefon TEXT,
    cim TEXT
);

CREATE TABLE Autok (
    auto_id INTEGER PRIMARY KEY,
    marka TEXT NOT NULL,
    tipus TEXT NOT NULL,
    evjarat INTEGER,
    szin TEXT,
    ar REAL,
    elerheto INTEGER DEFAULT 1 
);

CREATE TABLE Eladasok (
    eladas_id INTEGER PRIMARY KEY,
    auto_id INTEGER,
    ugyfel_id INTEGER,
    elado_id INTEGER,
    eladas_datum TEXT,
    eladas_ar REAL,
    FOREIGN KEY (auto_id) REFERENCES Autok(auto_id),
    FOREIGN KEY (ugyfel_id) REFERENCES Ugyfelek(ugyfel_id),
    FOREIGN KEY (elado_id) REFERENCES Eladok(elado_id)
);

CREATE TABLE Szervizek (
    szerviz_id INTEGER PRIMARY KEY,
    auto_id INTEGER,
    datum TEXT,
    leiras TEXT,
    koltseg REAL,
    FOREIGN KEY (auto_id) REFERENCES Autok(auto_id)
);

INSERT INTO Eladok (nev, telefon) VALUES
('Kovács Béla', '06201234567'),
('Nagy Anna', '06209876543'),
('Tóth Zsolt', '06201118888'),
('Farkas Dóra', '06202345678'),
('Oláh Márk', '06203456789');

INSERT INTO Ugyfelek (nev, email, telefon, cim) VALUES
('Szabó László', 'szabo@gmail.com', '06201112222', 'Budapest, Fő utca 12'),
('Kiss Éva', 'kiss.eva@gmail.com', '06202223333', 'Debrecen, Kossuth u. 45'),
('Horváth Gábor', 'gabor.h@gmail.com', '06203334444', 'Győr, Bartók B. út 3'),
('Németh Katalin', 'kati.nemeth@gmail.com', '06204445555', 'Pécs, Rózsa u. 14'),
('Varga János', 'varga.j@gmail.com', '06205556666', 'Szeged, Tavasz tér 1'),
('Fekete Eszter', 'eszterfekete@gmail.com', '06206667777', 'Miskolc, Akácos utca 7'),
('Simon Balázs', 'balazs.s@gmail.com', '06207778888', 'Nyíregyháza, Kert u. 9'),
('Kovács Noémi', 'noemi.kovacs@gmail.com', '06208889999', 'Eger, Dobó tér 2'),
('Tóth András', 'andras.t@gmail.com', '06209990000', 'Zalaegerszeg, Béke u. 5'),
('Lakatos Nóra', 'nora.lakatos@gmail.com', '06201010101', 'Szolnok, Hársfa utca 20');

INSERT INTO Autok (marka, tipus, evjarat, szin, ar, elerheto) VALUES
('Toyota', 'Corolla', 2018, 'Fehér', 3200000, 1),
('Toyota', 'Corolla', 2019, 'Kék', 3300000, 1),
('Toyota', 'Corolla', 2020, 'Fekete', 3500000, 1),
('BMW', '320d', 2020, 'Fekete', 5600000, 1),
('BMW', '320d', 2019, 'Szürke', 5300000, 1),
('Ford', 'Focus', 2017, 'Kék', 2800000, 1),
('Ford', 'Focus', 2018, 'Fehér', 2900000, 1),
('Opel', 'Astra', 2019, 'Szürke', 3500000, 1),
('Volkswagen', 'Golf', 2021, 'Piros', 4100000, 1),
('Volkswagen', 'Golf', 2020, 'Fekete', 3900000, 1),
('Audi', 'A4', 2018, 'Fehér', 4700000, 1),
('Skoda', 'Octavia', 2020, 'Fekete', 3900000, 1),
('Renault', 'Megane', 2016, 'Kék', 2700000, 1),
('Hyundai', 'i30', 2022, 'Zöld', 4600000, 1),
('Mazda', '3', 2019, 'Sárga', 3300000, 1),
('Peugeot', '308', 2018, 'Piros', 3100000, 1),
('Peugeot', '308', 2019, 'Kék', 3200000, 1),
('Kia', 'Ceed', 2020, 'Szürke', 3400000, 1),
('Honda', 'Civic', 2021, 'Fehér', 3600000, 1),
('Honda', 'Civic', 2020, 'Fekete', 3550000, 1);

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
(1, '2023-12-01', 'Olajcsere', 20000),
(2, '2024-01-15', 'Féktárcsa csere', 55000),
(3, '2024-02-01', 'Olajcsere', 21000),
(4, '2024-02-10', 'Kuplung csere', 95000),
(5, '2024-03-01', 'Akkumulátor csere', 40000),
(6, '2024-03-10', 'Olajcsere és szűrőcsere', 30000),
(7, '2024-03-15', 'Fényszóró javítás', 15000),
(8, '2024-03-20', 'Olajcsere', 22000),
(9, '2024-03-25', 'Klímatöltés', 25000),
(10, '2024-04-01', 'Futómű beállítás', 22000),
(11, '2024-04-05', 'Olajcsere', 20000),
(12, '2024-04-10', 'Féktárcsa csere', 56000),
(13, '2024-04-15', 'Szűrők cseréje', 27000),
(14, '2024-04-20', 'Akkumulátor csere', 42000),
(15, '2024-04-25', 'Klímatöltés', 26000),
(16, '2024-05-01', 'Olajcsere', 21000),
(17, '2024-05-05', 'Futómű beállítás', 23000),
(18, '2024-05-10', 'Fényszóró javítás', 18000),
(19, '2024-05-15', 'Szűrők cseréje', 29000),
(20, '2024-05-20', 'Olajcsere', 22000);


