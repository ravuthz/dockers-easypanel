# Use official PostgreSQL 17 Alpine image
FROM postgres:17-alpine3.21

# Optional: Add a custom healthcheck to ensure DB is ready
# HEALTHCHECK --interval=5s --timeout=5s --retries=5 \
#   CMD pg_isready -U ${POSTGRES_USER:-postgres}

# Copy a custom configures into container
COPY ./pg_hba.conf /etc/postgresql/pg_hba.conf
COPY ./postgresql.conf /etc/postgresql/postgresql.conf
COPY ./docker-entrypoint.sh /usr/local/bin/custom-entrypoint.sh

# Copy init SQL script to create extension
COPY ./init-pgsql.sql /docker-entrypoint-initdb.d/init-pgsql.sql

# Ensure postgres user can read the config
RUN chown -R postgres:postgres /etc/postgresql /docker-entrypoint-initdb.d

RUN chmod +x /usr/local/bin/custom-entrypoint.sh

# Override entrypoint script
ENTRYPOINT ["custom-entrypoint.sh"]

# Start Postgres with config AND override log settings explicitly
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf", "-c", "hba_file=/etc/postgresql/pg_hba.conf"]