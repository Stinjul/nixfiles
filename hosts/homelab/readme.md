# Setup

sudo mkdir -p /mnt/persist/var/lib/sops-nix/

sudo mkdir -p /mnt/persist/etc/ssh/

sudo ssh-keygen -q -f /mnt/persist/etc/ssh/ssh_host_ed25519_key -N "" -t ed25519

# Install

NIX_CONFIG="experimental-features = flakes" nix-shell -p git
sudo nixos-install --flake .#\<hostname\>
