# Partitioning Performance Report

## 📌 Context

The `bookings` table in our application is expected to scale to millions of rows due to high traffic. Frequent filters by `start_date` were causing significant performance issues.

## 🔍 Why Partition?

- Most queries filter by date range (e.g., recent bookings).
- Indexes alone are not enough due to table size.
- Partitioning can isolate the relevant rows quickly.

## 🛠️ What We Did

- Created a partitioned table: `bookings_partitioned`
- Used `RANGE` partitioning based on `YEAR(start_date)`
- Added partitions for years: 2022, 2023, 2024, 2025, and beyond

## 📊 Benchmark Comparison

### 🔸 Query
```sql
SELECT *
FROM bookings_partitioned
WHERE status = 'confirmed'
  AND start_date BETWEEN '2024-01-01' AND '2024-12-31';
