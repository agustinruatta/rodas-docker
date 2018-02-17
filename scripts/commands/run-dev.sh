#!/bin/bash
#help: Runs frontend dev watchers AKA: yarn run dev
docker exec -it rodas_webserver /bin/bash -c '
    cd /var/www/ ; yarn run dev'
