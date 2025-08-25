age-keygen -o pi00-key.txt
for file in (grep -lr "sops:" --include \*.yaml --include \*.yml ./); sops updatekeys -y $file; end
nix build .#nixosConfigurations.prd-pi-00.config.system.build.diskoImagesScript
sudo ./result --build-memory 4096 --post-format-files /home/stinjul/Git/nixfiles/pi00-key.txt persist/var/lib/sops-nix/age-key.txt
sudo dd if=sata.raw of=/dev/sdb status=progress bs=16M
