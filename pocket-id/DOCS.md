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

### Option: `APP_URL`

The `APP_URL` option sets the public-facing URL of the Pocket ID instance. This must be HTTPS and accessible by clients for authentication to work properly.

### Option: `TRUST_PROXY`

If set to `true`, Pocket ID will trust proxy headers like `X-Forwarded-For`. This is useful when running behind a reverse proxy.

### Option: `MAXMIND_LICENSE_KEY`

Optional license key for MaxMind GeoIP database integration. If provided, it enables geolocation-based features.

## How to Use

1. **Install the app** in Home Assistant.
2. **Configure** the options as needed via the app settings.
3. **Start the app** to launch Pocket ID.
4. **Use the configured `APP_URL`** to integrate with your OIDC-compatible applications.

## Troubleshooting

- Ensure that `APP_URL` is correctly set and accessible.
- If using a reverse proxy, set `TRUST_PROXY` to `true` to avoid authentication issues.
- If geolocation features are required, obtain and configure a MaxMind license key.

## More Information

For additional details, visit the official Pocket ID resources:

- **Website:** [Pocket ID](https://pocket-id.org/)
- **Documentation:** [Getting Started Guide](https://pocket-id.org/docs/introduction/)
