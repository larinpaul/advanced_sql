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

