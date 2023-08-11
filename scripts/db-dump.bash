rm -rf du-dump;
mkdir db-dump;
database=typeorm-sql-tiny-improvement-2;
docker exec typeorm-sql-tiny-improvement-2-postgres pg_dump --username=postgres --dbname=$database --format=custom --verbose > db-dump/$database;
