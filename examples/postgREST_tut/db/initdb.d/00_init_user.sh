#!/bin/bash
#
# init users for database
# This is a shell script to easily pick up environment variables
# which can then be configured in a docker-compose .env file.

dropdb --if-exists api
dropuser --if-exists dba
dropuser --if-exists authenticator

cat - <<EOF | psql
begin work;
CREATE USER dba SUPERUSER PASSWORD '${DBA_PW}';
ALTER USER dba SET SEARCH_PATH = api,public;
-- no special rights for APP_USER
CREATE USER ${APP_USER} PASSWORD '${APP_PW}';
ALTER USER ${APP_USER} SET SEARCH_PATH = api,public;
-- postgREST tut specific role
create role authenticator noinherit login password '${AUTH_PW}';
ALTER USER authenticator SET SEARCH_PATH = api,public;

COMMIT;

-- can't create a database inside a transaction.
CREATE DATABASE api OWNER dba;
EOF
