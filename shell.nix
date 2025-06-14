{ pkgs, ... }:
{
  jekyll = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      jekyll
      bundler
    ];
  };

  quickshell = pkgs.mkShell {
    nativeBuildInputs = [
      pkgs.inputs.quickshell.quickshell
    ];
    shellHook = ''
      export QMLLS_BUILD_DIRS="${pkgs.inputs.quickshell.quickshell}/lib:${pkgs.qt6.qtdeclarative}/lib/qt-6/qml:$QML2_IMPORT_PATH"
    '';
  };
}
