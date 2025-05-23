# ✈️ Airline Reservation & Academic Management Database Project

---

## 🚀 Project Overview

This comprehensive database project models a **university academic system** integrated with **reservation and fee management** functionality, implemented using Oracle SQL and PL/SQL. The project combines:

- A robust relational schema capturing students, courses, instructors, and their relationships.
- Procedural logic in PL/SQL for GPA calculation, fee summaries, and academic performance analysis.
- Analytical queries to identify struggling students, failing courses, and financial dues.

This system serves as a practical example of leveraging SQL and procedural extensions to solve real-world business problems in academia and airline reservation contexts.

---

## 🗂️ Database Schema & Data Model

The schema consists of core entities:

| Entity        | Description                                     |
|---------------|------------------------------------------------|
| **STUDENTS**  | Contains student information and GPA tracking.|
| **COURSES**   | Details of courses including pricing and max grades.|
| **INSTRUCTORS** | Instructor details tied to courses.           |
| **STUDENT_COURSE** | Many-to-many join table recording student grades.|
| **RESERVATION** | (For airline context) Tracks booking information.|
| **FEES**       | Holds payment and fee-related data per student.|

### Key Relationships

- One-to-many between Instructors and Courses.
- Many-to-many between Students and Courses via STUDENT_COURSE.
- Fee calculations tied to course enrollments and reservations.

The design supports data integrity with primary keys, foreign keys, and domain constraints, ensuring reliable and consistent data management.

---

## 🧰 PL/SQL Procedures & Business Logic

### GPA Calculation

- Aggregates student grades across courses.
- Updates the `GPA` field in the `STUDENTS` table dynamically.
- Implements weighted averages and handles varying course credits.

### Fee Calculation

- Calculates total fees owed by each student based on course prices.
- Uses cursors and loops to process fee data efficiently.
- Outputs detailed fee reports via `DBMS_OUTPUT`.

### Academic Performance Queries

- Identifies the hardest course based on failure rates.
- Lists students below GPA thresholds for academic counseling.
- Reports students failing courses for targeted interventions.

---

## 🛠️ Setup & Usage Guide

### 1. Schema Creation

- Execute the DDL script (`db_ddl.sql`) to create all tables and constraints.
- Ensure the database user has appropriate privileges.

### 2. Data Population

- Load sample or production data using provided insert scripts or ETL tools.
- Verify data integrity before running procedures.

### 3. Running Procedures & Queries

- Enable output display in your SQL client:

  ```sql
  SET SERVEROUTPUT ON;


# ✈️ Airline Reservation & Academic Management Database Project

---

## 🚀 Project Overview

This comprehensive database project models a **university academic system** integrated with **reservation and fee management** functionality, implemented using Oracle SQL and PL/SQL. The project combines:

- A robust relational schema capturing students, courses, instructors, and their relationships.
- Procedural logic in PL/SQL for GPA calculation, fee summaries, and academic performance analysis.
- Analytical queries to identify struggling students, failing courses, and financial dues.
- Utility scripts for **database backup** and **disk space monitoring** to ensure data safety and efficient storage management.

---

## 🧰 Utility Scripts

### Database Backup Script

- A custom shell script automates regular backups of the database schema and data.
- Ensures recoverability and protects against data loss.
- Can be scheduled using cron jobs or run manually as needed.

### Disk Size Monitor Script

- Monitors database disk usage and alerts when storage exceeds configured thresholds.
- Helps maintain system health and plan capacity upgrades.
- Logs disk usage statistics for historical analysis.

---

## 🗂️ Database Schema & Data Model

...

*(rest of the README content continues as before)*
