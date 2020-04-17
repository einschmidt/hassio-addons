FROM caddy:2.0.0-rc.3-alpine

ENV LANG C.UTF-8

ENV XDG_CONFIG_HOME=/share
ENV XDG_DATA_HOME=/ssl

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
