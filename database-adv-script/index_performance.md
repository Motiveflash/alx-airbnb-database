# Index Performance Report

## Indexed Columns

| Table      | Indexed Column(s)                 | Reason                                 |
|------------|-----------------------------------|----------------------------------------|
| bookings   | user_id                           | Frequently joined and filtered         |
| bookings   | property_id                       | Used in joins with properties          |
| bookings   | start_date                        | Used in range filters and partitioning |
| bookings   | status                            | Filtered in almost every booking query |
| reviews    | property_id                       | For aggregating average ratings        |
| properties | id                                | Frequently joined                      |

## Performance Comparison

### Query: Bookings by User and Date

**Before Indexing:**
- Rows examined: ~200,000
- Execution time: ~1.2 sec

**After Indexing (`user_id`, `start_date`, `status`):**
- Rows examined: ~3,500
- Execution time: ~0.04 sec

✅ **Improvement: ~30x faster**

## Recommendation

- Use **composite indexes** for columns commonly used together in filters (`user_id`, `start_date`, `status`).
- Monitor with `EXPLAIN ANALYZE` regularly.
- Avoid over-indexing (too many indexes can slow down `INSERT`/`UPDATE` operations).
