# 🏛️ Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀

This project demonstrates a comprehensive data warehousing and analytics solution, from building a robust data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics using the **Medallion Architecture**.

---

## 🏗️ Data Architecture (Medallion Framework)

Dự án áp dụng nguyên tắc **Separation of Concerns (SoC)** để tổ chức dữ liệu theo các lớp có chất lượng tăng dần:

| Tiêu chí | 🥉 **Bronze Layer** | 🥈 **Silver Layer** | 🥇 **Gold Layer** |
| :--- | :--- | :--- | :--- |
| **Definition** | Raw, unprocessed data as-is from sources | Clean & standardized data | Business-Ready data |
| **Objective** | Traceability & Debugging | (Intermediate Layer) Prepare Data for Analysis | Provide data to be consumed for reporting & Analytics |
| **Object Type** | Tables | Tables | Views |
| **Load Method** | Full Load (Truncate & Insert) | Full Load (Truncate & Insert) | None |
| **Data Transformation** | None (as-is) | • Data **Cleaning** <br> • Data **Standardization** <br> • Data **Normalization** <br> • **Derived** Columns <br> • Data **Enrichment** | • Data **Integration** <br> • Data **Aggregation** <br> • **Business Logic** & Rules |
| **Data Modeling** | None (as-is) | None (as-is) | • **Star Schema** <br> • **Aggregated** Objects <br> • **Flat Tables** |
| **Target Audience** | • Data Engineers | • Data Analysts <br> • Data Engineers | • Data Analysts <br> • Business Users |



---

## 🚀 Project Requirements

### 1. Building the Data Warehouse (Data Engineering)
* **Objective**: Develop a modern data warehouse using **SQL Server** to consolidate sales data.
* **Specifications**:
    * **Data Sources**: Import data from two source systems (**ERP** and **CRM**) provided as CSV files.
    * **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
    * **Integration**: Combine both sources into a single, user-friendly data model.
    * **Scope**: Focus on the latest dataset; historization is not required for this version.
    * **Documentation**: Clear documentation of the data model for stakeholders.

### 2. BI: Analytics & Reporting (Data Analysis)
* **Objective**: Develop SQL-based analytics to deliver detailed insights into:
    * 👤 **Customer Behavior**
    * 📦 **Product Performance**
    * 📈 **Sales Trends**

---

## 📂 Repository Structure

```text
data-warehouse-project/
│
├── 📁 datasets/                # Raw datasets (ERP and CRM data)
│
├── 📁 docs/                    # Architecture & Documentation
│   ├── etl.drawio              # ETL techniques and methods
│   ├── data_architecture.drawio # Project's high-level architecture
│   ├── data_catalog.md         # Metadata & field descriptions
│   ├── data_flow.drawio        # Data flow diagram
│   ├── data_models.drawio      # Star Schema & Data Models
│   └── naming-conventions.md   # Guidelines for tables & columns
│
├── 📁 scripts/                 # SQL Transformation Scripts
│   ├── 🥉 bronze/              # Scripts for extracting and loading raw data
│   ├── 🥈 silver/              # Scripts for cleaning and transforming data
│   └── 🥇 gold/                # Scripts for creating analytical models
│
├── 📁 tests/                   # Data quality & SQL test scripts
│
├── README.md                   # Project overview
├── LICENSE                     # License information
└── requirements.txt            # Project dependencies
