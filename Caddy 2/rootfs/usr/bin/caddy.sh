#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Caddy 2
#
# Launch Caddy
# ------------------------------------------------------------------------------
non_caddyfile_config() {
    bashio::log.trace "${FUNCNAME[0]}"

    export EMAIL=$(bashio::config 'non_caddyfile_config.email')
    export DOMAIN=$(bashio::config 'non_caddyfile_config.domain')
    export DESTINATION=$(bashio::config 'non_caddyfile_config.destination')
    export PORT=$(bashio::config 'non_caddyfile_config.port')
    CONFIG_PATH=/etc/caddy/Caddyfile
}

main() {
    bashio::log.trace "${FUNCNAME[0]}"

    ARGS=$(bashio::config 'args')

    if bashio::fs.file_exists '/share/caddy/caddy'; then
        CADDY_PATH=/share/caddy/caddy

        bashio::log.info "Found custom Caddy"

        ${CADDY_PATH} version
    else
        CADDY_PATH=/usr/bin/caddy

        bashio::log.info "Use built-in Caddy"

        ${CADDY_PATH} version
    fi
    
    if bashio::fs.file_exists '/share/caddy/Caddyfile'; then
        bashio::log.info "Caddyfile found"
        CONFIG_PATH=/share/caddy/Caddyfile
    else
        bashio::log.info "No Caddyfile found"
        bashio::log.info "Use non_caddyfile_config"
        non_caddyfile_config
    fi

    ${CADDY_PATH} run --config ${CONFIG_PATH} ${ARGS}
}
main "$@"
