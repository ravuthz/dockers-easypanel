SELECT name, setting, context, source
FROM pg_settings
WHERE name IN (
    'log_connections',
    'log_disconnections', 
    'log_line_prefix',
    'log_min_error_statement',
    'shared_preload_libraries'
);

SELECT pid, usename, datname, client_addr, state, query, backend_start
FROM pg_stat_activity ORDER BY backend_start;

-- SHOW log_connections;
-- SHOW log_disconnections;
-- SHOW shared_preload_libraries;

\echo
\echo 1. connect to 'postgres' database
\c postgres


\echo
\echo 2. 'list extensions'
\dx


\echo
\echo 3. list databases
\l


\echo
\echo 4. 'list tables'
\dt


\echo
\echo '\\? list commands'
-- \?

-- CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
-- SELECT * FROM pg_stat_statements LIMIT 5;
-- SELECT count(*) FROM pg_stat_statements;
