{ inputs, ... }: {
  home.persistence."/persist/home/stinjul" = {
    directories = [
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Games"
      "Git"
      ".local/share/nix"
      "Mount"
      ".local/state/wireplumber"
    ];
    allowOther = true;
  };
}
