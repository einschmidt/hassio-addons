#!/bin/sh

caddy run --config /share/caddy/Caddyfile --adapter caddyfile --environ --watch
