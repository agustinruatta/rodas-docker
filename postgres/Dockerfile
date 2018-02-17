FROM postgres:10.2

MAINTAINER Agustín Ruatta <agustinruatta@gmail.com>

# Add file to create users and databases
ADD init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

