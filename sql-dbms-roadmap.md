# SQL & DBMS Mastery Roadmap (Beginner → Advanced)

A structured path to go from zero to confidently designing, querying, and optimizing databases. Estimated total time: **8–12 weeks** at ~1 hour/day, faster if you already code daily (you do — as a full-stack dev, you'll move quickly through basics).

---

## Phase 0: DBMS Foundations (Theory) — 3-4 days
Before touching syntax, understand *why* databases work the way they do.

- What is a DBMS vs RDBMS
- Data models: relational, hierarchical, network, document (contrast with Firestore, which you already use)
- Database vs Schema vs Table vs Instance
- Types of DB languages: DDL, DML, DQL, DCL, TCL
- Client-server architecture of a DBMS
- Popular RDBMS: PostgreSQL, MySQL, SQLite, SQL Server, Oracle

**Goal:** Understand terminology before writing queries.

---

## Phase 1: Core SQL Querying — Week 1
Set up PostgreSQL or MySQL locally (or use an online sandbox like SQLFiddle/DB Fiddle). Practice on a toy dataset (e.g., Northwind or Chinook DB).

- `SELECT`, `FROM`, `WHERE`
- Data types (INT, VARCHAR, DATE, BOOLEAN, DECIMAL, JSON)
- `NULL` handling and 3-valued logic
- Comparison & logical operators: `=, !=, <, >, BETWEEN, IN, LIKE, AND, OR, NOT`
- `ORDER BY`, `LIMIT`/`OFFSET`
- `DISTINCT`

**Practice:** Write 30-40 SELECT queries against a sample DB (filtering, sorting, pattern matching).

---

## Phase 2: Aggregation & Grouping — Week 1-2
- Aggregate functions: `COUNT, SUM, AVG, MIN, MAX`
- `GROUP BY` (single & multiple columns)
- `HAVING` vs `WHERE`
- `ROLLUP` / `CUBE` for subtotals (Postgres/SQL Server)

**Practice:** "Total sales per region", "average order value per customer per month" style queries.

---

## Phase 3: Joins — Week 2
This is the single most important skill block. Master it fully.

- `INNER JOIN`
- `LEFT JOIN` / `RIGHT JOIN`
- `FULL OUTER JOIN`
- `CROSS JOIN`
- `SELF JOIN`
- Multi-table joins (3+ tables)
- `ON` vs `USING`

**Practice:** Draw ER diagrams for a sample schema, then write joins connecting 3-4 tables (e.g., customers → orders → order_items → products).

---

## Phase 4: Subqueries & Set Operations — Week 3
- Scalar vs multi-row subqueries
- Correlated vs non-correlated subqueries
- `EXISTS` / `NOT EXISTS`
- `IN` / `NOT IN` (and NULL pitfalls with `NOT IN`)
- `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT`

**Practice:** Rewrite the same query using a JOIN vs a subquery vs `EXISTS` — compare readability and performance.

---

## Phase 5: Data Modeling & Schema Design — Week 3-4
Critical for building real systems (directly relevant to your Firestore/Events-module work).

- Primary keys, foreign keys, composite keys
- Relationship types: one-to-one, one-to-many, many-to-many (junction tables)
- Normalization: 1NF, 2NF, 3NF, BCNF (know *why*, not just definitions)
- Denormalization tradeoffs — when to break normal form for performance
- ER modeling (draw diagrams by hand or with a tool like dbdiagram.io)

**Practice:** Design a schema from scratch for something you know — e.g., model your Events/Conference Hub domain in proper relational form as an exercise.

---

## Phase 6: DDL & Constraints — Week 4
- `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, `TRUNCATE`
- Constraints: `PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, DEFAULT`
- `ON DELETE CASCADE / SET NULL / RESTRICT`
- `CREATE INDEX`
- `CREATE VIEW`

**Practice:** Build a small schema (3-5 tables) from your ER diagram in Phase 5, including all constraints.

---

## Phase 7: DML — Week 4-5
- `INSERT INTO ... VALUES` / `INSERT ... SELECT`
- `UPDATE ... SET ... WHERE`
- `DELETE FROM ... WHERE`
- `UPSERT`: `ON CONFLICT` (Postgres), `ON DUPLICATE KEY UPDATE` (MySQL), `MERGE` (SQL Server)

**Practice:** Seed your schema from Phase 6 with realistic data, then practice bulk updates/deletes safely (always test WHERE clauses on SELECT first).

---

## Phase 8: CTEs & Window Functions — Week 5-6
This is where you go from "knows SQL" to "actually good at SQL."

- `WITH` clause (CTEs) for readable, layered queries
- Recursive CTEs (e.g., org charts, category trees)
- Window functions: `ROW_NUMBER(), RANK(), DENSE_RANK(), NTILE()`
- `OVER (PARTITION BY ... ORDER BY ...)`
- `LAG()` / `LEAD()` for row-to-row comparisons
- Running totals & moving averages: `SUM() OVER (...)`
- Frame clauses: `ROWS BETWEEN` / `RANGE BETWEEN`

**Practice:** "Rank customers by spend within each region", "find each order's previous order date", "compute running revenue total by day."

---

## Phase 9: Functions & Conditional Logic — Week 6
- String functions: `CONCAT, SUBSTRING, TRIM, UPPER/LOWER, REPLACE, LENGTH`
- Numeric functions: `ROUND, CEIL, FLOOR, ABS, MOD`
- Date functions: `NOW(), DATEADD/DATEDIFF, EXTRACT` (very relevant given your date-corruption bug work!)
- `CASE WHEN ... THEN ... ELSE ... END`
- `COALESCE`, `NULLIF`
- `CAST()` / type casting

**Practice:** Given your recent date-storage bug experience — write queries that validate/reformat stored dates, extract components, and detect anomalies (e.g., dates outside expected ranges, timezone mismatches).

---

## Phase 10: Transactions & Concurrency — Week 7
- `BEGIN, COMMIT, ROLLBACK, SAVEPOINT`
- ACID properties (Atomicity, Consistency, Isolation, Durability)
- Isolation levels: Read Uncommitted, Read Committed, Repeatable Read, Serializable
- Dirty reads, non-repeatable reads, phantom reads
- Locking (row-level vs table-level), deadlocks
- Optimistic vs pessimistic concurrency control

**Goal:** Understand what happens when multiple users write to the same data simultaneously — essential for backend/fintech-style systems.

---

## Phase 11: Indexes & Query Performance — Week 7-8
- Clustered vs non-clustered indexes
- B-tree vs hash indexes
- Composite indexes & column order matters
- `EXPLAIN` / `EXPLAIN ANALYZE` — reading query plans
- Index selectivity, covering indexes
- Common performance killers: `SELECT *`, missing indexes on FKs, N+1 query problem, implicit type conversions

**Practice:** Take a slow query, run `EXPLAIN ANALYZE`, add an index, measure the difference.

---

## Phase 12: Stored Procedures, Functions, Triggers — Week 8-9
- User-defined functions (UDFs)
- Stored procedures
- Triggers (`BEFORE/AFTER INSERT/UPDATE/DELETE`)
- Cursors (know they exist, rarely needed)

**Practice:** Write a trigger that logs changes to an audit table — good mental model for tracking data corruption at the source (relevant to your bug-hunting work).

---

## Phase 13: Security — Week 9
- `GRANT` / `REVOKE`, roles & permissions
- SQL injection — how it happens and why parameterized queries/prepared statements prevent it
- Principle of least privilege for DB users

---

## Phase 14: Advanced / Modern Topics — Week 10-12
- JSON columns & JSON functions (`JSON_EXTRACT`, `->`, `->>` in Postgres) — useful bridge concept from your Firestore experience
- Full-text search
- Partitioning & sharding (horizontal vs vertical scaling)
- Replication basics (master-replica, read replicas)
- CAP theorem (relevant since you work with both SQL-style thinking and Firestore/NoSQL)
- Dialect differences: PostgreSQL vs MySQL vs SQL Server vs SQLite
- How ORMs (Prisma, TypeORM, Sequelize) map to raw SQL under the hood

---

## Suggested Practice Platforms
- **LeetCode (Database section)** — interview-style SQL problems, great for joins/window functions
- **HackerRank SQL track** — structured difficulty progression
- **SQLZoo** / **Mode Analytics SQL Tutorial** — beginner-friendly, browser-based
- **pgexercises.com** — Postgres-specific, window functions & subqueries focus
- **DB Fiddle / SQL Fiddle** — quick sandbox for testing snippets

## Suggested Datasets
- Chinook (music store) — great for joins/aggregation practice
- Northwind (classic retail) — great for schema design study
- Your own Metaxols domain, modeled on paper — best for retention since it's real to you

---

## How to Actually Retain This
1. **Don't just read — write queries daily**, even 15 minutes.
2. **Recreate real bugs as SQL exercises.** Your date-corruption investigation is a perfect case study — try modeling that Events table schema and writing queries to detect the corruption pattern.
3. **Explain each query plan** (`EXPLAIN ANALYZE`) out loud before checking if you're right.
4. **Design before you code** — sketch ER diagrams for any schema before creating tables.
5. Revisit **Phase 5 (design) and Phase 8 (window functions)** — these are the two areas that separate "can query" from "can architect."

