## What’s changed

This release makes all add-on ports configurable in the Hass.io UI. Configurable ports include:

- HTTP port (80)
- HTTPS port (443)
- Admin endpoint (2019)

This release is marked as breaking change because the Admin endpoint will be disabled by default, as it is not necessary for the Caddyfile based configuration.

In case you are making use of the Admin endpoint (Rest API), ensure you enable this port in the config!

## 🚨 Breaking changes

- Make-add-on-ports-configurable-in-the-Hass.io-UI @einschmidt (#25)

## ✨ New features

- Make-add-on-ports-configurable-in-the-Hass.io-UI @einschmidt (#25)

## ⬆️ Dependency updates

- Bump actionshub/markdownlint from 2.0.0 to 2.0.2 @dependabot (#21)
- Bump actions/cache from v2.1.3 to v2.1.4 @dependabot (#22)
- Bump actions/stale from v3.0.15 to v3.0.16 @dependabot (#23)
- Bump frenck/action-addon-linter from v1.4 to v2 @dependabot (#24)
