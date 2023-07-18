#!/bin/bash
set -euo pipefail

sudo apt-get install -y \
	build-essential \
	git \
	curl \
	unzip \
	bash-completion

# Default folders for my station.
mkdir -p ~/repos ~/downloads

# Install just.
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/downloads
sudo mv ~/downloads/just /usr/local/bin/just
just --completions bash >just
sudo mv just /usr/share/bash-completion/completions

# Enables global script usage through just.
export SCRIPTS_DIR=~/repos/jonasue20/scripts
mkdir -p "$SCRIPTS_DIR"
git -C "$SCRIPTS_DIR" pull || git clone https://github.com/jonasue20/scripts.git "$SCRIPTS_DIR"

ln -sf $SCRIPTS_DIR/debian/justfile ~/justfile
ln -sf $SCRIPTS_DIR/debian/.bash_aliases ~/.bash_aliases

echo "Setup complete!"
