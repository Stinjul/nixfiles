{ pkgs, ... }: {
  jekyll = pkgs.mkShell
    {
      nativeBuildInputs = with pkgs; [
        jekyll
        bundler
      ];
    };
}
