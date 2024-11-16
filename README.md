
# Travel Agency Data Platform Project

This project involves building a data platform for a travel agency to process data from the [REST Countries API](https://restcountries.com/v3.1/all) into a cloud-based data warehouse for predictive analytics. The platform extracts raw data, processes specific attributes, and organizes the data into Fact and Dimension tables using DBT.

## Project Components

### 1. Data Flow Architecture
- **API Data Source → Data Lake (Object Storage in Parquet format) → Processed Data Warehouse → Fact and Dimension Tables for Analytics**

### 2. Tools and Technologies
- **Programming Languages**: Python, SQL
- **Orchestration**: Apache Airflow
- **Data Modeling**: DBT (Data Build Tool)
- **Cloud Storage**: Object Storage (e.g., AWS S3, Azure Blob)
- **Database**: Cloud-based Data Warehouse (e.g., AWS Redshift, Snowflake)
- **Infrastructure**: Terraform
- **Containerization**: Docker
- **CI/CD**: GitHub Actions

### 3. Project Structure
```
.
├── dags/
│   ├── extract_data.py          # DAG for extracting raw data
│   ├── process_data.py          # DAG for processing specific fields
│   ├── load_to_dwh.py           # DAG for loading data to the warehouse
├── dbt/
│   ├── models/
│   │   ├── fact_tables.sql      # Fact table definitions
│   │   ├── dimension_tables.sql # Dimension table definitions
│   ├── dbt_project.yml          # DBT project configuration
├── terraform/
│   ├── main.tf                  # Infrastructure provisioning
│   ├── variables.tf             # Configurable variables
│   ├── outputs.tf               # Outputs for provisioning
│   ├── backend.tf               # Cloud Object Storage backend
├── Dockerfile                   # Docker image configuration
├── requirements.txt             # Python dependencies
└── .github/
    └── workflows/
        └── github_actions.yml   # CI/CD configuration
```

### 4. Workflow
1. **Extract Data**: 
   - Use Apache Airflow to extract raw data from the REST Countries API.
   - Store raw data in Cloud Object Storage as Parquet files.

2. **Process Data**: 
   - Transform data in the Data Lake to include only required attributes:
     - Country name, independence, UN membership, start of week, official name, etc.

3. **Load to Data Warehouse**: 
   - Write processed data into a Cloud Data Warehouse for analytics.

4. **Data Modeling**: 
   - Use DBT to organize data into Fact and Dimension tables.

5. **CI/CD**: 
   - GitHub Actions pipeline for linting, building Docker images, and pushing to a container registry.

6. **Infrastructure as Code (IaC)**: 
   - Use Terraform to provision cloud infrastructure, including Object Storage, IAM roles, and databases.

## Setup Instructions

### Prerequisites
- Docker
- Terraform CLI
- Apache Airflow
- DBT
- Python 3.9+
- GitHub repository with CI/CD secrets configured

### Steps
1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. **Build Docker Image**:
   ```bash
   docker build -t travel_agency_etl:latest .
   ```

3. **Run Airflow DAGs**:
   - Start Apache Airflow and trigger DAGs in the following order:
     1. `extract_data.py`
     2. `process_data.py`
     3. `load_to_dwh.py`

4. **Deploy Infrastructure with Terraform**:
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

5. **Run DBT Models**:
   ```bash
   cd dbt
   dbt run
   ```

6. **CI/CD Pipeline**:
   - Push changes to the `main` branch to trigger GitHub Actions.

## Outputs
- **Data Lake**: Parquet files in Cloud Object Storage
- **Data Warehouse**: Processed tables for analytics
- **Fact Tables**: Metrics for analysis (e.g., population density, years independent)
- **Dimension Tables**: Categorical data (e.g., currencies, languages)

## License
This project is licensed under the MIT License.

## Contact
For any questions or issues, please contact [Osagie Eboigbe](Mailto:johanneseboigbe55@yahoo.com).
