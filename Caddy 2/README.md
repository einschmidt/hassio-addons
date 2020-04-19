<p align="center">
	<a href="https://caddyserver.com"><img src="https://user-images.githubusercontent.com/1128849/36338535-05fb646a-136f-11e8-987b-e6901e717d5a.png" alt="Caddy" width="450"></a></br>
	Caddy 2 is a powerful, enterprise-ready, open source web server with automatic HTTPS written in Go
</p>

Caddy simplifies your infrastructure. It takes care of TLS certificate renewals, OCSP stapling, static file serving, reverse proxying, Kubernetes ingress, and more.

# About

This unofficial add-on provides an easy way to add [Caddy 2](https://caddyserver.com/) to [Home Assistant](https://home-assistant.io/hassio/).

# Installation

Add this repository to your [Hass.io](https://home-assistant.io/hassio/) instance:

`https://github.com/berichta/hassio-addons`

If you have trouble you can follow the [official docs](https://home-assistant.io/hassio/installing_third_party_addons/).

Then install the "Caddy 2" add-on.

# Caddyfile setup

Using the [SSH](https://home-assistant.io/addons/ssh/) or [Samba](https://home-assistant.io/addons/samba/) add-ons, create the `/share/caddy` folder. Place a Caddyfile at `/share/caddy/Caddyfile`. There's also access to the `/ssl` folder if you want to use certificates from another add-on, or use this add-on to create certificates for other add-ons. Finally, this add-on uses Host networking so you can listen on any ports you need.

# Caddyfile example

A very simple Caddyfile for serving a default Home Assistant installation could look like this. Further information can be found [here](https://caddyserver.com/docs/caddyfile).
```
{
	email your@email.com
}

yourdomain.com {
	reverse_proxy localhost:8123
}
```

# Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

The configuration allows to define all `caddy run` command line arguments individually. The `--config` argument is set automatically. Further information can be found in the offical ![documentation](https://caddyserver.com/docs/command-line#caddy-run).

Example add-on configuration:

```yaml
args:
  - '--watch'
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_
