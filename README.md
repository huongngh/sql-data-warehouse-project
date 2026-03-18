# 🏛️ Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 
This project demonstrates an end-to-end **Data Warehousing & Analytics** solution — from ingesting raw data to delivering business-ready insights. Built as a **portfolio project**, it showcases industry best practices in **Data Engineering** and **Analytics** using the **Medallion Architecture**.

---

## 🏗️ Data Architecture (Medallion Framework)

The project follows the **Separation of Concerns (SoC)** principle by organizing data into layers with increasing quality, structure, and business value:

| Category                | 🥉 **Bronze Layer**                                      | 🥈 **Silver Layer**                                                                                                                         | 🥇 **Gold Layer**                                                                      |
| :---------------------- | :------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------ | :------------------------------------------------------------------------------------- |
| **Definition**          | Raw, unprocessed data ingested as-is from source systems | Cleaned and standardized data                                                                                                               | Curated, business-ready data                                                           |
| **Objective**           | Traceability & Debugging                                 | Prepare high-quality data for analysis                                                                                                      | Enable reporting & advanced analytics                                                  |
| **Object Type**         | Tables                                                   | Tables                                                                                                                                      | Views                                                                                  |
| **Load Method**         | Full Load (Truncate & Insert)                            | Full Load (Truncate & Insert)                                                                                                               | None                                                                                   |
| **Data Transformation** | None (as-is)                                             | • Data **Cleaning**  <br> • Data **Standardization**  <br> • Data **Normalization**  <br> • **Derived** Columns  <br> • Data **Enrichment** | • Data **Integration**  <br> • Data **Aggregation**  <br> • **Business Logic** & Rules |
| **Data Modeling**       | None (as-is)                                             | None (as-is)                                                                                                                                | • **Star Schema**  <br> • **Aggregated** Objects  <br> • **Flat Tables**               |
| **Target Audience**     | • Data Engineers                                         | • Data Engineers  <br> • Data Analysts                                                                                                      | • Data Analysts  <br> • Business Users                                                 |

---

## 🚀 Project Requirements

### 1️⃣ Building the Data Warehouse (Data Engineering)

**Objective**
Develop a modern **Data Warehouse** using **SQL Server** to consolidate and prepare sales data for analytics.

**Specifications**:

* **📥 Data Sources**: Import data from two operational systems (**ERP** and **CRM**) provided as CSV files.
* **🧹 Data Quality**: Clean, validate, and resolve data quality issues prior to analysis.
* **🔗 Data Integration**: Merge ERP and CRM data into a single, unified data model.
* **🎯 Scope**: Focus on the latest snapshot of data (no historization in this version).
* **📘 Documentation**: Provide clear and accessible documentation for technical and business stakeholders.

---

### 2️⃣ BI: Analytics & Reporting (Data Analysis)

**Objective**
Develop **SQL-based analytical queries** to generate insights in the following areas:

* 👤 **Customer Behavior**
* 📦 **Product Performance**
* 📈 **Sales Trends**

These insights are designed to support decision-making by analysts and business users.

---

## 📂 Repository Structure

```text
data-warehouse-project/
│
├── 📁 datasets/                 # Raw source datasets (ERP & CRM)
│
├── 📁 docs/                     # Architecture & documentation
│   ├── etl.drawio               # ETL techniques and methods
│   ├── data_architecture.drawio # High-level system architecture
│   ├── data_catalog.md          # Metadata & field definitions
│   ├── data_flow.drawio         # End-to-end data flow diagram
│   ├── data_models.drawio       # Star schema & data models
│   └── naming-conventions.md    # Table & column naming standards
│
├── 📁 scripts/                  # SQL scripts by data layer
│   ├── 🥉 bronze/               # Raw data ingestion scripts
│   ├── 🥈 silver/               # Data cleaning & transformation scripts
│   └── 🥇 gold/                 # Analytical & business models
│
├── 📁 tests/                    # Data quality checks & SQL tests
│
├── README.md                    # Project overview
├── LICENSE                      # License information
└── requirements.txt             # Project dependencies
```

---

## 🛠️ Tech Stack

* **Database**: SQL Server
* **Data Modeling**: Star Schema, Medallion Architecture
* **Tools**: SQL, Draw.io, Git

---

## 📖 How to Use

1. **Clone the repository**:

   ```bash
   git clone <your-repo-url>
   ```

2. **Execute SQL scripts** in the following order:

   ```text
   🥉 Bronze ➡️ 🥈 Silver ➡️ 🥇 Gold
   ```

3. **Review documentation**:

   * Refer to `docs/data_catalog.md` for detailed metadata and field descriptions.
   * Explore Draw.io diagrams for architecture, ETL, and data models.

---

## 🛡️ License

This project is licensed under the **MIT License**.
You are free to **use**, **modify**, and **share** this project with proper attribution.

---

✨ *If you find this project useful, feel free to star ⭐ the repository!*
