# This Project

This is a project that I created to demonstrate
[dbt](https://docs.getdbt.com/docs/introduction) and
[BigQuery](https://cloud.google.com/bigquery). 

There are two separate data marts here, one is about COVID-19, and the other
one is about liquor sales in Iowa (which is a little more fun).

## COVID

These models create a table in BigQuery that joins together data from BigQuery's
publicly available COVID-19 and Census datasets.

![The data](/etc/data_lineage.png)

By combining these two sets of source data, we can derive new
information. In this case, I calculated confirmed cases per 10,000 people in each US
county.

![The results](/etc/model_example.png)

## Liquor

This mart joins together Iowan liquor sales data with historical climate
data.

![The results](/etc/liquor_weather_data_lineage.png)

The result is a model which shows the correlation between average
temperature and triple sec sales. This supports the unsurprising hypothesis
that Iowans drink more margaritas in warm months.

![The results](/etc/triple_sec_versus_avg_temps.png)


# Setup

You'll need `python` and `pip` installed.

1. install dbt: 
```sh
pip install dbt
```
2. follow the steps on [this page](https://docs.getdbt.com/tutorial/setting-up/)
   to create a GCP project, enable BigQuery, and download a credentials file.
3. follow the steps
   [here](https://docs.getdbt.com/tutorial/create-a-project-dbt-cli#connect-to-bigquery)
   to add the GCP credentials file to your `~/.dbt/` dir and to create a
   `~/.dbt/profiles` file
4. update `profile_name` in `dbt_project.yml` to match the profile name you
   set in `~/.dbt/profiles`
5. test the configuration
```sh
dbt debug
```

# How to run

## To create the models

```sh
dbt run
```

This will create a tables and/or views in BigQuery corresponding to the defined
models.

## To test that the models are valid

```sh
dbt test
```

## To view the documentation

```sh
# you'll see a few permission errors on bigquery-public-data. That's ok.
dbt docs generate
dbt docs serve
```

Your browser will automatically open up to a site describing the data models

# Ideas for future work

- Visualize this geographic data on a map
- Add more attributes to data data model and use those as features in a machine
  learning model
- Apply dimensional modelling techniques
- Add more tests
