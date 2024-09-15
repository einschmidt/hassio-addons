⚠️ This release includes a breaking change in configuration management—please read the following instructions carefully to ensure a smooth transition. ⚠️ 

## What’s changed

### Overview

In this release, the configuration management for the Caddy 2 add-on has been updated. The primary change involves moving from the previous access-based configuration method to a new approach using the add-on configuration folder. This adjustment aims to streamline configuration handling and improve consistency across setups.

### What’s New

- **Configuration Management**: The add-on now exclusively uses the `/addon_configs/c80c7555_caddy-2` directory for configuration files. This includes:
  - **`Caddyfile`**: Any custom configuration settings previously placed in other directories should now be moved to this folder.
  - **Custom Caddy Binaries**: If you are using a custom build of Caddy, place the `caddy` binary file into this directory.

### What You Need to Do

To ensure a smooth transition and continued operation of your Caddy 2 setup, please follow these steps:

1. **Stop the Current Add-On**: Before making any changes, stop the currently running Caddy 2 add-on to prevent any potential issues during the transition.

2. **Update the Add-On**: Ensure you are using the latest version of the Caddy 2 add-on. This update includes the changes to the configuration management.

3. **Move `Caddyfile`**: If you have a `Caddyfile` for custom configurations, transfer it to the new add-on configuration folder:
   ```
   /addon_configs/c80c7555_caddy-2
   ```

4. **Move Custom Caddy Binaries**: If you are using a custom Caddy binary, place the `caddy` binary file into the same folder.

5. **Restart the Add-On**: Start the updated Caddy 2 add-on. It will now utilize the files located in the configuration directory.

By following these steps, you will ensure that the transition to the new configuration management approach is completed smoothly, with your Caddy 2 setup functioning as expected.

### Why This Change?

- **Simplified Configuration Management**: Consolidating configuration files and custom binaries into a single directory makes management easier and avoids confusion with file paths.
- **Increased Security**: By using the add-on configuration folder, the add-on no longer requires access to the Home Assistant configuration folder. This restriction on access rights enhances security by reducing potential exposure of sensitive Home Assistant files.

### Need Help?

If you encounter any issues or have questions about this change, please refer to the updated documentation.

## 🚨 Breaking changes

- Refactor Configuration Management: Switch from Access-Based to Add-On Configuration for Caddy 2 @einschmidt (#229)

## ⬆️ Dependency updates

- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v16.0.1 @renovate (#218)
- ⬆️ Update alpine_3_20/nss-tools to v3.101-r0 @renovate (#219)
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v16.1.0 @renovate (#220)
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v16.1.1 @renovate (#221)
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v16.1.2 @renovate (#222)
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v16.1.3 @renovate (#223)
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v16.2.0 @renovate (#224)
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v16.2.1 @renovate (#225)
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v16.3.0 @renovate (#226)
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v16.3.1 @renovate (#227)
