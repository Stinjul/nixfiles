{ pkgs }: {
  mason-nvim-dap-nvim = pkgs.callPackage ./mason-nvim-dap-nvim.nix { };
  obsidian-nvim = pkgs.callPackage ./obsidian-nvim.nix { };
}
