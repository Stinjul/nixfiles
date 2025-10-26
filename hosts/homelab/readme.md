# Install

~~set the nixos user password~~

Use one of the installer images which prepares the root ssh key
nix run github:nix-community/nixos-anywhere -- --no-reboot --flake .#(hostname) root@172.16.10.x

# Post-install

sudo mkdir -p /mnt/persist/var/lib/sops-nix/

sudo vim /mnt/persist/var/lib/sops-nix/age-key.txt

sudo mkdir -p /mnt/persist/etc/ssh/

sudo ssh-keygen -q -f /mnt/persist/etc/ssh/ssh_host_ed25519_key -N "" -t ed25519

# Install on machine

NIX_CONFIG="experimental-features = flakes" nix-shell -p git
sudo nixos-install --flake .#\<hostname\>
