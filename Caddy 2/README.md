<p align="center">
	<a href="https://caddyserver.com"><img src="https://user-images.githubusercontent.com/1128849/36338535-05fb646a-136f-11e8-987b-e6901e717d5a.png" alt="Caddy" width="450"></a></br>
	Caddy 2 is a powerful, enterprise-ready, open source web server with automatic HTTPS written in Go
</p>

Caddy simplifies your infrastructure. It takes care of TLS certificate renewals, OCSP stapling, static file serving, reverse proxying, Kubernetes ingress, and more.

**Features**
- **Easy configuration** with the [Caddyfile](https://caddyserver.com/docs/caddyfile)
- **Powerful configuration** with its [native JSON config](https://caddyserver.com/docs/json/)
- **Dynamic configuration** with the [JSON API](https://caddyserver.com/api)
- [**Config adapters**](https://caddyserver.com/docs/config-adapters) if you don't like JSON
- **Automatic HTTPS** by default
	- [Let's Encrypt](https://letsencrypt.org) for public sites
	- Fully-managed local CA for internal names & IPs
	- Can coordinate with other Caddy instances in a cluster

# About

This unofficial add-on provides an easy way to add [Caddy 2](https://caddyserver.com/) to [Home Assistant](https://home-assistant.io/hassio/).

# Installation

Add this repository to your [Hass.io](https://home-assistant.io/hassio/) instance:

`https://github.com/berichta/hassio-addons`

If you have trouble you can follow the [official docs](https://home-assistant.io/hassio/installing_third_party_addons/).

Then install the "Caddy 2" add-on.

# Default Proxy Server setup

While Caddy 2 doesn't find any `Caddyfile` under `/share/caddy`, the addon will run as a proxy server for Home Assistant, using provided information from the add-on config, including automatic HTTPS.

**Note**: As soon as Caddy 2 finds a `Caddyfile`, the `non_caddyfile_config` settings will be ignored in favour of the Caddyfile.

# Caddyfile setup

Using the [SSH](https://home-assistant.io/addons/ssh/) or [Samba](https://home-assistant.io/addons/samba/) add-ons, create the `/share/caddy` folder. Place a Caddyfile at `/share/caddy/Caddyfile` (no extension). There's also access to the `/ssl` folder if you want to use certificates from another add-on, or use this add-on to create certificates for other add-ons. Finally, this add-on uses Host networking so you can listen on any ports you need.

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

Example add-on configuration:

```yaml
non_caddyfile_config:
  email: your@email.com
  domain: yourdomain.com
  destination: localhost
  port: 8123
args:
  - '--watch'
log_level: info
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `non_caddyfile_config.email`

Email is your email address. Mainly used when creating an ACME account with your CA, and is highly recommended in case there are problems with your certificates.

**Note**: This option will be used only for the default reverse proxy config, which applies when Caddy doesn't find any `Caddyfile` under `/share/caddy`.

### Option: `non_caddyfile_config.domain`

Your domain address.

**Note**: This option will be used only for the default reverse proxy config, which applies when Caddy doesn't find any `Caddyfile` under `/share/caddy`.

### Option: `non_caddyfile_config.destination`

Defines the upstream address for the reverse proxy. For most cases, `localhost` should be fine.

**Note**: This option will be used only for the default reverse proxy config, which applies when Caddy doesn't find any `Caddyfile` under `/share/caddy`.

### Option: `non_caddyfile_config.port`

Defines the port of the upstream address.

**Note**: This option will be used only for the default reverse proxy config, which applies when Caddy doesn't find any `Caddyfile` under `/share/caddy`.

### Option: `args`

Allows you to specify additional Caddy 2 command line arguments.
Add one or more arguments to the list, and they will be executed every single time this add-on starts.

**Note**: The `--config` argument is set automatically. Further information can be found in the offical [documentation](https://caddyserver.com/docs/command-line#caddy-run).

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.
