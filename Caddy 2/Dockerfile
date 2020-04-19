FROM caddy:2.0.0-rc.3-alpine

ENV LANG C.UTF-8

ENV XDG_CONFIG_HOME=/data
ENV XDG_DATA_HOME=/ssl

RUN apk add --no-cache bash jq coreutils

COPY Caddyfile /etc/caddy/

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
