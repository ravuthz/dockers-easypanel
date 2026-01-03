# Test

```bash

# Run test with docker compose

docker compose up --build -d

docker compose exec -T postgres sh -c 'psql -U psql_user -d postgres' < ./test.sql

# Extra check configures
docker compose exec postgres cat /var/lib/postgresql/data/pg_hba.conf

docker compose exec postgres ls -lah /etc/postgresql/
docker compose exec postgres cat /etc/postgresql/pg_hba.conf
docker compose exec postgres cat /etc/postgresql/postgresql.conf



# Run test with docker cli

docker build -t postgres_db .

docker run -d --name postgres_db \
  -p 5432:5432 \
  --env-file .env \
  -v pg_data:/var/lib/postgresql/data \
  postgres_db

docker stop postgres_db && docker rm postgres_db

docker exec -i postgres_db sh -c 'psql -U psql_user -d postgres' < ./test.sql

# docker exec -it postgres_db psql -U psql_user -d postgres

# Extra check configures
docker exec -it postgres_db cat /var/lib/postgresql/data/pg_hba.conf

docker exec -it postgres_db ls -lah /etc/postgresql/
docker exec -it postgres_db cat /etc/postgresql/pg_hba.conf
docker exec -it postgres_db cat /etc/postgresql/postgresql.conf

```
