{
  monitors = import ../shared/monitors.nix;
  thunderboltFabric = import ./thunderbolt-network.nix;
  k3s = import ./k3s.nix;
}
