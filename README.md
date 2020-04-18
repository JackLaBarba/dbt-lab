# What's here


# How to set this up

1. install dbt: `pip install dbt`
2. follow the steps on [this page](https://docs.getdbt.com/tutorial/setting-up/)
   to create a GCP project, enable BigQuery, and download a credentials file.
3. follow the steps
   [here](https://docs.getdbt.com/tutorial/create-a-project-dbt-cli#connect-to-bigquery)
   to add the GCP credentials file to your `~/.dbt/` dir and to create a
   `~/.dbt/profiles` file
4. update the `profile_name` in `dbt_project.yml` to match the profile_name you
   set in `~/.dbt/profiles`
5. test the configuration `dbt debug`.

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

# Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
