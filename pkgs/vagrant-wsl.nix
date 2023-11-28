{ pkgs, symlinkJoin, ... }: symlinkJoin {
  name = "vagrant-wsl";
  paths = [ pkgs.vagrant ];

  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/vagrant --set VAGRANT_WSL_ENABLE_WINDOWS_ACCESS 1 \
    --set PATH "\$PATH:/mnt/c/Windows/SysWOW64/:/mnt/c/Program Files/PowerShell/7/:/mnt/c/Windows/SysWOW64/WindowsPowerShell/v1.0/" \
    --set VAGRANT_DEFAULT_PROVIDER="hyperv"
  '';
}
