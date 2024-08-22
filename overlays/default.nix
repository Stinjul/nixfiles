{ inputs, ... }:
{
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (
      _: flake:
      let
        legacyPackages = ((flake.legacyPackages or { }).${final.system} or { });
        packages = ((flake.packages or { }).${final.system} or { });
      in
      if legacyPackages != { } then legacyPackages else packages
    ) inputs;
  };
  additions =
    final: prev:
    import ../pkgs { pkgs = final; }
    // {
      vimPlugins = (prev.vimPlugins or { }).extend (_: _: import ../pkgs/vim_plugins { pkgs = final; });
    };
  modifications = final: prev: { };
  # Flakes with overlays
  neorg = inputs.neorg.overlays.default;
}
