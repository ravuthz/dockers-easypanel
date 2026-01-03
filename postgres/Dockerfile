# Use Postgres 17 Alpine as base
FROM postgres:17-alpine3.21

# Enable pg_stat_statements and log_connections at container start
CMD [
  "postgres",
  "-c", "shared_preload_libraries=pg_stat_statements",
  "-c", "pg_stat_statements.track=all",
  "-c", "pg_stat_statements.max=10000",
  "-c", "log_connections=on"
]
