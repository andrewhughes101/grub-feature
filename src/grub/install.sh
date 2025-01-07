#!/bin/sh
set -e

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var

# Git clone from source
mkdir -p /usr/local/etc/grub
git clone https://github.com/andrewhughes101/grub.git /usr/local/etc/grub

ln -s /usr/bin/grub_client /usr/local/etc/grub/bin/grub_client
