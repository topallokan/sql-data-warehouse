# 🚀 Source System Load Strategy Summary

The load strategy for AdventureWorks tables follows standard Data Warehousing principles: **high volume tables are Incremental**, and **low volume/dimension tables are Snapshot**.

| Load Type | Count | Rationale | Key Tables (Examples) |
| :--- | :--- | :--- | :--- |
| **Incremental** | 7 | **Performance/Efficiency.** Used for large, frequently changing transactional data (Fact tables). | SalesOrderDetail, TransactionHistory |
| **Snapshot** | 8 | **Data Integrity/Simplicity.** Used for smaller, stable reference data (Dimension tables). | Person, Address, Customer |

---

## Conclusion

The strategy is balanced: **Incremental** for high-volume performance and **Snapshot** for data integrity in reference tables.