# git remote user build (grub)

A feature allowing you to run your git builds on a ssh remote

## Example Usage

### Use latest release (default)

```json
"features": {
    "ghcr.io/andrewhughes101/grub-feature/grub:1": {}
}
```

### Specify a specific version

```json
"features": {
    "ghcr.io/andrewhughes101/grub-feature/grub:1": {
        "version": "v0.2.1"
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of grub to install. Use 'latest' for the most recent release, or specify a release tag (e.g., 'v0.2.1') | string | latest |

## How It Works

This feature automatically downloads and installs the specified version of grub from the [official releases](https://github.com/andrewhughes101/grub/releases).

- When `version` is set to `"latest"` (default), it fetches the most recent release
- When a specific version tag is provided (e.g., `"v0.2.1"`), it downloads that exact release
- The grub client is installed to `/usr/local/etc/grub` and symlinked to `/usr/bin/grub_client`

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/andrewhughes101/grub-feature/blob/main/src/grub/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
