Radicale is a small but powerful CalDAV (calendars, to-do lists) and CardDAV (contacts) server.

**Features**
- Shares calendars and contact lists through CalDAV, CardDAV and HTTP.
- Supports events, todos, journal entries and business cards.
- Can limit access by authentication.
- Works with many CalDAV and CardDAV clients.
- Stores all data on the file system in a simple folder structure.
- Is GPLv3-licensed free software.

# About

This unofficial add-on provides an easy way to add [Radicale](https://radicale.org) to [Home Assistant](https://home-assistant.io/hassio/).

# Installation

Add this repository to your [Hass.io](https://home-assistant.io/hassio/) instance:

`https://github.com/berichta/hassio-addons`

If you have trouble you can follow the [official docs](https://home-assistant.io/hassio/installing_third_party_addons/).

Then install the "Radicale" add-on.

# Setup

## Default config

The addon comes with a default config, which runs as the default. In case you don't plan to change the default config, head on to the `Auth` section.

## Manual config

In case you want to run the addon with your own config:

1. Create a `config` file, following the official [documentation](https://radicale.org/3.0.html#documentation/configuration)
2. Using the [SSH](https://home-assistant.io/addons/ssh/) or [Samba](https://home-assistant.io/addons/samba/) add-ons, create the `/share/radicale` folder
3. Place your `config` file at `/share/radicale/config` (no extension)
4. Start the addon

## Auth

The addon, in the default config, requires a `users` file for user authentification and password storage. You must create your own `users` file and place it at `/share/radicale/users`.

The `users` file is a [htpasswd](https://httpd.apache.org/docs/current/programs/htpasswd.html) file using an iterated md5 digest of the password with a salt.
You can create your own entries for example via tools like [here](https://hostingcanada.org/htpasswd-generator/).

# Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
log_level: info
args: []
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

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

### Option: `args`

Allows you to specify additional Radicale command line arguments.
Add one or more arguments to the list, and they will be executed every single time this add-on starts.
