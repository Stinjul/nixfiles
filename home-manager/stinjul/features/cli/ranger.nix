{ pkgs, config, ... }: {
  home = {
    packages = with pkgs; [
        ranger
    ];
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [ ".local/share/ranger" ];
    };
  };

  xdg.configFile."ranger/rc.conf".text = ''
    default_linemode devicons

    set line_numbers relative
    set vcs_aware true
    
    set preview_images true
    set preview_images_method kitty
    
    set hidden_filter ^\.|\.(?:pyc|pyo|bak|swp)$|^lost\+found$|^__(py)?cache__$|~$
    
    map e edit
  '';

  xdg.configFile."ranger/plugins/ranger_devicons".source = builtins.fetchGit {
    url = "https://github.com/alexanderjeurissen/ranger_devicons";
    rev = "de64ab26fb581c00a803381d522c6b3e48b79415";
  };
}
