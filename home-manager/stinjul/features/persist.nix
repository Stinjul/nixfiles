{ inputs, ... }: {
  home.persistence."/persist" = {
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
  };
}
