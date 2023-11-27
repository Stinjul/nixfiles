{ pkgs, symlinkJoin, ... }: symlinkJoin {
  name = "vagrant-wsl";
  paths = [ pkgs.vagrant ];

  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/vagrant --set VAGRANT_WSL_ENABLE_WINDOWS_ACCESS 1
  '';
}
