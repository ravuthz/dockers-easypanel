# Use official PostgreSQL 17 Alpine image
FROM postgres:17-alpine3.21

# Optional: Add a custom healthcheck to ensure DB is ready
# HEALTHCHECK --interval=5s --timeout=5s --retries=5 \
#   CMD pg_isready -U ${POSTGRES_USER:-postgres}

# Copy a custom postgresql.conf into container
COPY ./postgresql.conf /etc/postgresql/postgresql.conf

# Copy init SQL script to create extension
COPY ./init-pgsql.sql /docker-entrypoint-initdb.d/init-pgsql.sql

# Ensure postgres user can read the config
RUN chown -R postgres:postgres /etc/postgresql /docker-entrypoint-initdb.d

# Start Postgres with config AND override log settings explicitly
CMD ["postgres","-c", "config_file=/etc/postgresql/postgresql.conf","-c", "log_disconnections=on","-c", "log_line_prefix=%m [%p] %u@%d "]
