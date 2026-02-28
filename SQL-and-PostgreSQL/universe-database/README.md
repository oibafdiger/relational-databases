# 🌌 Universe Database (PostgreSQL)

A relational database modeling galaxies, stars, planets, and moons.

This project was built using PostgreSQL and demonstrates relational database design, constraints, foreign keys, and advanced SQL queries.

---

## 📚 Project Overview

The **Universe Database** models a hierarchical astronomical structure:

- A galaxy contains multiple stars
- A star contains multiple planets
- A planet contains multiple moons

The project focuses on proper relational database design and clean SQL querying.

---

## 🗄️ Database Schema

### Main Tables

- `galaxy`
- `star`
- `planet`
- `moon`

### Key Features

- Primary Keys (`table_name_id`)
- Foreign Keys with referential integrity
- NOT NULL constraints
- UNIQUE constraints
- Multiple data types:
  - `INT`
  - `NUMERIC`
  - `VARCHAR`
  - `TEXT`
  - `BOOLEAN`
- CHECK constraints (optional enhancement)
- Aggregations & multi-table JOIN queries

---

## 🔗 Relationships

Galaxy → Star → Planet → Moon


- Each **star** references a galaxy
- Each **planet** references a star
- Each **moon** references a planet

---

## 📊 Example Queries

### 1. All planets in the Milky Way

```sql
SELECT p.name
FROM planet p
JOIN star s ON p.star_id = s.star_id
JOIN galaxy g ON s.galaxy_id = g.galaxy_id
WHERE g.name = 'Milky Way';
2. Number of planets per star
SELECT s.name AS star,
       COUNT(p.planet_id) AS number_of_planets
FROM star s
LEFT JOIN planet p ON s.star_id = p.star_id
GROUP BY s.name
ORDER BY number_of_planets DESC;

3. Planets with more than 3 moons
SELECT p.name,
       COUNT(m.moon_id) AS moon_count
FROM planet p
JOIN moon m ON p.planet_id = m.planet_id
GROUP BY p.name
HAVING COUNT(m.moon_id) > 3;

4. Percentage of habitable planets
SELECT 
  ROUND(
    100.0 * SUM(CASE WHEN has_life THEN 1 ELSE 0 END)
    / COUNT(*),
  2) AS habitable_percentage
FROM planet;

🛠️ How to Run Locally
psql --username=freecodecamp --dbname=postgres
CREATE DATABASE universe;
\c universe
\l universe.sql

