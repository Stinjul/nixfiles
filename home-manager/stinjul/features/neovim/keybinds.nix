{
  programs.nixvim = {
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>a";
        action = "<cmd>TSJToggle<CR>";
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];
  };
}
