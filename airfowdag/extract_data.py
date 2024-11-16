from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import requests
import pandas as pd

# Function to extract and save raw data
def extract_data():
    url = "https://restcountries.com/v3.1/all"
    response = requests.get(url)
    response.raise_for_status()  # Ensure the request was successful
    
    data = response.json()
    df = pd.json_normalize(data)  # Flatten JSON to DataFrame
    df.to_parquet("/tmp/countries_raw.parquet", index=False)

# DAG definition
default_args = {
    "start_date": datetime(2023, 1, 1),
    "retries": 1,
}
with DAG(
    dag_id="extract_data",
    default_args=default_args,
    schedule_interval="@daily",
    catchup=False,
) as dag:
    extract_task = PythonOperator(
        task_id="extract_data",
        python_callable=extract_data,
    )
