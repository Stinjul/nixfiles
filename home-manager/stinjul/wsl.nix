{ inputs, outputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/neovim

    ./features/desktop/common
    ./features/desktop/common/wayland
  ];

  home.packages = [
  ];

  programs.neovim = {
    extraLuaConfig = ''
      vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ["+"] = {'clip.exe'},
            ["*"] = {'clip.exe'},
        },
        paste = {
            ["+"] = {'pwershell.exe' , '-c', '[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'},
            ["*"] = {'pwershell.exe' , '-c', '[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'},
        },
        cache_enabled = false,
      }
    '';
  };
}
