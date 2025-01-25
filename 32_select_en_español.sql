-- 2025 01 24

-- SELECT basic/es


-- Presentamos la tabla world de países

SELECT population FROM world
    WHERE name = 'France';


-- Scandinavia
SELECT name, population FROM world
    WHERE name IN ('Brazil', 'Russia', 'India', 'China');


-- Just the right size
SELECT name, area FROM world
    WHERE area BETWEEN 250000 AND 300000;


-- Auf Deutsch
-- https://sqlzoo.net/wiki/SELECT_basics/de

-- Contents -- hide
-- 1 Einführung in die Arbeit mit der Tabelle der BBC-Länderprofile
-- 2 Pro-Kopf-Einkommen
-- 3 Klein und reich
-- 4 Skandinavien
-- 5 Fängt mit G an
-- 6 Genau die richtige Größe


-- Einführung in die Arbeit mit der Tabelle der BBC-Länderprofile
-- Dieses Tutorium stellst SQL als Abfragesprache vor.
-- Die SELECT-Anweisung wird am Beispiel der Tabelle bbc demonstriert.
-- Zusammenfassung


-- 1.
-- Bas Beispiel zeigt die Bevölkerungszahl von Frankreich ('France').
-- Zeichketten (String) sind mit 'einfachem Hochkomma' anzugeben.
-- Zeige die Bevölkerungszahl von Deutschland ('Germany').
SELECT population FROM bbc
    WHERE name = 'France';


-- Pro-Kopf-Einkommen
-- 2.
-- Diese Abfrage zeight die Bevölkerungsdichte (population/area)
-- jedes Landes mit einer Fläche größer als 5.000.000 km^2.
-- Zeige das Pro-Kopf-Einkommen (gdp/population)
-- für jedes Land mit einer Fläche größer als 5.000.000 km^2.
SELECT name, population/area FROM bbc
    WHERE area > 5000000


-- Klein und reich
-- 3.
-- Welche Länder sind sowoch sehr klein auch sehr reich?
-- Wir verwenden AND um sicherzustellen, dass nur dann ein Ergebnis geliefert wird,
-- wenn alle (Teil-)Bedingungen wahr sind.
-- Das Beispiel zeight die Länder mit geringer Bevölkerungszahl
-- und hohem Buttoinlandsprodukt (GRP).
-- Zeige die Names (name) und Regionen (region) der Länder
-- mit einer Fläche (area) kleiner 2.000 km^2
-- und einem Bruttoninlandsprodukt größer als 5 Milliardern (= 5.000.000.000).
SELECT name, region
    FROM bbc
    WHERE population < 2000000
        AND gdp > 5000000000


-- Skandinavien
-- 4.
-- Mit dem Wort IN können wir prüfen,
-- ob ein Element Bestandteil einer (Werte-)Liste ist.
-- Das Beispiel zeigt Ländernamen (name) und Bevölkerungszahl (population)
-- der Länder Irland('Ireland'), Island ('Iceland') und Dänemark('Denmark').
-- Zeige Ländernamen und Bevölkerungszahlen der folgenden Länder:
-- 'Denmark', 'Finland', 'Norway', 'Sweden'.
SELECT name, population FROM bbc
    WHERE name IN ('Ireland', 'Iceland', 'Denmark')


-- Fängt mit G an
-- 5.
-- Welche Ländernamen beginnen mit dem Buchstaben G?
-- Das Wort LIKE ermöglicht einen Mustervergleich.
-- Das Prozentzeichen (%) ist der Platzhalter (Wildcard).
-- Das Beispiel zeight Länder, deren Namen mit dem Buchstaben D beginnen.
-- Zeige Länder, deren Namen mit dem Buchstaben G beginnen.
SELECT name FROM bbc
    WHERE name LIKE 'D%'


-- Genau die richtige Größe
-- 6.
-- Welche Länder sind weder zu klein noch zu groß?
-- BE

