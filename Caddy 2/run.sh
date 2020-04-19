#!/bin/bash
set -e

CONFIG_PATH="/data/options.json"
CADDY_SHARE_PATH="/share/caddy"
DEFAULT_ARGS=( "--config" "$CADDY_SHARE_PATH/Caddyfile" )
readarray -t ARGS < <(jq --raw-output '.args[]' $CONFIG_PATH)

caddy run ${DEFAULT_ARGS[*]} ${ARGS[*]}
