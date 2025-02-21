# Home Assistant Add-on: Authelia

## Description

Authelia is an open-source authentication and authorization server designed to provide secure access control for your services. This add-on allows you to run Authelia within Home Assistant.

## Supported Architectures

This add-on supports the following architectures:

- `amd64`
- `aarch64`

## Installation

1. Navigate to **Settings** > **Add-ons** in Home Assistant.
2. Click **Add-on Store** and search for **Authelia**.
3. If necessary, add the `https://github.com/einschmidt/hassio-addons` repository
4. Install the add-on and configure it using the settings below.
5. Start the add-on and open the logs to check for any issues.

## Configuration

Before launching the add-on for the first time, you **must edit the `domain`** option in the configuration. This is a critical step, as it ensures Authelia is set up with your specific domain for proper functionality.

### Steps for Configuration

1. **Edit the Domain**  
   The `domain` option must be set before the first launch. This option is essential for properly routing requests and configuring session cookies.

   - Example:
     ```yaml
     domain: yourdomain.com
     ```

2. **First Launch**  
   Upon first launch, the add-on will automatically create the `config.yml` file in the `addon_config` folder. This file will be populated with the default settings, including the configured domain and other required settings.

3. **Edit the Generated `config.yml`**  
   After the first launch, you will find the `config.yml` file in the `/addon_config` folder. **You must edit this file to match your personal environment**. Ensure that all necessary settings, such as domain, user authentication paths, and other relevant options, are correctly configured.

4. **Relaunch the Add-on**  
   After making any edits to the `config.yml` file, **you must restart the add-on** for the changes to take effect. This step is crucial to ensure the proper application of the updated configuration.

### Important Notes

- The **`domain`** setting is required for the initial config creation only.
- Any changes to `config.yml` after the initial launch require a **relaunch of the add-on** to apply the new settings.

Please make sure to carefully review and customize the `config.yml` before proceeding to ensure optimal operation.

## More Information

For additional details, visit the official Authelia resources:

- **Website:** [Authelia](https://www.authelia.com//)
- **Documentation:** [Getting Started Guide](https://www.authelia.com/integration/prologue/get-started/)
