# About

This unofficial add-on gives an easy way to add [Caddy 2](https://caddyserver.com/) to your [Hass.io](https://home-assistant.io/hassio/) device.
This add-on integrates the official Caddy 2 docker image. Currently, no configuration is necessary. 

# Installation

See the actual [repository](https://github.com/korylprince/hassio-caddy/) for installation instructions.

# Configuration

Using the [SSH](https://home-assistant.io/addons/ssh/) or [Samba](https://home-assistant.io/addons/samba/) add-ons, create the `/share/caddy` folder. Place a Caddyfile at `/share/caddy/Caddyfile`. There's also access to the `/ssl` folder if you want to use certificates from another add-on, or use this add-on to create certificates for other add-ons. Finally, this add-on uses Host networking so you can listen on any ports you need.

Caddy watches the Caddyfile for any changes and adapts automatically upon save. Thus, there is no need to restart the add-on after changing the Caddyfile.
