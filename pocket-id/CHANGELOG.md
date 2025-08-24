## What’s changed

From the pocket-id release notes:

> [!WARNING]
A bug was introduced in pocket-id v1.8.0 that caused the deletion of all allowed user groups on OIDC clients. The v1.8.0 images have been removed from the registry. If you have used v1.8.0 and are using Sqlite, it is highly recommended to check if the allowed user groups are still in place. If they are not, unfortunately, the deleted relations cannot be restored automatically. You will need to either restore them from a backup or recreate them manually. You can learn more about the cause in this [comment](https://redirect.github.com/pocket-id/pocket-id/issues/865#issuecomment-3218287796).

## ⬆️ Dependency updates

- ⬆️ Update pocket-id/pocket-id to v1.9.0 @[renovate[bot]](https://github.com/apps/renovate) (#59)
- ⬆️: migrate renovate config @[renovate[bot]](https://github.com/apps/renovate) (#60)
