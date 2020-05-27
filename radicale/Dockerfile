ARG BUILD_FROM
FROM $BUILD_FROM

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

ARG RADICALE_VERSION=3.0.2

# Install Caddy
RUN set -eux; \
	python3 -m pip install radicale==$RADICALE_VERSION

EXPOSE 5232

# Labels
LABEL \
    io.hass.name="Radicale" \
    io.hass.description="CalDAV and CardDAV Server" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Berichta" \
    org.label-schema.description="Radicale add-on by Berichta" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Radicale" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://addons.community" \
    org.label-schema.usage="https://github.com/berichta/hassio-addons/blob/master/radicale/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/berichta/hassio-addons" \
    org.label-schema.vendor="Berichta"