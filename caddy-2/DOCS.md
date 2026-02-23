# Home Assistant App: Caddy 2

Caddy 2 is a modern, powerful, enterprise-grade open-source web server designed for simplicity, security, and flexibility.
It’s unique in its ability to automatically manage HTTPS by default, without any complex configuration.

## Table of Contents

1. [App Installation](#app-installation)
2. [Basic Setup Examples](#basic-setup-examples)
3. [Configuration Options](#configuration-options)
4. [Advanced Usage: Custom Binaries & Plugins](#advanced-usage-custom-binaries--plugins)

## App Installation

To install the Caddy 2 app, first add the repository to your [Hass.io](https://home-assistant.io/hassio/) instance by entering the following URL:

`https://github.com/einschmidt/hassio-addons`

If you encounter any issues, refer to the [official documentation](https://home-assistant.io/hassio/installing_third_party_addons/) for guidance.

Once the repository is added, search for and install the "Caddy 2" app.

## Basic Setup Examples

The Caddy 2 app offers multiple setup methods to accommodate different environments and network configurations. These setups range from simple to more complex, allowing you to choose the level of customization that fits your needs.

### Default Proxy Server Setup (Simple)

By default, Caddy 2 runs as a proxy server for Home Assistant without needing a `Caddyfile`. It uses the configuration provided in the app settings and automatically handles HTTPS for you.

**Note**: If a `Caddyfile` is found in the configuration directory, the `non_caddyfile_config` settings will be ignored in favor of the Caddyfile.

#### Example Configuration

**Important**: _Always restart the app after making changes to the configuration._

For a basic proxy setup, forwarding `yourdomain.com` to Home Assistant, use the following example (without a `Caddyfile`):

```yaml
non_caddyfile_config:
  email: your@email.com
  domain: yourdomain.com
  destination: localhost
  port: 8123
log_level: info
args: []
env_vars: []
```

**Note**: _These examples are for guidance only. Customize them according to your needs._

### Caddyfile Setup (Intermediate)

For more advanced customization, you can create and use a Caddyfile to define your proxy server's configuration. This allows greater control over settings such as routing, headers, and SSL management.

To use a Caddyfile, place the file in the app configuration directory. You can access this directory using either the [SSH][ssh] or [Samba][samba] apps. The app will only search for the Caddyfile in this specific location.

#### App Configuration Directory

The Caddyfile needs to be placed in the app's configuration directory, which can be found at:

```
/addon_configs/c80c7555_caddy-2
```

##### Accessing the Configuration Directory

SSH: You can access the configuration directory via SSH by navigating to `/addon_configs/`.

Samba: Alternatively, with the Samba app, you can access this folder from your network as a shared directory. Look for the `addon_configs` folder and locate the appropriate directory.

#### Managing Certificates

Caddy 2 can automatically generate SSL certificates. If you want to use certificates from other apps (such as the Let’s Encrypt app), they can be placed in the `/ssl` directory. The Caddy 2 app will have access to this folder, allowing you to use external certificates or create certificates for other services.

#### Example Caddyfile

A simple Caddyfile for proxying traffic to a Home Assistant installation might look like this:

```
{
  email your@email.com
}

yourdomain.com {
  reverse_proxy localhost:8123
}
```

For more advanced configurations, refer to the [Caddyfile documentation](https://caddyserver.com/docs/caddyfile).

#### Example Configuration for Caddyfile

**Important**: _Restart the app after changing the configuration._

To instruct the app to use and monitor the `Caddyfile`, your configuration should look like this:

```yaml
non_caddyfile_config: {}
log_level: info
args:
  - "--watch"
env_vars: []
```

**Note**: _Customize this example for your specific setup._

### Custom Caddy Binary Setup (Advanced)

For advanced users, you can replace the default Caddy binary with a custom one. Place your `caddy` binary in the [app configuration directory](#app-configuration-directory), using [SSH][ssh] or [Samba][samba]. The app will use binaries found in this folder.

#### Example Configuration

**Important**: _Restart the app after any configuration changes._

Here’s an example configuration using a custom Caddy binary and a `Caddyfile`, with automatic updates and formatting enabled:

```yaml
non_caddyfile_config: {}
log_level: info
args:
  - "--watch"
env_vars: []
caddy_upgrade: true
caddy_fmt: true
```

**Note**: _These examples are meant for reference. Adjust them to match your setup._

## Configuration Options

### Option: `non_caddyfile_config.email`

Defines the email address used when creating an ACME account with your Certificate Authority (CA). This is recommended to help manage certificates in case of issues.

**Note**: This option is only used for the default reverse proxy setup. It will be ignored once a `Caddyfile` is found in the configuration directory.

### Option: `non_caddyfile_config.domain`

Specifies the domain name for your setup.

**Note**: This option is only applicable to the default reverse proxy setup and will be ignored if a `Caddyfile` is present in the configuration directory.

### Option: `non_caddyfile_config.destination`

Sets the upstream address for the reverse proxy. Typically, `localhost` is sufficient for most setups. To target specific addresses, you can use `127.0.0.1` for IPv4 or `::1` for IPv6.

**Note**: This option is only used for the default reverse proxy setup and is ignored if a `Caddyfile` is found in the configuration directory.

### Option: `non_caddyfile_config.port`

Defines the port for the upstream address. For example, Home Assistant typically uses port `8123`.

**Note**: This setting is only applied in the default reverse proxy configuration. It is ignored if a `Caddyfile` is present in the configuration directory.

### Option: `caddy_upgrade`

Enables automatic upgrades for custom Caddy binaries and their plugins. Set this option to `true` to allow updates, or `false` to disable it. The default is `false`.

**Note**: This feature only applies to custom binaries (Caddy version 2.4 or higher) and is not needed if using the default Caddy binary.

### Option: `caddy_fmt`

Enables automatic formatting and prettifying of the `Caddyfile`. Set this option to `true` to enable formatting or `false` to disable it. By default, it is disabled.

**Note**: This feature requires a valid `Caddyfile` to work.

### Option: `args`

Allows you to specify additional command-line arguments for Caddy 2. Add one or more arguments to the list, and they will be executed each time the app starts.

**Note**: The `--config` argument is automatically added. For more information, refer to the official [Caddy documentation](https://caddyserver.com/docs/command-line#caddy-run).

### Option: `env_vars`

Allows you to define multiple environment variables, usually used for custom Caddy binary builds. These variables can be set in the following format:

Example:

```yaml
env_vars:
  - name: NAMECHEAP_API_USER
    value: xxxx
  - name: NAMECHEAP_API_KEY
    value: xxxx
```

### Option: `env_vars.name`

Specifies the name of the environment variable.

### Option: `env_vars.value`

Specifies the value assigned to the environment variable.

### Option: `log_level`

Controls the verbosity of the log output from the app. This setting is useful for debugging or monitoring the app’s behavior. Available log levels are:

- `trace`: Shows detailed information, including all internal function calls.
- `debug`: Provides extensive debugging information.
- `info`: Shows typical events and information.
- `warning`: Logs unexpected situations that are not errors.
- `error`: Records runtime errors that don’t need immediate action.
- `fatal`: Critical errors that make the app unusable.

Each level includes the messages from more severe levels. For example, `debug` also includes `info` messages. The default setting is `info`, which is recommended unless troubleshooting.

## Advanced Usage: Custom Binaries & Plugins

### Overview

This app uses a single binary file to launch Caddy, which makes it highly customizable. You can run a custom build of Caddy with any version and plugins you need, providing maximum flexibility for advanced users.

### Custom Caddy Binaries

To build your own version of Caddy, including specific plugins or features, you can follow the instructions provided in the official Caddy documentation using the [`xcaddy` tool](https://caddyserver.com/docs/build#xcaddy). This allows you to compile your own version of Caddy with custom modules or plugins that are not included in the default binary.

### Installing a Custom Binary

To use a custom-built Caddy binary, follow these steps:

1. Build your custom Caddy binary using `xcaddy` or obtain a pre-built version that suits your needs.
2. Place the `caddy` binary file into the app configuration folder.
3. Restart the Caddy 2 app to begin using your custom version of Caddy.

#### Accessing the Configuration Folder

The app configuration folder can be found at:

```
/addon_configs/c80c7555_caddy-2
```

This is where you should place your custom `caddy` binary and any related configuration files.

Once the app is restarted, Caddy will use the custom binary you've provided, allowing you to leverage any additional features or plugins included in your custom build.

[ssh]: https://home-assistant.io/addons/ssh/
[samba]: https://home-assistant.io/addons/samba/
