-- ========================================
-- BASIC QUERIES
-- Universe Database
-- ========================================

-- 1. List all galaxies
SELECT *
FROM galaxy;


-- 2. List all stars in a specific galaxy
SELECT s.name AS star_name
FROM star s
JOIN galaxy g ON s.galaxy_id = g.galaxy_id
WHERE g.name = 'Milky Way';


-- 3. List all planets orbiting a specific star
SELECT p.name AS planet_name
FROM planet p
JOIN star s ON p.star_id = s.star_id
WHERE s.name = 'Sun';


-- 4. List all moons of a specific planet
SELECT m.name AS moon_name
FROM moon m
JOIN planet p ON m.planet_id = p.planet_id
WHERE p.name = 'Earth';


-- 5. List all habitable planets
SELECT name
FROM planet
WHERE has_life = true;


-- 6. Count total number of planets
SELECT COUNT(*) AS total_planets
FROM planet;
