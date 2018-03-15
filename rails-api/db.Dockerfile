FROM postgres

ADD docker/test_database.sql /docker-entrypoint-initdb.d/test_database.sql