## postgres-superset
Clone this repo.

https://github.com/yantramcloud/harsh_docker_postgres.git

Drop your db-dump in postgresql directory.
Execute following:

	cd postgresql

Cleanup any left overs .
	
	docker-compose down -v
Bring up redis and postgres : 
    
    docker-compose up -d redis postgres
Start Superset
    
	docker-compose up -d superset
Initialize demo:

	docker-compose exec superset superset-init

Login and verify: hit your local host to 8088 
	
	http://localhost:8088/ 

this is very very temporary, docker is not executing startup scripts by some reason. need to debug. for now import your dump manually.

	docker exec -it postgresql_postgres_1  psql -U superset -d superset -f /docker-entrypoint-initdb.d/sql_dump.sql


Verify Postgresql dump
	
	docker exec -it postgresql_postgres_1 bash
	psql -U superset
	\c postgres
	postgres=# \dt
	
	
	
you should see your exported tables here.
