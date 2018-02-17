CREATE USER rodas;
ALTER USER rodas WITH PASSWORD 'password';
ALTER USER rodas WITH SUPERUSER;

CREATE DATABASE rodas;
CREATE DATABASE rodas_test;

GRANT ALL PRIVILEGES ON DATABASE rodas TO rodas;
GRANT ALL PRIVILEGES ON DATABASE rodas_test TO rodas;