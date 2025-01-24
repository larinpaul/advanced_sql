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



