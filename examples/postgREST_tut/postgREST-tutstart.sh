#!/bin/bash
docker run --name tutorial -p 6433:5432 \
                -e POSTGRES_PASSWORD=mysecretpassword \
                -d postgres
