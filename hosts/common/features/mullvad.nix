{pkgs, ...}: {
  services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
  };
  environment.persistence = {
    "/persist".directories = ["/etc/mullvad-vpn"];
  };
}
