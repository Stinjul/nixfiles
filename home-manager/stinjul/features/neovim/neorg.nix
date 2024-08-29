{
  # TODO: wait for https://github.com/NixOS/nixpkgs/pull/302442
  programs.nixvim.plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = {
        __empty = null;
      };
      "core.dirman" = {
        config = {
          workspaces = {
            personal = "~/Documents/Notes";
            work = "~/Work/Documents/Notes";
          };
        };
      };
      "core.completion" = {
        config = {
          engine = "nvim-cmp";
        };
      };
      "core.concealer" = {
        config = {
          folds = true;
        };
      };
      "core.esupports.metagen" = {
        config = {
          type = "auto";
        };
      };
    };
  };
}
