{
  virtualisation.libvirtd = {
    enable = true;
  };
  environment.persistence = {
    "/persist".directories = ["/var/lib/libvirt"];
  };
}
