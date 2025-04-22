----- Eladások száma eladónként
SELECT e.nev AS elado_nev, COUNT(*) AS eladasok_szama
FROM Eladasok el
JOIN Eladok e ON el.elado_id = e.elado_id
GROUP BY e.nev;
---Autók száma márkánként (több mint 2)
SELECT marka, COUNT(*) AS autok_szama
FROM Autok
GROUP BY marka
having count(*) >= 2;

----- Eladások sorrendje időrendben, rangsorolva
SELECT 
    RANK() OVER (ORDER BY eladas_datum) AS eladas_rang,
    eladas_id,
    elado_id,
    eladas_datum
FROM Eladasok;

------ Eladók teljesítménye összesített értékesítéssel
SELECT 
    elado_id,
    eladas_ar,
    SUM(eladas_ar) OVER (PARTITION BY elado_id) AS osszes_eladas
FROM Eladasok;
-------- Összesített eladások eladóként és végösszegként
SELECT 
    e.nev AS elado_nev,
    SUM(el.eladas_ar) AS osszeg
FROM Eladasok el
JOIN Eladok e ON el.elado_id = e.elado_id
GROUP BY ROLLUP(e.nev);

---------- Szervizköltség autók szerint
SELECT 
    a.marka + ' ' + a.tipus AS auto,
    SUM(s.koltseg) AS osszes_szerviz_koltseg
FROM Szervizek s
JOIN Autok a ON s.auto_id = a.auto_id
GROUP BY a.marka, a.tipus;
---------Ugyanaz (SQLLiteonline)
SELECT 
    a.marka || ' ' || a.tipus AS auto,
    SUM(s.koltseg) AS osszes_szerviz_koltseg
FROM Szervizek s
JOIN Autok a ON s.auto_id = a.auto_id
GROUP BY a.marka, a.tipus;
--------- Autók, ahol a szervizköltség nagyobb, mint az átlag 
SELECT 
    a.marka + ' ' + a.tipus AS auto,
    SUM(s.koltseg) AS osszes_szerviz_koltseg
FROM Szervizek s
JOIN Autok a ON s.auto_id = a.auto_id
GROUP BY a.auto_id
HAVING SUM(s.koltseg) > (
    SELECT AVG(koltseg)
    FROM Szervizek
);
--------Ugyanaz (SQLLiteonline)
SELECT 
    a.marka || ' ' || a.tipus AS auto,
    SUM(s.koltseg) AS osszes_szerviz_koltseg
FROM Szervizek s
JOIN Autok a ON s.auto_id = a.auto_id
GROUP BY a.auto_id
HAVING SUM(s.koltseg) > (
    SELECT AVG(koltseg)
    FROM Szervizek
);