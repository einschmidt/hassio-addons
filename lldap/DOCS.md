# Home Assistant App: LLDAP

LLDAP is a lightweight authentication server that provides a simplified LDAP interface for authentication.

Project: https://github.com/lldap/lldap

## Installation

1. Add this repository to your Home Assistant instance
2. Install the LLDAP app
3. Configure the app (see Configuration section)
4. Start the app

## Configuration

```yaml
log_level: info
domain: example.com
ldap_user_pass: your_secure_password
```

### Option: `log_level`

Set the logging level. Options: `debug`, `info`, `warn`, `error`

### Option: `domain`

The domain name for your LDAP server (e.g., `example.com`)

### Option: `ldap_user_pass`

Password for the LDAP admin user. **Required** - set a strong password.

## Usage

After starting the app:

- Web UI: `http://homeassistant.local:17170`
- LDAP Port: `3890`
- Default admin username: `admin`

## Support

For issues and feature requests, visit: https://github.com/einschmidt/app-lldap
