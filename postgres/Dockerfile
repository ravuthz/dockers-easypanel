# Use official PostgreSQL 17 Alpine image
FROM postgres:17-alpine3.21

# Set environment variables for default DB/user (optional)
# ENV POSTGRES_DB=postgres
# ENV POSTGRES_USER=postgres
# ENV POSTGRES_PASSWORD=postgres

# Optional: Add a custom healthcheck to ensure DB is ready
# HEALTHCHECK --interval=5s --timeout=5s --retries=5 \
#   CMD pg_isready -U ${POSTGRES_USER:-postgres}

# Copy a custom postgresql.conf into container
COPY ./postgresql.conf /etc/postgresql/postgresql.conf

# Ensure postgres user can read the config
RUN chown postgres:postgres /etc/postgresql/postgresql.conf

# Set container to use your custom config
# USER postgres

# Override default command to use custom config
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
