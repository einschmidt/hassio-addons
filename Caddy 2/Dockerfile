ARG BUILD_FROM
FROM $BUILD_FROM

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

RUN set -eux; \
	mkdir -p \
		/data/caddy \
    ;

# https://github.com/caddyserver/caddy/releases
ENV CADDY_VERSION 2.1.1

# Install Caddy
RUN set -eux; \
	APKARCH="$(apk --print-arch)"; \
	case "$APKARCH" in \
		x86_64)  BINARCH='amd64' ;; \
		armhf)   BINARCH='armv6' ;; \
		armv7)   BINARCH='armv7' ;; \
		aarch64) BINARCH='arm64' ;; \
		*) echo >&2 "error: unsupported architecture ($apkArch)"; exit 1 ;;\
	esac; \
    curl -J -L -o /tmp/caddy.tar.gz "https://github.com/caddyserver/caddy/releases/download/v${CADDY_VERSION}/caddy_${CADDY_VERSION}_linux_${BINARCH}.tar.gz"; \
	tar zxvf /tmp/caddy.tar.gz -C /usr/bin caddy; \
	chmod +x /usr/bin/caddy; \
	rm -rf /tmp/caddy; \
	caddy version

ENV XDG_CONFIG_HOME=/data
ENV XDG_DATA_HOME=/ssl

EXPOSE 80
EXPOSE 443
EXPOSE 2019

# Labels
LABEL \
    io.hass.name="Caddy 2" \
    io.hass.description="Caddy 2 web server" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Berichta" \
    org.label-schema.description="Caddy 2 add-on by Berichta" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Caddy 2" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/berichta/hassio-addons" \
    org.label-schema.usage="https://github.com/berichta/hassio-addons/blob/master/Caddy%202/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/berichta/hassio-addons" \
    org.label-schema.vendor="Berichta"
