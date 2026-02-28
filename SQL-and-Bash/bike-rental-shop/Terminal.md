**camper: /project$ echo hello terminal**

**hello terminal**

**camper: /project$ psql --username=freecodecamp --dbname=postgres**

**Border style is 2.**

**Title is " ".**

**Pager usage is off.**

**psql (12.22 (Ubuntu 12.22-0ubuntu0.20.04.4))**

**Type "help" for help.**



**postgres=> \\l**

                               **List of databases**

**+-----------+----------+----------+---------+---------+-----------------------+**

**|   Name    |  Owner   | Encoding | Collate |  Ctype  |   Access privileges   |**

**+-----------+----------+----------+---------+---------+-----------------------+**

**| postgres  | postgres | UTF8     | C.UTF-8 | C.UTF-8 |                       |**

**| template0 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|**

**|           |          |          |         |         | postgres=CTc/postgres |**

**| template1 | postgres | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|**

**|           |          |          |         |         | postgres=CTc/postgres |**

**+-----------+----------+----------+---------+---------+-----------------------+**

**(3 rows)**



**postgres=> CREATE DATABASE bikes;**

**CREATE DATABASE**

**postgres=> \\l**

                                 **List of databases**

**+-----------+--------------+----------+---------+---------+-----------------------+**

**|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |**

**+-----------+--------------+----------+---------+---------+-----------------------+**

**| bikes     | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |**

**| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |**

**| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|**

**|           |              |          |         |         | postgres=CTc/postgres |**

**| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|**

**|           |              |          |         |         | postgres=CTc/postgres |**

**+-----------+--------------+----------+---------+---------+-----------------------+**

**(4 rows)**



**postgres=> \\c bikes**

**You are now connected to database "bikes" as user "freecodecamp".**

**bikes=> CREATE TABLE bikes**

**bikes-> ();**

**bikes=> CREATE TABLE**

**CREATE T**

**bikes=> \\d**

            **List of relations**

**+--------+-------+-------+--------------+**

**| Schema | Name  | Type  |    Owner     |**

**+--------+-------+-------+--------------+**

**| public | bikes | table | freecodecamp |**

**+--------+-------+-------+--------------+**

**(1 row)**



**bikes=> ALTER TABLE bikes ADD COLUMN bike\_id SERIAL PRIMARY KEY;**

**ALTER TABLE**

**bikes=> \\d bikes**

                                **Table "public.bikes"**

**+---------+---------+-----------+----------+----------------------------------------+**

**| Column  |  Type   | Collation | Nullable |                Default                 |**

**+---------+---------+-----------+----------+----------------------------------------+**

**| bike\_id | integer |           | not null | nextval('bikes\_bike\_id\_seq'::regclass) |**

**+---------+---------+-----------+----------+----------------------------------------+**

**Indexes:**

    **"bikes\_pkey" PRIMARY KEY, btree (bike\_id)**



**bikes=> ALTER TABLE bikes ADD COLUMN type VARCHAR(50) NOT NULL;**

**bikes=> ALTER TABLE**

**\\d bikes**

                                     **Table "public.bikes"**

**+---------+-----------------------+-----------+----------+----------------------------------------+**

**| Column  |         Type          | Collation | Nullable |                Default                 |**

**+---------+-----------------------+-----------+----------+----------------------------------------+**

**| bike\_id | integer               |           | not null | nextval('bikes\_bike\_id\_seq'::regclass) |**

**| type    | character varying(50) |           | not null |                                        |**

**+---------+-----------------------+-----------+----------+----------------------------------------+**

**Indexes:**

    **"bikes\_pkey" PRIMARY KEY, btree (bike\_id)**



**ALTER TABLE bikes ADD COLUMN size INT NOT NULL;**

**ALTER TABLE**

**bikes=> ALTER TABLE bikes ADD COLUMN available BOOLEAN NOT NULL DEFAULT TRUE;**

**ALTER TABLE**

**bikes=> \\d bikes**

                                        **Table "public.bikes"**

**+-----------+-----------------------+-----------+----------+----------------------------------------+**

**|  Column   |         Type          | Collation | Nullable |                Default                 |**

**+-----------+-----------------------+-----------+----------+----------------------------------------+**

**| bike\_id   | integer               |           | not null | nextval('bikes\_bike\_id\_seq'::regclass) |**

**| type      | character varying(50) |           | not null |                                        |**

**| size      | integer               |           | not null |                                        |**

**| available | boolean               |           | not null | true                                   |**

**+-----------+-----------------------+-----------+----------+----------------------------------------+**

**Indexes:**

    **"bikes\_pkey" PRIMARY KEY, btree (bike\_id)**



**bikes=> CREATE TABLE customers();**

**bikes=> CREATE TABLE**

**ALTER TABLE customers ADD COLUMN customer\_id SERIAL PRIMARY KEY;**

**ALTER TABLE**

**bikes=> \\d customers**

                                    **Table "public.customers"**

**+-------------+---------+-----------+----------+------------------------------------------------+**

**|   Column    |  Type   | Collation | Nullable |                    Default                     |**

**+-------------+---------+-----------+----------+------------------------------------------------+**

**| customer\_id | integer |           | not null | nextval('customers\_customer\_id\_seq'::regclass) |**

**+-------------+---------+-----------+----------+------------------------------------------------+**

**Indexes:**

    **"customers\_pkey" PRIMARY KEY, btree (customer\_id)**



**bikes=> ALTER TABLE customers ADD COLUMN phone VARCHAR(15) NOT NULL UNIQUE;**

**ALTER TABLE**

**bikes=> ALTER TABLE customers ADD COLUMN name VARCHAR(50) NOT NULL;**

**ALTER TABLE**

**bikes=> ALTER TABLE customers DROP COLUMN name;**

**bikes=> ALTER TABLE**

**ALTER TABLE customers ADD COLUMN name VARCHAR(40) NOT NULL;**

**ALTER TABLE**

**bikes=> \\d customers**

                                          **Table "public.customers"**

**+-------------+-----------------------+-----------+----------+------------------------------------------------+**

**|   Column    |         Type          | Collation | Nullable |                    Default                     |**

**+-------------+-----------------------+-----------+----------+------------------------------------------------+**

**| customer\_id | integer               |           | not null | nextval('customers\_customer\_id\_seq'::regclass) |**

**| phone       | character varying(15) |           | not null |                                                |**

**| name        | character varying(40) |           | not null |                                                |**

**+-------------+-----------------------+-----------+----------+------------------------------------------------+**

**Indexes:**

    **"customers\_pkey" PRIMARY KEY, btree (customer\_id)**

    **"customers\_phone\_key" UNIQUE CONSTRAINT, btree (phone)**



**CREATE TABLE rentals();**

**CREATE TABLE**

**bikes=> ALTER TABLE rentals ADD COLUMN rental\_id SERIAL PRIMARY KEY;**

**ALTER TABLE**

**bikes=> \\d rentals**

                                  **Table "public.rentals"**

**+-----------+---------+-----------+----------+--------------------------------------------+**

**|  Column   |  Type   | Collation | Nullable |                  Default                   |**

**+-----------+---------+-----------+----------+--------------------------------------------+**

**| rental\_id | integer |           | not null | nextval('rentals\_rental\_id\_seq'::regclass) |**

**+-----------+---------+-----------+----------+--------------------------------------------+**

**Indexes:**

    **"rentals\_pkey" PRIMARY KEY, btree (rental\_id)**



**bikes=> ALTER TABLE rentals ADD COLUMN customer\_id INT NOT NULL;**

**bikes=> ALTER TABLE**

**ALTER TABLE rentals ADD FOREIGN KEY(customer\_id) REFERENCES customers(customer\_id);**

**bikes=> ALTER TABLE**

**bikes=> \\d rentals**

                                   **Table "public.rentals"**

**+-------------+---------+-----------+----------+--------------------------------------------+**

**|   Column    |  Type   | Collation | Nullable |                  Default                   |**

**+-------------+---------+-----------+----------+--------------------------------------------+**

**| rental\_id   | integer |           | not null | nextval('rentals\_rental\_id\_seq'::regclass) |**

**| customer\_id | integer |           | not null |                                            |**

**+-------------+---------+-----------+----------+--------------------------------------------+**

**Indexes:**

    **"rentals\_pkey" PRIMARY KEY, btree (rental\_id)**

**Foreign-key constraints:**

    **"rentals\_customer\_id\_fkey" FOREIGN KEY (customer\_id) REFERENCES customers(customer\_id)**



**bikes=> ALTER TABLE rentals ADD COLUMN bike\_id INT NOT NULL;**

**ALTER TABLE**

**bikes=> ALTER TABLE rentals ADD FOREIGN KEY(bike\_id) REFERENCES bikes(bike\_id);**

**bikes=> ALTER TABLE**

**\\d rentals**

                                   **Table "public.rentals"**

**+-------------+---------+-----------+----------+--------------------------------------------+**

**|   Column    |  Type   | Collation | Nullable |                  Default                   |**

**+-------------+---------+-----------+----------+--------------------------------------------+**

**| rental\_id   | integer |           | not null | nextval('rentals\_rental\_id\_seq'::regclass) |**

**| customer\_id | integer |           | not null |                                            |**

**| bike\_id     | integer |           | not null |                                            |**

**+-------------+---------+-----------+----------+--------------------------------------------+**

**Indexes:**

    **"rentals\_pkey" PRIMARY KEY, btree (rental\_id)**

**Foreign-key constraints:**

    **"rentals\_bike\_id\_fkey" FOREIGN KEY (bike\_id) REFERENCES bikes(bike\_id)**

    **"rentals\_customer\_id\_fkey" FOREIGN KEY (customer\_id) REFERENCES customers(customer\_id)**



**bikes=> ALTER TABLE rentals ADD COLUMN date\_rented DATE DEFAULT NOW();**

**bikes=> ALTER TABLE**

**ALTER TABLE rentals DROP COLUMN date\_rented;**

**ALTER TABLE**

**bikes=> ALTER TABLE rentals ADD COLUMN date\_rented DATE NOT NULL DEFAULT NOW();**

**bikes=> ALTER TABLE**

**\\d rentals**

                                   **Table "public.rentals"**

**+-------------+---------+-----------+----------+--------------------------------------------+**

**|   Column    |  Type   | Collation | Nullable |                  Default                   |**

**+-------------+---------+-----------+----------+--------------------------------------------+**

**| rental\_id   | integer |           | not null | nextval('rentals\_rental\_id\_seq'::regclass) |**

**| customer\_id | integer |           | not null |                                            |**

**| bike\_id     | integer |           | not null |                                            |**

**| date\_rented | date    |           | not null | now()                                      |**

**+-------------+---------+-----------+----------+--------------------------------------------+**

**Indexes:**

    **"rentals\_pkey" PRIMARY KEY, btree (rental\_id)**

**Foreign-key constraints:**

    **"rentals\_bike\_id\_fkey" FOREIGN KEY (bike\_id) REFERENCES bikes(bike\_id)**

    **"rentals\_customer\_id\_fkey" FOREIGN KEY (customer\_id) REFERENCES customers(customer\_id)**



**bikes=> ALTER TABLE rentals ADD COLUMN date\_returned DATE;**

**bikes=> ALTER TABLE**

**\\d rentals**

                                    **Table "public.rentals"**

**+---------------+---------+-----------+----------+--------------------------------------------+**

**|    Column     |  Type   | Collation | Nullable |                  Default                   |**

**+---------------+---------+-----------+----------+--------------------------------------------+**

**| rental\_id     | integer |           | not null | nextval('rentals\_rental\_id\_seq'::regclass) |**

**| customer\_id   | integer |           | not null |                                            |**

**| bike\_id       | integer |           | not null |                                            |**

**| date\_rented   | date    |           | not null | now()                                      |**

**| date\_returned | date    |           |          |                                            |**

**+---------------+---------+-----------+----------+--------------------------------------------+**

**Indexes:**

    **"rentals\_pkey" PRIMARY KEY, btree (rental\_id)**

**Foreign-key constraints:**

    **"rentals\_bike\_id\_fkey" FOREIGN KEY (bike\_id) REFERENCES bikes(bike\_id)**

    **"rentals\_customer\_id\_fkey" FOREIGN KEY (customer\_id) REFERENCES customers(customer\_id)**



**bikes=> \\d**

                       **List of relations**

**+--------+---------------------------+----------+--------------+**

**| Schema |           Name            |   Type   |    Owner     |**

**+--------+---------------------------+----------+--------------+**

**| public | bikes                     | table    | freecodecamp |**

**| public | bikes\_bike\_id\_seq         | sequence | freecodecamp |**

**| public | customers                 | table    | freecodecamp |**

**| public | customers\_customer\_id\_seq | sequence | freecodecamp |**

**| public | rentals                   | table    | freecodecamp |**

**| public | rentals\_rental\_id\_seq     | sequence | freecodecamp |**

**+--------+---------------------------+----------+--------------+**

**(6 rows)**



**bikes=> INSERT INTO bikes(type, size) VALUES('Mountain', 27);**

**INSERT 0 1**

**bikes=> SELECT \* FROM bikes;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | t         |**

**+---------+----------+------+-----------+**

**(1 row)**



**bikes=> INSERT INTO bikes(type, size) VALUES('Mountain', 28);**

**bikes=> INSERT 0 1**

**INSERT INTO bikes(type, size) VALUES('Mountain', 29);**

**INSERT 0 1**

**bikes=> INSERT INTO bikes(type, size) VALUES('Road', 27);**

**bikes=> INSERT 0 1**

**SELECT \* FROM bikes;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | t         |**

**|       2 | Mountain |   28 | t         |**

**|       3 | Mountain |   29 | t         |**

**|       4 | Road     |   27 | t         |**

**+---------+----------+------+-----------+**

**(4 rows)**



**bikes=> INSERT INTO bikes(type, size) VALUES('Road', 28),('Road', 29);**

**bikes=> INSERT 0 2**

**INSERT INTO bikes(type, size) VALUES('BMX', 19),('BMX', 20), ('BMX', 21);**

**bikes=> INSERT 0 3**

**SELECT \* FROM bikes;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | t         |**

**|       2 | Mountain |   28 | t         |**

**|       3 | Mountain |   29 | t         |**

**|       4 | Road     |   27 | t         |**

**|       5 | Road     |   28 | t         |**

**|       6 | Road     |   29 | t         |**

**|       7 | BMX      |   19 | t         |**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> \\d bikes**

                                        **Table "public.bikes"**

**+-----------+-----------------------+-----------+----------+----------------------------------------+**

**|  Column   |         Type          | Collation | Nullable |                Default                 |**

**+-----------+-----------------------+-----------+----------+----------------------------------------+**

**| bike\_id   | integer               |           | not null | nextval('bikes\_bike\_id\_seq'::regclass) |**

**| type      | character varying(50) |           | not null |                                        |**

**| size      | integer               |           | not null |                                        |**

**| available | boolean               |           | not null | true                                   |**

**+-----------+-----------------------+-----------+----------+----------------------------------------+**

**Indexes:**

    **"bikes\_pkey" PRIMARY KEY, btree (bike\_id)**

**Referenced by:**

    **TABLE "rentals" CONSTRAINT "rentals\_bike\_id\_fkey" FOREIGN KEY (bike\_id) REFERENCES bikes(bike\_id)**



**bikes=> SELECT \* FROM bikes WHERE available= TRUE;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | t         |**

**|       2 | Mountain |   28 | t         |**

**|       3 | Mountain |   29 | t         |**

**|       4 | Road     |   27 | t         |**

**|       5 | Road     |   28 | t         |**

**|       6 | Road     |   29 | t         |**

**|       7 | BMX      |   19 | t         |**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> SELECT \* FROM bikes WHERE available= TRUE ORDER BY bike\_id;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | t         |**

**|       2 | Mountain |   28 | t         |**

**|       3 | Mountain |   29 | t         |**

**|       4 | Road     |   27 | t         |**

**|       5 | Road     |   28 | t         |**

**|       6 | Road     |   29 | t         |**

**|       7 | BMX      |   19 | t         |**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> SELECT \* FROM bikes WHERE available=FALSE ORDER BY bike\_id;**

                  

**+---------+------+------+-----------+**

**| bike\_id | type | size | available |**

**+---------+------+------+-----------+**

**+---------+------+------+-----------+**

**(0 rows)**



**UPDATE bikes SET available = false;**

**UPDATE 9**

**bikes=> UPDATE bikes SET available = true WHERE type != 'BMX';**

**UPDATE 6**

**bikes=> SELECT available FROM bikes WHERE bike\_id=1 AND available=true ;**

       

**+-----------+**

**| available |**

**+-----------+**

**| t         |**

**+-----------+**

**(1 row)**



**bikes=> SELECT \* FROM bikes;**

                    

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       7 | BMX      |   19 | f         |**

**|       8 | BMX      |   20 | f         |**

**|       9 | BMX      |   21 | f         |**

**|       1 | Mountain |   27 | t         |**

**|       2 | Mountain |   28 | t         |**

**|       3 | Mountain |   29 | t         |**

**|       4 | Road     |   27 | t         |**

**|       5 | Road     |   28 | t         |**

**|       6 | Road     |   29 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> UPDATE bikes SET available = true WHERE available = false;**

**bikes=> UPDATE 3**

**\\d customers**

                                           **Table "public.customers"**

**+-------------+-----------------------+-----------+----------+------------------------------------------------+**

**|   Column    |         Type          | Collation | Nullable |                    Default                     |**

**+-------------+-----------------------+-----------+----------+------------------------------------------------+**

**| customer\_id | integer               |           | not null | nextval('customers\_customer\_id\_seq'::regclass) |**

**| phone       | character varying(15) |           | not null |                                                |**

**| name        | character varying(40) |           | not null |                                                |**

**+-------------+-----------------------+-----------+----------+------------------------------------------------+**

**Indexes:**

    **"customers\_pkey" PRIMARY KEY, btree (customer\_id)**

    **"customers\_phone\_key" UNIQUE CONSTRAINT, btree (phone)**

**Referenced by:**

    **TABLE "rentals" CONSTRAINT "rentals\_customer\_id\_fkey" FOREIGN KEY (customer\_id) REFERENCES customers(customer\_id)**



**bikes=> SELECT \* FROM customers;**

                                 

**+-------------+----------+------+**

**| customer\_id |  phone   | name |**

**+-------------+----------+------+**

**|           3 | 555-5555 | Me   |**

**+-------------+----------+------+**

**(1 row)**



**bikes=> SELECT \* FROM rentals;**

                                  

**+-----------+-------------+---------+-------------+---------------+**

**| rental\_id | customer\_id | bike\_id | date\_rented | date\_returned |**

**+-----------+-------------+---------+-------------+---------------+**

**+-----------+-------------+---------+-------------+---------------+**

**(0 rows)**



**bikes=> SELECT \* FROM bikes;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | t         |**

**|       2 | Mountain |   28 | t         |**

**|       3 | Mountain |   29 | t         |**

**|       4 | Road     |   27 | t         |**

**|       5 | Road     |   28 | t         |**

**|       6 | Road     |   29 | t         |**

**|       7 | BMX      |   19 | t         |**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> SELECT \* FROM rentals;**

                                  

**+-----------+-------------+---------+-------------+---------------+**

**| rental\_id | customer\_id | bike\_id | date\_rented | date\_returned |**

**+-----------+-------------+---------+-------------+---------------+**

**|         1 |           1 |       1 | 2026-02-21  |               |**

**+-----------+-------------+---------+-------------+---------------+**

**(1 row)**



**bikes=> SELECT \* FROM bikes;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       2 | Mountain |   28 | t         |**

**|       3 | Mountain |   29 | t         |**

**|       4 | Road     |   27 | t         |**

**|       5 | Road     |   28 | t         |**

**|       6 | Road     |   29 | t         |**

**|       7 | BMX      |   19 | t         |**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**|       1 | Mountain |   27 | f         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> SELECT \* FROM bikes ORDER BY bike\_id;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | f         |**

**|       2 | Mountain |   28 | t         |**

**|       3 | Mountain |   29 | t         |**

**|       4 | Road     |   27 | t         |**

**|       5 | Road     |   28 | t         |**

**|       6 | Road     |   29 | t         |**

**|       7 | BMX      |   19 | t         |**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> SELECT \* FROM customers;**

        

**+-------------+----------+------+**

**| customer\_id |  phone   | name |**

**+-------------+----------+------+**

**|           1 | 555-5555 | Me   |**

**|           2 | 000-0000 | Test |**

**|           3 | 222-2222 | You  |**

**+-------------+----------+------+**

**(3 rows)**



**SELECT \* FROM bikes ORDER BY bike\_id;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | f         |**

**|       2 | Mountain |   28 | f         |**

**|       3 | Mountain |   29 | f         |**

**|       4 | Road     |   27 | f         |**

**|       5 | Road     |   28 | f         |**

**|       6 | Road     |   29 | f         |**

**|       7 | BMX      |   19 | f         |**

**|       8 | BMX      |   20 | f         |**

**|       9 | BMX      |   21 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> Update bikes SET available=true WHERE bike\_id=8;**

**UPDATE 1**

**bikes=> SELECT \* FROM bikes ORDER BY bike\_id;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | f         |**

**|       2 | Mountain |   28 | f         |**

**|       3 | Mountain |   29 | f         |**

**|       4 | Road     |   27 | f         |**

**|       5 | Road     |   28 | f         |**

**|       6 | Road     |   29 | f         |**

**|       7 | BMX      |   19 | f         |**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> SELECT \* FROM customers;**

                 

**+-------------+----------+------+**

**| customer\_id |  phone   | name |**

**+-------------+----------+------+**

**|           1 | 555-5555 | Me   |**

**|           2 | 000-0000 | Test |**

**|           3 | 222-2222 | You  |**

**+-------------+----------+------+**

**(3 rows)**



**bikes=> SELECT \* FROM rentals;**

                                  

**+-----------+-------------+---------+-------------+---------------+**

**| rental\_id | customer\_id | bike\_id | date\_rented | date\_returned |**

**+-----------+-------------+---------+-------------+---------------+**

**|         1 |           1 |       1 | 2021-05-25  |               |**

**|         2 |           1 |       2 | 2021-05-25  |               |**

**|         3 |           1 |       3 | 2021-05-27  |               |**

**|         4 |           1 |       4 | 2021-05-27  |               |**

**|         5 |           1 |       5 | 2026-02-21  |               |**

**|         6 |           2 |       6 | 2026-02-21  |               |**

**|         7 |           3 |       7 | 2026-02-21  |               |**

**|         8 |           2 |       8 | 2026-02-21  |               |**

**+-----------+-------------+---------+-------------+---------------+**

**(8 rows)**



**bikes=> SELECT \* FROM bikes;**



**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**|       1 | Mountain |   27 | f         |**

**|       2 | Mountain |   28 | f         |**

**|       3 | Mountain |   29 | f         |**

**|       4 | Road     |   27 | f         |**

**|       5 | Road     |   28 | f         |**

**|       6 | Road     |   29 | f         |**

**|       7 | BMX      |   19 | f         |**

**+---------+----------+------+-----------+**

**(9 rows)**

                                                    **^**

**bikes=> SELECT \* FROM bikes LEFT JOIN rentals USING(bike\_id);**

                                                 

**+---------+----------+------+-----------+-----------+-------------+-------------+---------------+**

**| bike\_id |   type   | size | available | rental\_id | customer\_id | date\_rented | date\_returned |**

**+---------+----------+------+-----------+-----------+-------------+-------------+---------------+**

**|       1 | Mountain |   27 | f         |         1 |           1 | 2021-05-25  |               |**

**|       2 | Mountain |   28 | f         |         2 |           1 | 2021-05-25  |               |**

**|       3 | Mountain |   29 | f         |         3 |           1 | 2021-05-27  |               |**

**|       4 | Road     |   27 | f         |         4 |           1 | 2021-05-27  |               |**

**|       5 | Road     |   28 | f         |         5 |           1 | 2021-05-27  |               |**

**|       6 | Road     |   29 | f         |         6 |           2 | 2021-05-27  |               |**

**|       7 | BMX      |   19 | f         |         7 |           2 | 2021-05-27  |               |**

**|       8 | BMX      |   20 | t         |           |             |             |               |**

**|       9 | BMX      |   21 | t         |           |             |             |               |**

**+---------+----------+------+-----------+-----------+-------------+-------------+---------------+**

**(9 rows)**



**bikes=> SELECT \* FROM bikes INNER JOIN rentals USING(bike\_id);**

                                                 

**+---------+----------+------+-----------+-----------+-------------+-------------+---------------+**

**| bike\_id |   type   | size | available | rental\_id | customer\_id | date\_rented | date\_returned |**

**+---------+----------+------+-----------+-----------+-------------+-------------+---------------+**

**|       1 | Mountain |   27 | f         |         1 |           1 | 2021-05-25  |               |**

**|       2 | Mountain |   28 | f         |         2 |           1 | 2021-05-25  |               |**

**|       3 | Mountain |   29 | f         |         3 |           1 | 2021-05-27  |               |**

**|       4 | Road     |   27 | f         |         4 |           1 | 2021-05-27  |               |**

**|       5 | Road     |   28 | f         |         5 |           1 | 2021-05-27  |               |**

**|       6 | Road     |   29 | f         |         6 |           2 | 2021-05-27  |               |**

**|       7 | BMX      |   19 | f         |         7 |           2 | 2021-05-27  |               |**

**+---------+----------+------+-----------+-----------+-------------+-------------+---------------+**

**(7 rows)**



**bikes=> SELECT \* FROM bikes INNER JOIN rentals USING(bike\_id) INNER JOIN customers USING(customer\_id);**

                                                          

**+-------------+---------+----------+------+-----------+-----------+-------------+---------------+----------+------+**

**| customer\_id | bike\_id |   type   | size | available | rental\_id | date\_rented | date\_returned |  phone   | name |**

**+-------------+---------+----------+------+-----------+-----------+-------------+---------------+----------+------+**

**|           1 |       1 | Mountain |   27 | f         |         1 | 2021-05-25  |               | 555-5555 | Me   |**

**|           1 |       2 | Mountain |   28 | f         |         2 | 2021-05-25  |               | 555-5555 | Me   |**

**|           1 |       3 | Mountain |   29 | f         |         3 | 2021-05-27  |               | 555-5555 | Me   |**

**|           1 |       4 | Road     |   27 | f         |         4 | 2021-05-27  |               | 555-5555 | Me   |**

**|           1 |       5 | Road     |   28 | f         |         5 | 2021-05-27  |               | 555-5555 | Me   |**

**|           2 |       6 | Road     |   29 | f         |         6 | 2021-05-27  |               | 000-0000 | Test |**

**|           2 |       7 | BMX      |   19 | f         |         7 | 2021-05-27  |               | 000-0000 | Test |**

**+-------------+---------+----------+------+-----------+-----------+-------------+---------------+----------+------+**

**(7 rows)**



**bikes=> SELECT \* FROM bikes INNER JOIN rentals USING(bike\_id) INNER JOIN customers USING(customer\_id) WHERE phone='555-5555' AND date\_returned IS NULL;**

                                                          

**+-------------+---------+----------+------+-----------+-----------+-------------+---------------+----------+------+**

**| customer\_id | bike\_id |   type   | size | available | rental\_id | date\_rented | date\_returned |  phone   | name |**

**+-------------+---------+----------+------+-----------+-----------+-------------+---------------+----------+------+**

**|           1 |       1 | Mountain |   27 | f         |         1 | 2021-05-25  |               | 555-5555 | Me   |**

**|           1 |       2 | Mountain |   28 | f         |         2 | 2021-05-25  |               | 555-5555 | Me   |**

**|           1 |       3 | Mountain |   29 | f         |         3 | 2021-05-27  |               | 555-5555 | Me   |**

**|           1 |       4 | Road     |   27 | f         |         4 | 2021-05-27  |               | 555-5555 | Me   |**

**|           1 |       5 | Road     |   28 | f         |         5 | 2021-05-27  |               | 555-5555 | Me   |**

**+-------------+---------+----------+------+-----------+-----------+-------------+---------------+----------+------+**

**(5 rows)**



**bikes=> SELECT bike\_id, type, size FROM bikes INNER JOIN rentals USING(bike\_id) INNER JOIN customers USING(customer\_id) WHERE phone='555-5555' AND date\_returned IS NULL;**



**+---------+----------+------+**

**| bike\_id |   type   | size |**

**+---------+----------+------+**

**|       1 | Mountain |   27 |**

**|       2 | Mountain |   28 |**

**|       3 | Mountain |   29 |**

**|       4 | Road     |   27 |**

**|       5 | Road     |   28 |**

**+---------+----------+------+**

**(5 rows)**



**bikes=>SELECT bike\_id, type, size FROM bikes INNER JOIN rentals USING(bike\_id) INNER JOIN customers USING(customer\_id) WHERE phone='555-5555' AND date\_returned IS NULL ORDER BY bike\_id;**

               

**+---------+----------+------+**

**| bike\_id |   type   | size |**

**+---------+----------+------+**

**|       1 | Mountain |   27 |**

**|       2 | Mountain |   28 |**

**|       3 | Mountain |   29 |**

**|       4 | Road     |   27 |**

**|       5 | Road     |   28 |**

**+---------+----------+------+**

**(5 rows)**



**bikes=> SELECT bike\_id, type, size FROM bikes INNER JOIN rentals USING(bike\_id) INNER JOIN customers USING(customer\_id) WHERE bike\_id=1 ORDER BY bike\_id;**



**+---------+----------+------+**

**| bike\_id |   type   | size |**

**+---------+----------+------+**

**|       1 | Mountain |   27 |**

**+---------+----------+------+**

**(1 row)**



**SELECT \* FROM rentals INNER JOIN customers USING(customer\_id);**

                                           

**+-------------+-----------+---------+-------------+---------------+----------+------+**

**| customer\_id | rental\_id | bike\_id | date\_rented | date\_returned |  phone   | name |**

**+-------------+-----------+---------+-------------+---------------+----------+------+**

**|           1 |         1 |       1 | 2021-05-25  |               | 555-5555 | Me   |**

**|           1 |         2 |       2 | 2021-05-25  |               | 555-5555 | Me   |**

**|           1 |         3 |       3 | 2021-05-27  |               | 555-5555 | Me   |**

**|           1 |         4 |       4 | 2021-05-27  |               | 555-5555 | Me   |**

**|           1 |         5 |       5 | 2021-05-27  |               | 555-5555 | Me   |**

**|           2 |         6 |       6 | 2021-05-27  |               | 000-0000 | Test |**

**|           2 |         7 |       7 | 2021-05-27  |               | 000-0000 | Test |**

**+-------------+-----------+---------+-------------+---------------+----------+------+**

**(7 rows)**



**bikes=> SELECT phone, bike\_id, date\_returned FROM rentals INNER JOIN customers USING(customer\_id);**

                   

**+----------+---------+---------------+**

**|  phone   | bike\_id | date\_returned |**

**+----------+---------+---------------+**

**| 555-5555 |       1 |               |**

**| 555-5555 |       2 |               |**

**| 555-5555 |       3 |               |**

**| 555-5555 |       4 |               |**

**| 555-5555 |       5 |               |**

**| 000-0000 |       6 |               |**

**| 000-0000 |       7 |               |**

**+----------+---------+---------------+**

**(7 rows)**



**bikes=> SELECT \* FROM rentals INNER JOIN customers USING(customer\_id) WHERE phone = '555-5555' AND bike\_id = 1 AND date\_returned IS NULL;**

                                          

**+-------------+-----------+---------+-------------+---------------+----------+------+**

**| customer\_id | rental\_id | bike\_id | date\_rented | date\_returned |  phone   | name |**

**+-------------+-----------+---------+-------------+---------------+----------+------+**

**|           1 |         1 |       1 | 2021-05-25  |               | 555-5555 | Me   |**

**+-------------+-----------+---------+-------------+---------------+----------+------+**

**(1 row)**



**SELECT \*SELECT \* FROM rentals INNER JOIN customers USING(customer\_id) WHERE phone = '555-5555' AND bike\_id = 1 AND dated IS NULL;**

                                           

**+-------------+-----------+---------+-------------+---------------+----------+------+**

**| customer\_id | rental\_id | bike\_id | date\_rented | date\_returned |  phone   | name |**

**+-------------+-----------+---------+-------------+---------------+----------+------+**

**|           1 |         1 |       1 | 2021-05-25  |               | 555-5555 | Me   |**

**+-------------+-----------+---------+-------------+---------------+----------+------+**

**(1 row)**



**bikes=> SELECT rental\_id FROM rentals INNER JOIN customers USING(customer\_id) WHERE phone = '555-5555' AND bike\_id = 1 AND date\_returned IS NULL;**

       

**+-----------+**

**| rental\_id |**

**+-----------+**

**|         1 |**

**+-----------+**

**(1 row)**

**bikes=> SELECT \* FROM rentals;**

                                  

**+-----------+-------------+---------+-------------+---------------+**

**| rental\_id | customer\_id | bike\_id | date\_rented | date\_returned |**

**+-----------+-------------+---------+-------------+---------------+**

**|         2 |           1 |       2 | 2021-05-25  |               |**

**|         3 |           1 |       3 | 2021-05-27  |               |**

**|         4 |           1 |       4 | 2021-05-27  |               |**

**|         5 |           1 |       5 | 2021-05-27  |               |**

**|         6 |           2 |       6 | 2021-05-27  |               |**

**|         7 |           2 |       7 | 2021-05-27  |               |**

**|         1 |           1 |       1 | 2021-05-25  | 2026-02-21    |**

**+-----------+-------------+---------+-------------+---------------+**

**(7 rows)**



**bikes=> SELECT \* FROM rentals ORDER BY bike\_id;**

                                  

**+-----------+-------------+---------+-------------+---------------+**

**| rental\_id | customer\_id | bike\_id | date\_rented | date\_returned |**

**+-----------+-------------+---------+-------------+---------------+**

**|         1 |           1 |       1 | 2021-05-25  | 2026-02-21    |**

**|         2 |           1 |       2 | 2021-05-25  |               |**

**|         3 |           1 |       3 | 2021-05-27  |               |**

**|         4 |           1 |       4 | 2021-05-27  |               |**

**|         5 |           1 |       5 | 2021-05-27  |               |**

**|         6 |           2 |       6 | 2021-05-27  |               |**

**|         7 |           2 |       7 | 2021-05-27  |               |**

**+-----------+-------------+---------+-------------+---------------+**

**(7 rows)**



**bikes=> SELECT \* FROM bikes ORDER BY bike\_id;**

                     

**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | t         |**

**|       2 | Mountain |   28 | f         |**

**|       3 | Mountain |   29 | f         |**

**|       4 | Road     |   27 | f         |**

**|       5 | Road     |   28 | f         |**

**|       6 | Road     |   29 | f         |**

**|       7 | BMX      |   19 | f         |**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=> SELECT \* FROM bikes ORDER BY bike\_id;**



**+---------+----------+------+-----------+**

**| bike\_id |   type   | size | available |**

**+---------+----------+------+-----------+**

**|       1 | Mountain |   27 | t         |**

**|       2 | Mountain |   28 | t         |**

**|       3 | Mountain |   29 | t         |**

**|       4 | Road     |   27 | t         |**

**|       5 | Road     |   28 | t         |**

**|       6 | Road     |   29 | f         |**

**|       7 | BMX      |   19 | f         |**

**|       8 | BMX      |   20 | t         |**

**|       9 | BMX      |   21 | t         |**

**+---------+----------+------+-----------+**

**(9 rows)**



**bikes=>** 

