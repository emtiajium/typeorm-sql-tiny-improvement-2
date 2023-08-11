rm -rf du-dump;
mkdir db-dump;
database=query-comparison;
docker exec query-comparison-postgres pg_dump --username=postgres --dbname=$database --format=custom --verbose > db-dump/$database;
