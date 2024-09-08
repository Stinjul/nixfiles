{ pkgs, ... }: {
  programs.nixvim = { helpers, ... }: {
    extraPackages = with pkgs; [
      lldb
      delve
    ];

    plugins.dap = {
      enable = true;
      extensions = {
        dap-ui.enable = true;
        dap-go.enable = true;
        dap-python.enable = true;
      };
      adapters.executables = {
        lldb = {
          command = "lldb-dap";
        };
        elixir = {
          command = "elixir-debug-adapter";
        };
      };
      configurations =
        let
          lldbLangs = [ "c" "cpp" ];
        in
        builtins.listToAttrs
          (map
            (lang: {
              name = lang;
              value = [
                {
                  name = "Launch";
                  type = "lldb";
                  request = "launch";
                  cwd = "\${workspaceFolder}";
                  program = helpers.mkRaw ''
                    function()
                      return vim.fn.input('Executable path: ', vim.fn.getcwd() .. '/', 'file')
                    end
                  '';
                }
              ];
            })
            lldbLangs) // {
          elixir = [{
            name = "mix test";
            type = "elixir";
            task = "test";
            taskArgs = [ "--trace" ];
            request = "launch";
            startApps = true; # for Phoenix projects
            projectDir = "\${workspaceFolder}";
            requireFiles = [
              "test/**/test_helper.exs"
              "test/**/*_test.exs"
            ];
          }];
        };

    };
  };
}
