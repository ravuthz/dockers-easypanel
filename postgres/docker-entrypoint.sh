#!/bin/sh
set -e

HBA_FILE="/etc/postgresql/pg_hba.conf"

# Append whitelist dynamically
if [ -n "$DB_WHITELIST_IPS" ]; then
  echo "" >> "$HBA_FILE"
  echo "" >> "$HBA_FILE"
  echo "# DYNAMIC WHITELIST: Generate from DB_WHITELIST_IPS via custom-entrypoint.sh" >> "$HBA_FILE"
  echo "$DB_WHITELIST_IPS" | tr ',' '\n' | while read -r ip; do
    [ -n "$ip" ] && echo "host  all  all  $ip  md5" >> "$HBA_FILE"
  done
else
  echo "# No whitelist IPs provided" >> "$HBA_FILE"
fi

echo "[custom-entrypoint.sh]: generate whitelist ips to "$HBA_FILE"."

chown postgres:postgres "$HBA_FILE"

# Start Postgres
exec docker-entrypoint.sh "$@"
