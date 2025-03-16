# Fintech - SQL Database Operations

## 📊 About the Project

This project focuses on **database manipulation for a Fintech system**, using **SQL queries** to manage financial transactions efficiently. The database is designed to **handle user accounts, income, expenses, debts, and investments**, ensuring smooth integration with the **Fintech system developed in Java**.

The goal is to **prepare SQL commands** that will be executed by the Java application when interacting with the **Oracle Database**.

## 🚀 Features

- **Structured SQL scripts** for database interactions.
- **User and financial data management** through INSERT, UPDATE, and SELECT queries.
- **Data integrity constraints** using PRIMARY KEY and FOREIGN KEY relationships.
- **Optimized queries** for financial data retrieval.

## 🛠️ Technologies Used

- **Oracle Database** for data storage and processing.
- **SQL** for structured query execution.
- **SQL Developer** or any Oracle-compatible database management tool.

## ⚡ How to Run the Project

### Prerequisites

- **Oracle Database** installed and configured.
- **SQL Developer** or another SQL execution environment.

### Steps

1. Clone the repository:

    ```sh
    git clone https://github.com/your-user/fintech-sql-database.git
    cd fintech-sql-database
    ```

2. Open **SQL Developer** (or any Oracle SQL tool) and connect to the database.

3. Execute the **fintech-database.sql** script to create tables and prepare data manipulation commands:

    ```sql
    @fintech-database.sql
    ```

4. Verify that the tables and queries were executed successfully.

## 📌 Database Operations

### 1️⃣ User and Account Management
- **Register a new user**
- **Update user information based on their ID**
- **Register a user’s bank account**

### 2️⃣ Financial Transactions
- **Register user income (salary, dividends, etc.)**
- **Update income records based on user ID**
- **Register user expenses (bills, subscriptions, etc.)**
- **Update expense records based on user ID**
- **Register investments (stocks, funds, fixed income, etc.)**
- **Update investment records based on user ID**

### 3️⃣ Querying Data
- **Retrieve user information by ID**
- **Fetch a specific expense record for a user**
- **List all expense records for a user, ordered from most recent to oldest**
- **Retrieve a specific investment record for a user**
- **List all investment records for a user, ordered from most recent to oldest**
- **Fetch user data along with their latest investment and latest expense (for dashboard display)**

## 🎓 Academic Context

This project was developed as part of **database integration studies** from the **Analysis and Systems Development** course at **FIAP**, focusing on **SQL for financial transaction management**. The main objective is to **prepare structured SQL commands** that will be executed by a **Java-based Fintech system**.

### **Topics Covered**
- **Database Modeling (ER Diagram)** for Fintech applications.
- **SQL Data Manipulation (INSERT, UPDATE, SELECT)** for user transactions.
- **Data Integrity Constraints (PRIMARY KEY, FOREIGN KEY)** for relational consistency.
- **SQL Query Optimization** for financial data retrieval.

---
🚀 **This project provides a structured approach to database integration in a Fintech system!**
---

Developed by **JonasHCzaja**.
