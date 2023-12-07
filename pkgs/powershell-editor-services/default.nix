{ lib, buildDotnetModule, dotnetCorePackages, fetchFromGitHub }:
# UNFINISHED, NEED TO FIGURE OUT THE POWERSHELL PART OF THIS THING
buildDotnetModule rec {
  pname = "powershell-editor-services";
  version = "3.14.0";

  src = fetchFromGitHub {
    owner = "PowerShell";
    repo = "PowerShellEditorServices";
    rev = "v${version}";
    hash = "sha256-Ck1ZJ9MYMsR431hw4umOWr3oUigopbDkOJhRMntDW0s=";
  };

  postPatch = ''
    substituteInPlace src/PowerShellEditorServices/PowerShellEditorServices.csproj \
    --replace TargetFrameworks TargetFramework \
    # --replace "netstandard2.0" net7.0
  '';

  buildType = "Release";
  projectFile = "src/PowerShellEditorServices/PowerShellEditorServices.csproj";
  dotnet-sdk = dotnetCorePackages.sdk_7_0;
  dotnet-runtime = dotnetCorePackages.aspnetcore_7_0;
  # executables = [ "PowerShellEditorServices" ];

  nugetDeps = ./deps.nix;

  meta = with lib; {
    description = "A common platform for PowerShell development support in any editor or application!";
    homepage = "https://github.com/PowerShell/PowerShellEditorServices";
    license = licenses.mit;
  };
}
