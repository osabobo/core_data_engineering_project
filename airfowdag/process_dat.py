from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import pandas as pd

# Function to process data
def process_data():
    # Load raw data from Parquet
    df = pd.read_parquet("/tmp/countries_raw.parquet")
    
    # Select required fields and transform
    df_processed = pd.DataFrame({
        "country_name": df["name.common"],
        "official_name": df["name.official"],
        "independence": df.get("independent"),
        "un_member": df.get("unMember"),
        "start_of_week": df.get("startOfWeek"),
        "native_name": df.get("name.native", {}).apply(lambda x: list(x.values())[0].get("common", "") if isinstance(x, dict) else None),
        "currency_code": df.get("currencies", {}).apply(lambda x: list(x.keys())[0] if isinstance(x, dict) else None),
        "currency_name": df.get("currencies", {}).apply(lambda x: list(x.values())[0].get("name", "") if isinstance(x, dict) else None),
        "currency_symbol": df.get("currencies", {}).apply(lambda x: list(x.values())[0].get("symbol", "") if isinstance(x, dict) else None),
        "country_code": df.get("idd.root", "") + df.get("idd.suffixes").str[0],
        "capital": df.get("capital").str[0],
        "region": df.get("region"),
        "sub_region": df.get("subregion"),
        "languages": df.get("languages").apply(lambda x: ", ".join(x.values()) if isinstance(x, dict) else None),
        "area": df.get("area"),
        "population": df.get("population"),
        "continents": df.get("continents").str[0],
    })
    
    # Save to processed file
    df_processed.to_parquet("/tmp/countries_processed.parquet", index=False)

# DAG definition
default_args = {
    "start_date": datetime(2023, 1, 1),
    "retries": 1,
}
with DAG(
    dag_id="process_data",
    default_args=default_args,
    schedule_interval="@daily",
    catchup=False,
) as dag:
    process_task = PythonOperator(
        task_id="process_data",
        python_callable=process_data,
    )
