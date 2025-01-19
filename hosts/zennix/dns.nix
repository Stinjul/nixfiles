{
  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true;
    settings = {
      # address = [
      #   "/stinjul.com/192.168.1.59"
      # ];
      server = [
        "/mgmt.stinjul.com/172.16.200.1"
        "/kube.k3s-mgmt.stinjul.com/172.16.200.1"
      ];
    };
  };
}
