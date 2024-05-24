{ inputs, ... }: {
  imports =
    [
      inputs.impermanence.nixosModules.home-manager.impermanence
    ];

  home.persistence."/persist/home/stinjul" = {
    directories = [
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Games"
      "Git"
      ".local/share/nix"
    ];
    allowOther = true;
  };
}
