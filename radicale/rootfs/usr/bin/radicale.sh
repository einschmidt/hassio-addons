#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Radicale
#
# Launch Radicale
# ------------------------------------------------------------------------------

main() {
    bashio::log.trace "${FUNCNAME[0]}"

    ARGS=$(bashio::config 'args')

    if bashio::fs.file_exists '/share/radicale/config'; then
        bashio::log.info "Found custom config"
        CONFIG_PATH=/share/radicale/config
    else
        bashio::log.info "No custom config found"
        bashio::log.info "Use addon config"
        CONFIG_PATH=/etc/radicale/config
    fi

    python3 -m radicale --config ${CONFIG_PATH} ${ARGS}
}

main "$@"