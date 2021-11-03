#!/bin/bash


docker rm --force postgrest_tut_db_1 postgrest_tut_server_1 postgrest_tut_swagger_1
docker-compose up -d
docker ps
docker logs postgrest_tut_db_1
