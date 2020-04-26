#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Caddy 2
#
# Launch Caddy
# ------------------------------------------------------------------------------
non_caddyfile_config() {
    local EMAIL
    local DOMAIN
    local DESTINATION
    local PORT
    local ARGS

    bashio::log.trace "${FUNCNAME[0]}"

    export EMAIL=$(bashio::config 'non_caddyfile_config.email')
    export DOMAIN=$(bashio::config 'non_caddyfile_config.domain')
    export DESTINATION=$(bashio::config 'non_caddyfile_config.destination')
    export PORT=$(bashio::config 'non_caddyfile_config.port')
    ARGS=$(bashio::config 'args')

    caddy run --config /etc/caddy/Caddyfile ${ARGS}
}

caddyfile_config() {
    local ARGS

    bashio::log.trace "${FUNCNAME[0]}"

    ARGS=$(bashio::config 'args')

    caddy run --config /share/caddy/Caddyfile ${ARGS}
}

main() {
    bashio::log.trace "${FUNCNAME[0]}"
    
    if bashio::fs.file_exists '/share/caddy/Caddyfile'; then
        bashio::log.info "Caddyfile found"
        caddyfile_config
    else
        bashio::log.info "No Caddyfile found"
        bashio::log.info "Use non_caddyfile_config"
        non_caddyfile_config
    fi
}
main "$@"