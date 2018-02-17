#!/bin/bash
#help: Executes a bash instance in container name: webserver|postgres|redis|...

if [ $# -eq 0 ]
  then
      CONTAINER=webserver
  else
      echo "Running with $1"
     CONTAINER=$1
fi

docker exec -it -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM rodas_$CONTAINER /bin/bash
