{ inputs, ... }:
{
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs
      (_: flake:
        let
          legacyPackages = ((flake.legacyPackages or { }).${final.system} or { });
          packages = ((flake.packages or { }).${final.system} or { });
        in
        if legacyPackages != { } then legacyPackages else packages
      )
      inputs;
  };
  additions = final: prev: import ../pkgs { pkgs = final; } // {
    vimPlugins = prev.vimPlugins // final.callPackage ../pkgs/vim_plugins { };
  };
  modifications = final: prev: { };
}
