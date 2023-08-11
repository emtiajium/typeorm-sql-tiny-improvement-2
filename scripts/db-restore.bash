docker cp db-dump typeorm-sql-tiny-improvement-2-postgres:/dump/;
database=typeorm-sql-tiny-improvement-2;
docker exec typeorm-sql-tiny-improvement-2-postgres pg_restore --username=postgres --dbname=$database --clean --verbose dump/$database;
docker exec typeorm-sql-tiny-improvement-2-postgres sh -c 'rm -rf dump';
