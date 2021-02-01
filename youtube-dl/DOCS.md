# youtube-dl

youtube-dl is a command-line program to download videos from YouTube.com
and a few [more sites][supported-sites].

## Installation

Add this repository to your [Hass.io](https://home-assistant.io/hassio/) instance:

`https://github.com/einschmidt/hassio-addons`

If you have trouble you can follow the [official docs](https://home-assistant.io/hassio/installing_third_party_addons/).

Then install the "youtube-dl" add-on.

## Default output location

By default, this add-on uses an output option which will store download files
under `/share/youtube-dl/`. The output folder will be created automatically.
However, this option can be overwritten via `options` and setting the '-o'
option.
See [OUTPUT TEMPLATE][output-template]
for further information.

## Default Stop

The add-on will stop itself after successful download or in case
an error occured. This is intended behavior.

## Configuration

Example add-on configuration:

```yaml
options:
  - "--include-ads"
url: https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8
log_level: info
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `options`

Allows you to specify additional youtube-dl options.
Add one or more options to the list, and they will be executed
with the start of this add-on.

**Note**: The output option `-o` is preconfigured but can be
overwritten here as well!

### Option: `URL`

The URL of the video file.

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

[supported-sites]: http://ytdl-org.github.io/youtube-dl/supportedsites.html
[addon-docs]: https://home-assistant.io/hassio/installing_third_party_addons/
[output-template]: https://github.com/ytdl-org/youtube-dl/blob/master/README.md#output-template
