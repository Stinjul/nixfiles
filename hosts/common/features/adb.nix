{pkgs, ...}: {
  programs.adb.enable = true;
  # environment.persistence = {
  #   "/persist".directories = ["/etc/mullvad-vpn"];
  # };
}
