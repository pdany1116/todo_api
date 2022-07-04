# ToDo - API
Rails 7 ToDo API

## Setup
Step 1. Create development environment variables file and replace necessary variables 
> cp .env.example .env

Step 2. Build docker image
> docker-compose build

Step 3. Create development database
> docker-compose run todo-api rails db:create db:migrate

Step 4. Run todo-api
> docker-compose up

You should be able to do requests on `http://localhost:3000`
