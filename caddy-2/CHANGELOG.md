## What’s changed

🥳 v1.0.0 is here, holding plenty of new stuff!

The port config has been removed, as it caused rather confusion instead of being helpful. In case you want to change ports, please do so properly via the Caddy config!

This update brings write rights to the share folder, allowing you to store log files, or use the new features.

Speaking of new features, this version holds the latest Caddy version v2.4.0, which itself brings new function, usable via this addon:

`caddy_upgrade`, when enabled, will upgrade your custom caddy binary and all included plugins, as long as the binary is in a writable location. Please note that in order to use this function, you will need an initial binary of version v2.4.0 at least!

`caddy_fmt` can prettify your Caddyfile during startup. 

Both options are optional.

Last but not least, thanks to @mdegat01 for finding a bug and the contribution!

## 🚨 Breaking changes

- Remove port config @einschmidt (#41)

## ✨ New features

- Upgrade caddy at startup @einschmidt (#44)
- Prettify Caddyfile function @einschmidt (#46)

## 🐛 Bug fixes

- Use `args` as an array not as a string @mdegat01 (#54)
- Fix Shellcheck Error @einschmidt (#56)

## 🚀 Enhancements

- Add write rights to the share folder @einschmidt (#43)

## 🧰 Maintenance

- Add-debug-information @einschmidt (#27)
- Update-Caddy-version-to-2.4.0-beta.1 @einschmidt (#28)
- Remove port config @einschmidt (#41)
- Move-custom-caddy-checks @einschmidt (#42)
- Rewrite Caddyfile check @einschmidt (#45)
- Fix caddy.sh @einschmidt (#49)
- Add pr-label action @einschmidt (#53)
- Add new line character to new workflow file @einschmidt (#57)
- Prettify function @einschmidt (#58)

## 📚 Documentation

- Update DOCS.md @einschmidt (#50)
- Fix markdown errors @einschmidt (#55)

## ⬆️ Dependency updates

- Bump release-drafter/release-drafter from v5.13.0 to v5.14.0 @dependabot (#26)
- Update-base-image-version @einschmidt (#29)
- Bump actions/stale from v3.0.16 to v3.0.17 @dependabot (#31)
- Bump docker/build-push-action from v2.2.2 to v2.3.0 @dependabot (#30)
- Bump actions/stale from v3.0.17 to v3.0.18 @dependabot (#32)
- Bump base image version to 9.1.5 @einschmidt (#33)
- Bump release-drafter/release-drafter from v5.14.0 to v5.15.0 @dependabot (#35)
- Bump ludeeus/action-shellcheck from 1.0.0 to 1.1.0 @dependabot (#36)
- Bump docker/build-push-action from v2.3.0 to v2.4.0 @dependabot (#37)
- Bump docker/setup-qemu-action from v1.0.1 to v1.0.2 @dependabot (#38)
- Bump docker/setup-buildx-action from v1.1.1 to v1.1.2 @dependabot (#39)
- Bump base image version to 9.1.6 @einschmidt (#40)
- Bump actions/cache from v2.1.4 to v2.1.5 @dependabot (#51)
- Bump brpaz/hadolint-action from v1.3.1 to v1.4.0 @dependabot (#52)
- Bump docker/setup-buildx-action from v1.1.2 to v1.2.0 @dependabot (#59)
- Bump docker/setup-qemu-action from v1.0.2 to v1.1.0 @dependabot (#60)
- Bump docker/login-action from v1.8.0 to v1.9.0 @dependabot (#61)
- Bump docker/setup-buildx-action from v1.2.0 to v1.3.0 @dependabot (#62)
- Bump brpaz/hadolint-action from v1.4.0 to v1.5.0 @dependabot (#63)
- Bump base image to v9.2.0 @einschmidt (#64)
- Update Caddy to v2.4.0 @einschmidt (#65)
