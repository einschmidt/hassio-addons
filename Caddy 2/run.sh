#!/bin/bash
set -e

CONFIG_PATH="/data/options.json"
CADDY_SHARE_PATH="/share/caddy"
DEFAULT_ARGS=( "--config" "$CADDY_SHARE_PATH/Caddyfile" )
FALLBACK_DEFAULT_ARGS=( "--config" "/etc/caddy/Caddyfile")
readarray -t ARGS < <(jq --raw-output '.args[]' $CONFIG_PATH)

if [ -f "$CADDY_SHARE_PATH/Caddyfile" ]; then
    caddy run ${DEFAULT_ARGS[*]} ${ARGS[*]}
else
    export EMAIL="$(jq --raw-output '.email' $CONFIG_PATH)"
    export DOMAIN="$(jq --raw-output '.domain' $CONFIG_PATH)"
    export DESTINATION="$(jq --raw-output '.destination' $CONFIG_PATH)"
    export PORT="$(jq --raw-output '.port' $CONFIG_PATH)"
    caddy run ${FALLBACK_DEFAULT_ARGS[*]} ${ARGS[*]}
fi
