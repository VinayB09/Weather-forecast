
# Welcome to Weather forecast

Weather forecast is a Ruby on Rails based web application 
which can be used for fetching overview of your location's weather conditions.

You only need to provide your location and zip code to get a brief overview of you current and upcoming weather conditions. 

## Dependency

* Ruby
    `2.7.4 `

* Rails 
    `7.0.2`

* PostgreSQL 
    `12 or above`

* Redis is used for caching the request, therefore to run this application seamelessly you must install `redis-server` in your environment.

Have a look at the below link to know redis installation.
`https://redis.io/topics/quickstart#:~:text=%20Redis%20Quick%20Start%20%201%20%0AInstalling%20Redis.,If%20you%20use%20Redis%20in%20a...%20More%20`

You can configure any database for this application. 

All you need to do is update the environment variables mentioned in `.env` file and as well as update the `config/credentials/` with appropriate database credentials. 

By default this is configured with PostgreSQL.

## Getting started

1. Pull the repo to your local machine.

`git clone <repo_url>`

2. Before the setup, user must update `.env` file to setup ENV variables.

Here are some default values for ENV variables.

`REDIS_DB=0`

`REDIS_URL=redis://127.0.0.1`

`REDIS_PORT=6379`

`OPEN_WEATHER_API_URL="http://api.openweathermap.org/data/2.5"`

`NO_OF_FORECAST_DAYS=4`

`POSTGRES_URL=localhost`

`POSTGRES_PORT=5432`

once variables are setup run the following command to set ENV variables in console session.

`source .env`

if the above command doesn't work user can manually set the environment variables in the session,

for example:

`export REDIS_PORT=6379`

3. Once environment variables are set, user can now edit the credentials files to set openweather api_key as well as postgres credentials.

Based on the environment, credentials can vary. Use the below command to view credential file in edit mode.
```bash
 EDITOR=vim rails credentials:edit -e development
 EDITOR=vim rails credentials:edit -e test
 EDITOR=vim rails credentials:edit -e production

 Using these commands user can set credentials for corresponding environment.

 Below is the sample format which can be included.

```bash
 openweather:
    api_key: <<openweather api_key here>>
 postgres:
    username: <<database user>>
    password: <<database password>>
```

4. Run bundle install

`bundle install`

5. Database setup

`bundle exec rake db:setup`

6. Run RSpec testcases

`bundle exec rspec`

6. Starting rails server

`rails server -p <<port no>>`

