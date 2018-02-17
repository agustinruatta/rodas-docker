#!/bin/bash
#help: Runs migrations
docker exec rodas_webserver bash -c '
    /var/www/doctrine migrations:migrate'
