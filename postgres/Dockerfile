# Use Postgres 17 Alpine as base
FROM postgres:17-alpine3.21

# Enable pg_stat_statements and log_connections at container start
RUN cat <<EOF >> /etc/postgresql/postgresql.conf
shared_preload_libraries=pg_stat_statements
pg_stat_statements.track=all
pg_stat_statements.max=10000
log_connections = on
log_disconnections = on
log_line_prefix = '%m [%p] %u@%d '
EOF

CMD ["postgres"]
