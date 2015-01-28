-- Search SQL database for a table of the name provided, but sqlite doesn't support procedures.
-- IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE
--   TABLE_NAME = N'practiceTable');
-- BEGIN
-- END

-- Start with a fresh table each time, special sqlite3 procedure syntax.
DROP TABLE IF EXISTS practiceTable;
DROP TABLE IF EXISTS newTable;

-- Use CREATE TABLE *name* in order to create a table in your database.
CREATE TABLE practiceTable (
  -- Each field should be specified with its given data-type.

  -- The keyboard PRIMARY KEY can be used to specify that is holds unique values.
  id INTEGER NOT NULL PRIMARY KEY,

  -- Whereas PRIMARY KEY is used for identification, UNIQUE is used for uniqueness.
  language VARCHAR(20) NOT NULL UNIQUE,
  author VARCHAR(25) NOT NULL,
  year INTEGER NOT NULL,
  standard VARCHAR(10) NULL
);

-- You can also create a new table from an existing table.
CREATE TABLE secondTable AS SELECT * FROM practiceTable;
-- But you can change your table with the keyword ALTER.
ALTER TABLE secondTable RENAME TO newTable;

-- Insert values into a table through the use of these key statements.
INSERT INTO practiceTable VALUES (1, 'Fortran', 'Backus', 1955, NULL);
INSERT INTO practiceTable VALUES (2, 'Lisp', 'McCarthy', 1958, 'ANSI');
INSERT INTO practiceTable VALUES (3, 'Cobol', 'Hopper', 1959, 'ANSI');

-- It's also possible to insert values into a table by specifying its fields.
INSERT INTO practiceTable (id, language, author, year, standard)
VALUES (5, 'Prolog', 'Yu', 1933, 'ISO');
INSERT INTO practiceTable (id, language, author, year)
VALUES (6, 'Java', 'Zerlandie', 1955);

-- Adding an element to secondTable since it was created before practiceTable population.
INSERT INTO newTable (id, language, author, year)
VALUES (9, 'Perl', 'Daniel', 1555);

-- Use a SELECT statement followed by your query to grab elements from a table.
-- SELECT * FROM practiceTable;
-- SELECT * FROM newTable;

-- Use DESCRIBE if you need to verify your table, but not available in sqlite3... WTF
-- DESCRIBE practiceTable;
-- DESCRIBE newTable;

-- Here, we will cover the various SELECT statements.
-- SELECT language, year FROM practiceTable;

-- You can also order the results of a query using ORDER BY, default is ascending.
-- Note: Using ORDER BY on varchars will order in alphabetic order.
-- SELECT language, year FROM practiceTable ORDER BY year DESC;

-- The majority of filtering for queries occurs through the use of WHERE.
-- SELECT language, year FROM practiceTable WHERE year > 1957;

-- Keywords: AND, OR, to be used with WHERE.

-- The UPDATE command is used to change a specified row in a table.
UPDATE practiceTable SET
  year = 1962,
  author = "McDonald" WHERE
    standard IS NULL;

-- DELETE to delete values, obviously.
DELETE FROM practiceTable WHERE
  year = 1962;

-- The process of breaking down a database into logical tables is called normalization.
-- Also, you always want your table's fields to be atomic, meaning lack of multiple values.
-- Repeating groups, having multiple columns of the same, MUST be avoided.

-- Now, let's create new tables that will follow the normalization principle.

-- First, we have to drop the tables.
DROP TABLE IF EXISTS newlangTable;
DROP TABLE IF EXISTS authorsTable;

-- Then, we create them!
CREATE TABLE newlangTable (
  id INTEGER NOT NULL PRIMARY KEY,
  language VARCHAR(20) NOT NULL,
  year INTEGER NOT NULL,
  standard VARCHAR(10) NULL
);

CREATE TABLE authorsTable (
  author_id INTEGER NOT NULL PRIMARY KEY,
  author VARCHAR(20) NOT NULL,
  language_id INTEGER REFERENCES newlangTable(id)
);

INSERT INTO newlangTable (id, language, year, standard) VALUES (5, 'BASIC', 1964, 'ANSI');
INSERT INTO authorsTable (author_id, author, language_id) VALUES (5, 'Kemeny', 5);
INSERT INTO newlangTable (id, language, year,  standard) VALUES (1, 'Prolog', 1972, 'ISO');
INSERT INTO newlangTable (id, language, year) VALUES (2, 'Perl', 1987);
INSERT INTO newlangTable (id, language, year,  standard) VALUES (3, 'APL', 1964, 'ANSI');
INSERT INTO newlangTable (id, language, year) VALUES (4, 'Tcl', 1988);
INSERT INTO authorsTable (author_id, author, language_id) VALUES (6, 'Kurtz', 5);
INSERT INTO authorsTable (author_id, author, language_id) VALUES (1, 'Colmerauer', 1);
INSERT INTO authorsTable (author_id, author, language_id) VALUES (2, 'Wall', 2);
INSERT INTO authorsTable (author_id, author, language_id) VALUES (3, 'Ousterhout', 4);
INSERT INTO authorsTable (author_id, author, language_id) VALUES (4, 'Iverson', 3);

-- Use ALIASES if you need to reference a field with a different name.
SELECT language lang, year FROM newlangTable;

-- Use LIKE in this way LIKE '% *whatever you want* ' or LIKE '___' for blank spaces.

-- You can use MATH?!?! THAT'S SO COOL!
SELECT language, year - (year % 10) decade FROM newlangTable;

-- The keyword DISTINCT helps remove duplicates.
SELECT COUNT(DISTINCT year) FROM newlangTable;

-- More keywords: MIN and MAX, pretty self-explanatory.

-- GROUP_BY can be used to group records, and comes after a WHERE clause.
SELECT language, standard FROM newlangTable
WHERE standard IS NOT NULL
GROUP BY standard;

-- Watch how it can be used to perform operations on specific groupings.
SELECT standard, COUNT(*) FROM newlangTable GROUP BY standard;

-- This is the order for putting your clauses into a query.
-- SELECT
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY

SELECT language, standard, year - (year % 10) decade FROM newlangTable
GROUP BY standard, decade, language HAVING decade < 1985;

-- Now JOIN is one of the most important concepts to understand for relational databases.
SELECT author, language FROM newlangTable, authorsTable
WHERE language_id = id; -- This uses the join condition.

-- Another way to write this is with the JOIN clause and ON clause.
SELECT author, language FROM newlangTable JOIN authorsTable
ON language_id = id; -- You can also specify operations on specific tables or use aliases for tables.

-- A cross join, is essentially a cartesian cross product, taking all possible combinations.
SELECT author, language FROM newlangTable CROSS JOIN authorsTable;

-- Self-joins are done in this fashion, where you pair the ids between the same table.
-- SELECT l1.language, l2.language AS influenced
-- FROM inflang_tbl l1, inflang_tbl l2
-- WHERE l1.id = l2.influenced_by;

-- Note: Numbers should never be enclosed in quotes.

-- General Data Types: Data type  Description
-- CHARACTER(n)  Character string. Fixed-length n
-- VARCHAR(n) or
-- CHARACTER VARYING(n)  Character string. Variable length. Maximum length n
-- BINARY(n) Binary string. Fixed-length n
-- BOOLEAN Stores TRUE or FALSE values
-- VARBINARY(n) or
-- BINARY VARYING(n) Binary string. Variable length. Maximum length n
-- INTEGER(p)  Integer numerical (no decimal). Precision p
-- SMALLINT  Integer numerical (no decimal). Precision 5
-- INTEGER Integer numerical (no decimal). Precision 10
-- BIGINT  Integer numerical (no decimal). Precision 19
-- DECIMAL(p,s)  Exact numerical, precision p, scale s. Example: decimal(5,2) is a number that has 3 digits before the decimal and 2 digits after the decimal
-- NUMERIC(p,s)  Exact numerical, precision p, scale s. (Same as DECIMAL)
-- FLOAT(p)  Approximate numerical, mantissa precision p. A floating number in base 10 exponential notation. The size argument for this type consists of a single number specifying the minimum precision
-- REAL  Approximate numerical, mantissa precision 7
-- FLOAT Approximate numerical, mantissa precision 16
-- DOUBLE PRECISION  Approximate numerical, mantissa precision 16
-- DATE  Stores year, month, and day values
-- TIME  Stores hour, minute, and second values
-- TIMESTAMP Stores year, month, day, hour, minute, and second values
-- INTERVAL  Composed of a number of integer fields, representing a period of time, depending on the type of interval
-- ARRAY A set-length and ordered collection of elements
-- MULTISET  A variable-length and unordered collection of elements
-- XML Stores XML data

-- WHERE clause cannot be used in conjunction with aggergate functions.
