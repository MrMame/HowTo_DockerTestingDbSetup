# How to setup Postgresql-Database testing Environment with Docker



## Overview
If you want to run a test postgresql database for testing your application, you want to use docker.
By using virtualization, you don't pollute your testing environment since you don't have to install the database
like on a productive machine.

To set up the testing-database schema and data, you can use a external sql file that defines all necessary steps.

Additionaly, everything can get started by using a single bash file.

## Step-By-Step

1. Install Docker.
2. Create a folder that will contain all necessary files in a single place. 
e.g. ```<Projectfolder>/environment/testing/database```
3. Create a ```docker-compose.yml``` inside this directory for using the necessary docker-images.
The following docker-compose.yml file was taken from the official docker-image page of postgres.
This will also download the adminer docker-image for managing the postgres database via web ui.
``` Docker
# Use postgres/example user/password credentials
version: '3.1'

services:

  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_PASSWORD: example

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080
```
4. Crate a shell bash-script that will automate all necessary steps you wish to do
before starting the test database. The bash script ```createAndRundDockerTestDB.sh``` will start
the docker-compose.yml file and its container instances. After that, the script will copy the 
```createTestDb.sql``` file into the docker container so it can be run from inside.
When the sql file is copied, the last command of the bash file will run the sql file
via psql inside the container, which ends up in creating the test db.
5. After all you are now able to connect to the test database by using the port defined in the
defined inside the ```docker-compose.yml``` file.




## Appendix - Docker commands

- Start/stop docker-compose.yml images
```
    sudo docker compose -f ./docker-compose.yml up --detach     // "-f <dockerComposeFilename> will target a file
                                                                // "up" will use ,among other things, container_names definitions
                                                                // --detach will proceed commandline processing of shell script
    sudo docker compose stop
    sudo docker compose stop <imageName>
```
- List all running instances of compose
```
    sudo docker compose ps
```

