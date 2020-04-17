#!/bin/sh

caddy run --config /share/caddyv2/Caddyfile --adapter caddyfile --environ --watch
