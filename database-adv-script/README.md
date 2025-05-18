# 📦 ALX Airbnb Database - Advanced SQL Scripts

This repository demonstrates advanced SQL techniques applied to the `alx-airbnb-database` project, focusing on performance, scalability, and analytics in relational databases.

## 📁 Directory: `database-adv-script`

This folder includes complex queries and optimizations structured across 7 main tasks:

---

## ✅ Step 0: Complex Joins

**Objective:** Master SQL joins by writing complex multi-table queries.

**Highlights:**
- Used `INNER JOIN` to retrieve all bookings with their corresponding users.
- Used `LEFT JOIN` to get all properties and their reviews, including properties without reviews.
- Applied `FULL OUTER JOIN` to retrieve all users and bookings, even when some don’t match.

📄 File: `joins_queries.sql`

---

## ✅ Step 1: Practice Subqueries

**Objective:** Write both correlated and non-correlated subqueries for filtering and analysis.

**Highlights:**
- Non-correlated subquery to find properties with average ratings > 4.0.
- Correlated subquery to find users who made more than 3 bookings.
- Subqueries used for filtering, aggregation, and conditional analysis.

📄 File: `subqueries.sql`

---

## ✅ Step 2: Aggregations and Window Functions

**Objective:** Analyze data using aggregation functions and windowing.

**Highlights:**
- Used `COUNT()` and `GROUP BY` to find total bookings per user.
- Used `RANK()` and `ROW_NUMBER()` window functions to rank properties by booking frequency.
- Implemented ordering and partitioning to support analytical reporting.

📄 File: `aggregations_and_window_functions.sql`

---

## ✅ Step 3: Indexing for Optimization

**Objective:** Create indexes to optimize frequent queries.

**Highlights:**
- Indexed high-usage columns: `user_id`, `property_id`, `start_date`, and `status`.
- Used `CREATE INDEX` statements and tested with `EXPLAIN`.
- Benchmarked performance **before vs after** indexing.

📄 Files:
- SQL: `database_index.sql`
- Report: `index_performance.md`

---

## ✅ Step 4: Optimizing Complex Queries

**Objective:** Identify and refactor expensive queries to improve execution time.

**Highlights:**
- Wrote a detailed query combining bookings, users, properties, and payments.
- Used `EXPLAIN` to find inefficiencies (e.g., unnecessary joins, full scans).
- Refactored the query by limiting JOINs, adding WHERE clauses, and using indexed columns.

📄 Files:
- SQL Query: `perfomance.sql`
- Analysis Report: `optimization_report.md`

---

## ✅ Step 5: Partitioning Large Tables

**Objective:** Use partitioning to scale query performance on large datasets.

**Highlights:**
- Created `bookings_partitioned` table using `RANGE` partitioning on `YEAR(start_date)`.
- Added partitions for years 2022–2025 + `MAXVALUE`.
- Demonstrated 10x+ performance boost using partition pruning.
- Used `EXPLAIN PARTITIONS` to verify results.

📄 Files:
- Partition Script: `partitioning.sql`
- Performance Report: `partition_performance.md`

---

## ✅ Step 6: Monitoring and Refining Performance

**Objective:** Continuously improve performance using database profiling and schema adjustments.

**Highlights:**
- Used `EXPLAIN ANALYZE`, `SHOW PROFILE`, and query plan visualization tools.
- Identified bottlenecks like missing indexes and inefficient join orders.
- Proposed schema optimizations and indexing strategies based on profiling data.

📄 File: `performance_monitoring.md`

---

## ✅ Step 7: Manual Review

This task allows instructors and reviewers to assess the completeness, clarity, and technical accuracy of all previous steps.

---

## 🧠 Summary

| Step | Topic                          | Technique Used                     | File(s)                             |
|------|--------------------------------|------------------------------------|--------------------------------------|
| 0    | Joins                          | INNER, LEFT, FULL OUTER JOIN       | `joins_queries.sql`                 |
| 1    | Subqueries                     | Correlated & Non-correlated        | `subqueries.sql`                    |
| 2    | Aggregation & Window Functions| COUNT, RANK, ROW_NUMBER            | `aggregations_and_window_functions.sql` |
| 3    | Indexing                       | CREATE INDEX, EXPLAIN              | `database_index.sql`, `index_performance.md` |
| 4    | Query Optimization             | EXPLAIN, refactoring joins         | `perfomance.sql`, `optimization_report.md` |
| 5    | Partitioning                   | RANGE partitioning, pruning        | `partitioning.sql`, `partition_performance.md` |
| 6    | Monitoring                     | SHOW PROFILE, ANALYZE, schema tuning | `performance_monitoring.md`        |

---

## 💻 Tech Stack

- SQL (MySQL/PostgreSQL)
- Linux terminal (for command-line execution)
- Git & GitHub (version control)
- EXPLAIN ANALYZE / SHOW PROFILE (profiling tools)

---

## 👨‍🎓 Author

> 💡 **Name:** [Your Name Here]  
> 💼 **Project:** Part of ALX Software Engineering Program  
> 🏆 **Focus:** High-performance SQL techniques for scalable applications

---

## 📬 Feedback / Contributions

Have suggestions or want to contribute?  
Fork the repo and submit a pull request, or open an issue!

---

## 🏁 Final Note

This repository showcases practical and advanced SQL techniques you’ll use in real-world applications: performance-tuned analytics, transactional reliability, and massive scale support.

**Thanks for reading!**
