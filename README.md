**PAN Number Validation & Data Quality Analysis**

**PostgreSQL | SQL | PL/pgSQL | Regular Expressions**

**Project Overview**

A SQL-based data quality and validation project designed to identify, standardise and classify Indian PAN records using predefined structural and pattern-based validation rules.
The project demonstrates how database-driven validation techniques can improve data consistency, identify anomalies and support reliable data management.
Business Objective
To assess the quality of a PAN number dataset by identifying duplicates, missing values, formatting inconsistencies and invalid character patterns, ultimately classifying records into Valid and Invalid categories.

**Dataset Overview**
•	Total Records: 9,033
•	Distinct Raw Records: 9,025
•	Duplicate Excess Records: 8
•	Dataset Columns: 1 (PAN_Numbers)

**Key Analysis & Implementation**
•	Data Profiling: Evaluated record counts, distinct values, missing entries, duplicates and formatting inconsistencies.
•	Data Cleaning: Standardised records by removing unnecessary whitespace, converting lowercase characters to uppercase and eliminating duplicate entries.
•	Pattern Validation: Applied regular expressions to verify the standard 10-character PAN structure.
•	Custom Business Rules: Developed PL/pgSQL functions to detect consecutive repeated characters and strictly ascending sequential patterns.
•	Data Classification: Combined multiple validation conditions to categorise records into Valid PAN and Invalid PAN groups.
•	Reporting: Generated record-level validation results and summary metrics to evaluate overall data quality.

**Key Results & Business Insights**
**Validation Metric	Records**
Original Records	9,033
Distinct Records After Cleaning	9,025
Passed Basic Format Validation	4,999
Failed Basic Format Validation	4,026
Passed All Validation Rules	3,186
Failed At Least One Custom Rule	5,839

**Key Findings:**
•	Identified and removed 8 excess duplicate records during preprocessing.
•	4,999 records (approximately 55.4%) passed the basic PAN structural validation.
•	3,186 records (approximately 35.3% of the original dataset) passed all defined validation rules.
•	Implemented additional pattern checks beyond basic format validation to identify potentially invalid character combinations.

**Tools & Technologies**
PostgreSQL | pgAdmin 4 | SQL | PL/pgSQL | Regular Expressions | CTEs | CASE WHEN | LEFT JOIN | Data Cleaning | Data Validation

**Business Value**
Demonstrates the practical application of SQL in data quality management, rule-based validation, anomaly detection and data standardisation. These techniques are relevant to maintaining reliable customer records and supporting data integrity in financial services, banking and other data-driven business environments.
Note: Results reflect custom structural and pattern-based validation rules. They do not establish PAN authenticity, ownership or official validity.
