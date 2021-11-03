#!/bin/bash
source token.jwt
AUTHORIZATION="Bearer ${TOKEN}"
echo -e "\e[41mInsert\e[m"

http --json POST http://localhost:3000/todos  Authorization:"${AUTHORIZATION}" task="learn how to auth"

echo -e "\e[41mselect all\e[m"
http http://localhost:3000/todos

