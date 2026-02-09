# GRUB Devcontainer Feature

A devcontainer feature for installing [grub](https://github.com/andrewhughes101/grub) - a tool for running git builds on SSH remotes.

## Usage

Add this feature to your `.devcontainer/devcontainer.json`:

### Use Latest Release (Recommended)

```json
{
  "features": {
    "ghcr.io/andrewhughes101/grub-feature/grub:1": {}
  }
}
```

### Pin to Specific Version

```json
{
  "features": {
    "ghcr.io/andrewhughes101/grub-feature/grub:1": {
      "version": "v0.2.1"
    }
  }
}
```

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `version` | string | `"latest"` | Version of grub to install. Use `"latest"` for the most recent release, or specify a release tag (e.g., `"v0.2.1"`) |

## How It Works

This feature:
1. Fetches the specified version from [grub releases](https://github.com/andrewhughes101/grub/releases)
2. Downloads the release tarball
3. Extracts and installs to `/usr/local/etc/grub`
4. Creates a symlink at `/usr/bin/grub_client` for easy access

## Available Versions

Check the [grub releases page](https://github.com/andrewhughes101/grub/releases) for all available versions.

## About grub

grub (git remote user build) allows you to run your git builds on a SSH remote, enabling efficient remote development workflows.

For more information, see the [grub repository](https://github.com/andrewhughes101/grub).
