# Pocket ID App

## Overview

[Pocket ID](https://pocket-id.org/) is a simple and easy-to-use **OIDC (OpenID Connect) provider** that enables authentication using passkeys. It allows seamless and secure user authentication for your services without relying on traditional passwords.

This app runs as a Home Assistant app, providing an **identity provider** within your network.

## Supported Architectures

This app supports the following architectures:

- `amd64`
- `aarch64`

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
APP_URL: https://id.domain.com
TRUST_PROXY: true
```

Or, to trust only specific reverse proxies:

```yaml
APP_URL: https://id.domain.com
TRUST_PROXY: false
TRUST_PROXY_LIST: 10.0.0.10,10.0.1.0/24,fd00::/8
```

### Option: `APP_URL`

The `APP_URL` option sets the public-facing URL of the Pocket ID instance. This must be HTTPS and accessible by clients for authentication to work properly.

### Option: `TRUST_PROXY`

Controls whether Pocket ID trusts all reverse proxies.

- `false` (default): Do not trust any proxy headers.
- `true`: Trust proxy headers from all proxies. Use this only if Pocket ID is only accessible through a trusted reverse proxy.

### Option: `TRUST_PROXY_LIST`

Specify a comma-separated list of trusted proxy IP addresses or CIDR ranges, for example:

```text
10.0.0.10,10.0.1.0/24,fd00::/8
```

When configured, this option takes precedence over `TRUST_PROXY` and is the recommended way to configure reverse proxies, as it limits trust to known proxy addresses.

### Option: `MAXMIND_LICENSE_KEY`

Optional license key for MaxMind GeoIP database integration. If provided, it enables geolocation-based features.

## How to Use

1. **Install the app** in Home Assistant.
2. **Configure** the options as needed via the app settings.
3. **Start the app** to launch Pocket ID.
4. **Use the configured `APP_URL`** to integrate with your OIDC-compatible applications.

## Troubleshooting

- Ensure that `APP_URL` is correctly set and accessible.
- If Pocket ID is behind a reverse proxy, either:
  - set `TRUST_PROXY` to `true` to trust all proxies, or
  - configure `TRUST_PROXY_LIST` with the IP addresses or CIDR ranges of your trusted reverse proxies (recommended).
- If geolocation features are required, obtain and configure a MaxMind license key.

## More Information

For additional details, visit the official Pocket ID resources:

- **Website:** https://pocket-id.org/
- **Documentation:** https://pocket-id.org/docs/introduction/
