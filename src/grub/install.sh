#!/bin/sh
set -e

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var

VERSION="${VERSION:-latest}"

echo "Installing grub version: ${VERSION}"

# If version is "latest", fetch the latest release tag
if [ "$VERSION" = "latest" ]; then
    echo "Fetching latest release..."
    LATEST_RELEASE=$(curl -s https://api.github.com/repos/andrewhughes101/grub/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

    if [ -z "$LATEST_RELEASE" ]; then
        echo "Error: Could not fetch latest release"
        exit 1
    fi

    VERSION="$LATEST_RELEASE"
    echo "Latest release: ${VERSION}"
fi

# Extract version number without 'v' prefix for tarball name
VERSION_NUM=$(echo "$VERSION" | sed 's/^v//')

# Download and extract the release tarball
TARBALL_URL="https://github.com/andrewhughes101/grub/releases/download/${VERSION}/grub-${VERSION_NUM}.tar.gz"
echo "Downloading from: ${TARBALL_URL}"

mkdir -p /tmp/grub-install
cd /tmp/grub-install

if ! curl -fsSL "$TARBALL_URL" -o grub.tar.gz; then
    echo "Error: Failed to download grub ${VERSION}"
    exit 1
fi

# Extract tarball
tar -xzf grub.tar.gz

# Move to installation directory
mkdir -p /usr/local/etc/grub
cp -r grub/* /usr/local/etc/grub/

# Create symlink
ln -sf /usr/local/etc/grub/bin/grub_client /usr/bin/grub_client

# Cleanup
cd /
rm -rf /tmp/grub-install

echo "grub ${VERSION} installed successfully"
