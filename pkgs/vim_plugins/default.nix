{ pkgs }:
{
  mason-nvim-dap-nvim = pkgs.callPackage ./mason-nvim-dap-nvim.nix { };
  obsidian-nvim = pkgs.callPackage ./obsidian-nvim.nix { };
  kcl-nvim = pkgs.callPackage ./kcl-nvim.nix { };
  vim-alloy = pkgs.callPackage ./vim-alloy.nix { };
}
