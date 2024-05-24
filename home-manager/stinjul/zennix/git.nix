{
  programs.git = {
    enable = true;
    includes = [
      {
        contents = {
          user = {
            email = "3649882+Stinjul@users.noreply.github.com";
            name = "Stinjul";
          };
        };
        condition = "hasconfig:remote.*.url:ssh://git@github.com:*/**";
      }
      {
        contents = {
          user = {
            email = "4914129-Stinjul@users.noreply.gitlab.com";
            name = "Stinjul";
          };
        };
        condition = "hasconfig:remote.*.url:ssh://git@gitlab.com:*/**";
      }
    ];
  };
}
