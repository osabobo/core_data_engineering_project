
# Data Platform for Travel Agency: Leveraging API Data for Predictive Analytics

## Project Overview
This project creates a robust Data Platform for a Travel Agency to process and analyze data from the Country REST API ([https://restcountries.com/v3.1/all](https://restcountries.com/v3.1/all)). The platform leverages scalable cloud infrastructure, Apache Airflow for orchestration, and DBT for data modeling to enable predictive analytics.

---

## Architecture
### Workflow:
1. **API Data Source** → Extract raw data.
2. **Data Lake (Cloud Object Storage in Parquet format)** → Store raw data.
3. **Processed Layer (Cloud Database/Data Warehouse)** → Store transformed data.
4. **Modeled Layer (DBT Fact and Dimension Tables)** → Optimized for analytics.

### Tools:
- **Apache Airflow**: Workflow orchestration.
- **DBT**: Data modeling and analytics.
- **Terraform**: Infrastructure as code.
- **CI/CD (GitHub Actions)**: Automate testing, builds, and deployments.
- **Docker**: Containerization for reproducibility.

---

## Key Features
1. **Raw Data Storage**: Full API data stored in Parquet format.
2. **Processed Data**: Extracts key fields for analytics:
   - Country Name
   - Independence
   - United Nations Membership
   - Start of Week
   - Capital, Region, Subregion
   - Languages, Area, Population, Continents
   - Currency Details (Code, Name, Symbol)
   - Concatenated Country Code (`idd.root` + `idd.suffix`)
3. **Orchestration**: Apache Airflow DAGs automate extraction, transformation, and loading.
4. **CI/CD Pipeline**:
   - Linting with Flake8.
   - Docker image build and push.
5. **Infrastructure Provisioning**: Terraform scripts manage all cloud resources.

---

## Setup Instructions

### Prerequisites
- Python 3.9+
- Docker
- Terraform
- Cloud provider account (AWS, Azure, or GCP)

### Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo/data-platform.git
   cd data-platform
   ```

2. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Set up environment variables:
   - API Key (if required).
   - Cloud credentials.

4. Deploy infrastructure using Terraform:
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

5. Start Apache Airflow:
   ```bash
   airflow db init
   airflow webserver -p 8080
   airflow scheduler
   ```

6. Run DBT to model the data:
   ```bash
   dbt run
   ```

---

## Repository Structure
```
📦project-repo
 ┣ 📂airflow_dags
 ┃ ┣ 📜extract_data.py
 ┃ ┣ 📜process_data.py
 ┃ ┗ 📜load_to_dwh.py
 ┣ 📂terraform
 ┃ ┣ 📜main.tf
 ┃ ┣ 📜variables.tf
 ┃ ┣ 📜outputs.tf
 ┃ ┗ 📜backend.tf
 ┣ 📂dbt
 ┃ ┣ 📂models
 ┃ ┃ ┣ 📜fact_tables.sql
 ┃ ┃ ┗ 📜dimension_tables.sql
 ┃ ┗ 📜dbt_project.yml
 ┣ 📂docker
 ┃ ┣ 📜Dockerfile
 ┃ ┗ 📜requirements.txt
 ┣ 📜README.md
 ┗ 📜requirements.txt
```

---

## Contact Information
- **Name**: Osagie Eboigbe
- **Email**: johanneseboigbe55@yahoo.com
- **LinkedIn**: [https://www.linkedin.com/in/osagie-eboigbe-52b84794/](#)
