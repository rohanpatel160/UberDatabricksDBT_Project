# Uber Analytics Platform — Databricks + Unity Catalog + dbt (End-to-End Lakehouse Modernization Project)
Bronze → Silver → Gold Pipeline | Delta Lake • Databricks Asset Bundles • dbt Cloud • Unity Catalog

### Project Overview

This project is an end-to-end Lakehouse implementation for processing Uber-style trip datasets using:

**Databricks Autoloader**

**Delta Lake (Bronze, Silver, Gold)**

**Metadata-driven transformations**

**Reusable Python utilities**

**Unity Catalog for governance**

**dbt Cloud for Gold layer modeling**

**GitHub for CI/CD**

**Databricks Asset Bundles for repeatable production deployment**

The focus is on building scalable, automated, and production-ready data pipelines that follow real enterprise patterns.

### Architecture Overview

             ┌────────────────────────────┐
             │      Source CSV Files       │
             │   (Unity Catalog Volumes)   │
             └──────────────┬─────────────┘
                            ▼
             ┌────────────────────────────┐
             │         Bronze Layer        │
             │  Databricks Autoloader →   │
             │  Incremental Delta Tables  │
             └──────────────┬─────────────┘
                            ▼
             ┌────────────────────────────┐
             │         Silver Layer        │
             │ Cleansing • Joins • Metadata│
             │ Driven Python Utils         │
             └──────────────┬─────────────┘
                            ▼
             ┌────────────────────────────┐
             │          Gold Layer         │
             │    dbt Models (Dim/Fact)    │
             │  Tests • Docs • Lineage     │
             └──────────────┬─────────────┘
                            ▼
            BI Tools / ML / Dashboards (future)

### 1. Bronze Layer — Ingestion with Autoloader

**Autoloader features implemented**

Incremental ingestion

Schema evolution (addNewColumns)

Checkpointing

File discovery through cloudFiles

Idempotency (exactly-once)

Writes to Delta Lake Bronze tables

Paths used

Source files:
/Volumes/uber_cata/source/...

Bronze tables:
uber_cata.bronze.*

### Silver Layer — Transformation Logic
 
**Techniques implemented**

Standardization

Deduplication

Deriving duration flags

Cleaning special characters

Join enrichment logic

Reusable Python utilities under /src/utils/

Parameterized using Unity Catalog variables

Outputs

Silver tables stored as Delta:
uber_cata.silver.customers
uber_cata.silver.drivers
uber_cata.silver.locations
uber_cata.silver.vehicles
uber_cata.silver.payments

### 3. Gold Layer — Dimensional Models with dbt

**dbt Cloud Project includes:**

fact_stream

dim_drivers

dim_locations

dim_vehicles

dim_customers

**dbt Features Implemented**

Ref-based DAG modeling

Tests (unique, not null, relationships)

Macros for reusable logic

Snapshots (optional SCD2)

Documentation website

GitHub-synced branching

All models run on Databricks SQL warehouse.

### 4. Databricks Asset Bundles for Deployment

**Your bundle (databricks.yml) includes:**

Dev environment

Cluster definition

Job definitions

Bronze → Silver notebook tasks

Variable-based catalog + schema usage

**Fully repeatable deployments with:**

databricks bundle deploy -t dev

**What bundling ensures:**

✔ Jobs are version-controlled
✔ Deployments are consistent
✔ Future edits automatically versioned
✔ Git + Databricks always stay in sync

### 5. Project Structure

UberDatabricksDBT_Project/
│
├── databricks.yml                 # Bundle deployment config
├── src/                           # Bronze & silver notebooks + utils
│   ├── bronze_ingestion
│   ├── silver_transformation
│   └── utils/utilities.py
│
├── resources/                     # Job & pipeline definitions
│   ├── uber_bronze_silver_job.yml
│   └── other job configs
│
├── models/                        # dbt Gold models (facts/dims)
├── macros/                        # dbt macros
├── seeds/                         # optional seed data
├── snapshots/                     # optional SCD2 snapshots
├── tests/                         # dbt tests
└── README.md

### 6. Reproducibility — How To Run This Repo
1️⃣ Clone Repository
git clone https://github.com/rohanpatel160/UberDatabricksDBT_Project.git

2️⃣ Import Folder into Databricks Workspace
3️⃣ Validate Bundle
databricks bundle validate

4️⃣ Deploy to Dev
databricks bundle deploy -t dev

5️⃣ Run Bronze + Silver job

From Databricks → Workflows.

6️⃣ Run dbt Models in dbt Cloud

### 7. Tools & Technologies

| Layer           | Tech                            |
| --------------- | ------------------------------- |
| Ingestion       | Databricks Autoloader           |
| Storage         | Delta Lake                      |
| Governance      | Unity Catalog                   |
| Transformations | PySpark, Python Utils           |
| Modeling        | dbt Cloud                       |
| Orchestration   | Databricks Jobs • Asset Bundles |
| Version Control | GitHub                          |
| Warehouse       | Databricks SQL Warehouse        |

### 8. Future Extensions (optional Azure integrations)

These are not done in this repo, but you understand and can implement end-to-end Azure pipelines.

Add ADF orchestration for Bronze ingestion

Add Azure Functions for event-driven triggers

Add Logic Apps for automated validation

Add Azure SQL for business rules storage

Add Power BI dashboard

Add streaming ingestion (Kafka/EventHub → Autoloader)

This section shows your Azure knowledge without lying.

### 9. Why This Project Stands Out

✔ Shows full Lakehouse architecture
✔ dbt + Databricks integration (rare skill)
✔ Real enterprise coding patterns
✔ Clean repo + CI/CD readiness
✔ Demonstrates deep understanding of Delta Lake + Unity Catalog
✔ Shows you're ready for Data Engineer & Analytics Engineer roles
