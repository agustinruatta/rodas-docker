#!/bin/bash
#help: Runs Doctrine migrations
docker exec rodas_webserver bash -c '
    /var/www/doctrine migrations:migrate'
