docker cp db-dump query-comparison-postgres:/dump/;
database=query-comparison;
docker exec query-comparison-postgres pg_restore --username=postgres --dbname=$database --clean --verbose dump/$database;
docker exec query-comparison-postgres sh -c 'rm -rf dump';
