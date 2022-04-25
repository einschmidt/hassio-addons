# Home Assistant Add-on: Caddy 2

Caddy 2 is a powerful, enterprise-ready, open source web server with automatic HTTPS

## Installation

Add this repository to your [Hass.io](https://home-assistant.io/hassio/) instance:

`https://github.com/einschmidt/hassio-addons`

If you have trouble you can follow the [official docs](https://home-assistant.io/hassio/installing_third_party_addons/).

Then install the "Caddy 2" add-on.

## Default Proxy Server setup

While Caddy 2 isn't provided with a Caddyfile, the addon will run as a proxy
server for Home Assistant, using provided information from the add-on config,
including automatic HTTPS.

**Note**: As soon as Caddy 2 finds a `Caddyfile`, the `non_caddyfile_config`
settings will be ignored in favour of the Caddyfile.

## Caddyfile setup

Using the [SSH][ssh] or [Samba][samba] add-ons, create the `/share/caddy`
folder and place a Caddyfile at `/share/caddy/Caddyfile` (no extension),
or specify the location of your Caddyfile using `config_path`. There's
also access to the `/ssl` folder if you want to use certificates from
another add-on, or use this add-on to create certificates for other
add-ons. Finally, this add-on uses Host networking so you can listen
on any ports you need.

## Caddyfile example

A very simple Caddyfile for serving a default Home Assistant installation
could look like this.
Further information can be found [here](https://caddyserver.com/docs/caddyfile).

```
{
  email your@email.com
}

yourdomain.com {
  reverse_proxy localhost:8123
}
```

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example configuration for proxy forwarding yourdomain.com to Home Assistant
without Caddyfile:

```yaml
non_caddyfile_config:
  email: your@email.com
  domain: yourdomain.com
  destination: localhost
  port: 8123
args: []
env_vars: []
log_level: info
```

Example configuration using and watching a Caddyfile located at a custom path:

```yaml
config_path: /config/caddy/Caddyfile
non_caddyfile_config: {}
args:
  - "--watch"
env_vars: []
log_level: info
```

**Note**: _These are just examples, don't copy and paste them! Create your own!_

### Option: `non_caddyfile_config.email`

Email is your email address. Mainly used when creating an ACME account with your
CA, and is highly recommended in case there are problems with your certificates.

**Note**: This option will be used only for the default reverse proxy config,
which applies when Caddy doesn't find any `Caddyfile` at `config_path`.

### Option: `non_caddyfile_config.domain`

Your domain address.

**Note**: This option will be used only for the default reverse proxy config,
which applies when Caddy doesn't find any `Caddyfile` at `config_path`.

### Option: `non_caddyfile_config.destination`

Defines the upstream address for the reverse proxy.
For most cases, `localhost` should be fine.

**Note**: This option will be used only for the default reverse proxy config,
which applies when Caddy doesn't find any `Caddyfile` at `config_path`.

### Option: `non_caddyfile_config.port`

Defines the port of the upstream address.

**Note**: This option will be used only for the default reverse proxy config,
which applies when Caddy doesn't find any `Caddyfile` at `config_path`.

### Option: `config_path`

Allows you to specify the path to your Caddyfile.
Defaults to `/share/caddy/Caddyfile` if not specified.

### Option: `custom_binary_path`

Allows you to specify the path to a custom `caddy` binary.
Defaults to `/share/caddy/caddy` if not specified.

### Option: `caddy_upgrade`

Automatically upgrades a custom caddy binary and its plugins to the latest version,
if necessary. Set it to `true` to enable it, `false` otherwise.
Disabled by default.

**Note**: The upgrade function applies to custom binaries only. Requires a
custom Caddy binary of version 2.4 or higher.

### Option: `caddy_fmt`

Enables/Disables the function to format or prettify a Caddyfile. Set it to
`true` to enable it, `false` otherwise.
Disabled by default.

**Note**: The format function requires a Caddyfile in a writable folder. In case
the file is not writable, the result is printed to the log.

### Option: `args`

Allows you to specify additional Caddy 2 command line arguments.
Add one or more arguments to the list, and they will be executed
every single time this add-on starts.

**Note**: The `--config` argument is set automatically.
Further information can be found in the offical [documentation](https://caddyserver.com/docs/command-line#caddy-run).

### Option: `env_vars`

Allows you to specify multiple environment variables.
Usually used for custom binary builds.

env_vars example:

```
...
env_vars:
  - name: NAMECHEAP_API_USER
    value: xxxx
  - name: NAMECHEAP_API_KEY
    value: xxx
...
```

### Option: `env_vars.name`

Defines the name of an environment variable.

### Option: `env_vars.value`

Defines the value of an environment variable.

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

## Updates/Plugins

### Explanation

This add-on uses single binary files for launching Caddy,
which makes it easy to run a custom Caddy build with whatever
version and plugins you want.

### Custom Caddy binaries

You can build your own version of Caddy like described [here](https://caddyserver.com/docs/build#xcaddy).

### Install custom binary

To use a custom binary, place the `caddy` file at `/share/caddy/caddy` or
point to it with `custom_binary_path`. Restart the add-on to start using
the custom version.

[ssh]: https://home-assistant.io/addons/ssh/
[samba]: https://home-assistant.io/addons/samba/
