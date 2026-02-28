-- ========================================
-- ADVANCED QUERIES
-- Universe Database
-- ========================================

-- 1. Number of planets per star
SELECT s.name AS star,
       COUNT(p.planet_id) AS number_of_planets
FROM star s
LEFT JOIN planet p ON s.star_id = p.star_id
GROUP BY s.name
ORDER BY number_of_planets DESC;


-- 2. Planets with more than 3 moons
SELECT p.name AS planet,
       COUNT(m.moon_id) AS moon_count
FROM planet p
JOIN moon m ON p.planet_id = m.planet_id
GROUP BY p.name
HAVING COUNT(m.moon_id) > 3
ORDER BY moon_count DESC;


-- 3. Stars without planets
SELECT s.name AS star_without_planets
FROM star s
LEFT JOIN planet p ON s.star_id = p.star_id
WHERE p.planet_id IS NULL;


-- 4. Percentage of habitable planets
SELECT 
  ROUND(
    100.0 * SUM(CASE WHEN has_life THEN 1 ELSE 0 END)
    / COUNT(*),
  2) AS habitable_percentage
FROM planet;


-- 5. Galaxy statistics (stars, planets, moons)
SELECT g.name AS galaxy,
       COUNT(DISTINCT s.star_id) AS total_stars,
       COUNT(DISTINCT p.planet_id) AS total_planets,
       COUNT(DISTINCT m.moon_id) AS total_moons
FROM galaxy g
LEFT JOIN star s ON g.galaxy_id = s.galaxy_id
LEFT JOIN planet p ON s.star_id = p.star_id
LEFT JOIN moon m ON p.planet_id = m.planet_id
GROUP BY g.name
ORDER BY total_planets DESC;


-- 6. Average number of moons per planet
SELECT AVG(moon_count) AS avg_moons_per_planet
FROM (
    SELECT COUNT(m.moon_id) AS moon_count
    FROM planet p
    LEFT JOIN moon m ON p.planet_id = m.planet_id
    GROUP BY p.planet_id
) subquery;
