{ lib, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "[](fg:black)"
        "$os"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "[ ](fg:black)"
      ];
      right_format = lib.concatStrings [
        "[](fg:black)[ ](bg:black)"
        "$character$status"
        "$cmd_duration"
        "$username"
        "$hostname"
        "$jobs"
        #"$direnv"
        #"$nodejs"
        #"$python"
        #"$rust"
        #"$java"
        #"$php"
        ##"$pulumi"
        #"$ruby"
        #"$golang"
        #"$kubernetes"
        #"$terraform"
        #"$nix_shell" does not work with nix shell :(
        "$shlvl"
        #"$elixir"
        "$time"
        "[](fg:black)"
      ];
      os = {
        disabled = false;
        format = lib.concatStrings [
          "[$symbol ]($style)"
        ];
        style = "bg:black fg:bright-white";
        symbols = {
            NixOS = " ";
        };
      };
      directory = {
        style = "bold bg:black fg:cyan";
        read_only_style = "bg:black fg:red";
        before_repo_root_style = "bg:black fg:cyan";
        repo_root_style = "bold bg:black fg:bright-green";
        read_only = " ";
        format = lib.concatStrings [
          "[ ](bg:black fg:bright-black)"
          "[$read_only]($read_only_style)"
          "[$path ]($style)"
        ];
        repo_root_format = lib.concatStrings [
          "[ ](bg:black fg:bright-black)"
          "[$read_only]($read_only_style)"
          "[$before_root_path]($before_repo_root_style)"
          "[$repo_root]($repo_root_style)"
          "[$path ]($style)"
        ];
        fish_style_pwd_dir_length = 2;
        truncation_length = 5;
      };
      git_branch = {
        format = lib.concatStrings [
          "[ ](bg:black fg:bright-black)"
          "[$symbol$branch(:$remote_branch) ]($style)"
        ];
        style = "bg:black fg:bright-green";
      };
      git_commit = {
        format = "[@](bg:black fg:white)[$hash$tag ]($style)";
        style = "bg:black fg:bright-green";
        tag_symbol = "#";
        tag_disabled = false;
      };
      git_state = {
        format = "\([$state( $progress_current/$progress_total) ]($style)\)";
        style = "bg:black fg:bright-red";
      };
      git_status = {
        style = "bg:black";
        format = "[$all_status$ahead_behind]($style)";
        diverged = "[⇡$ahead_count⇣$behind_count ](bg:black fg:bright-green)";
      } //
      builtins.listToAttrs (
        builtins.map
          (
            x: { name = x.name; value = "[${x.char}\$count ](bg:black fg:${x.color})"; }
          ) [
          { name = "conflicted"; char = "~"; color = "bright-red"; }
          { name = "ahead"; char = "⇡"; color = "bright-green"; }
          { name = "behind"; char = "⇣"; color = "bright-green"; }
          { name = "untracked"; char = "?"; color = "bright-blue"; }
          { name = "stashed"; char = "$"; color = "bright-green"; }
          { name = "modified"; char = "!"; color = "bright-yellow"; }
          { name = "staged"; char = "+"; color = "bright-yellow"; }
          { name = "renamed"; char = ">"; color = "bright-yellow"; }
          { name = "deleted"; char = "X"; color = "bright-red"; }
        ]
      );
      character = {
        success_symbol = "[  ](bg:black fg:green)";
        error_symbol = "";
        format = "$symbol";
      };
      status = {
        disabled = false;
        symbol = "✘ ";
        format = "[$symbol$common_meaning$signal_name$maybe_int ]($style)";
        style = "bg:black fg:bright-red";
      };
      cmd_duration = {
        format = lib.concatStrings [
          "[ ](bg:black fg:bright-black)"
          "[ $duration ]($style)"
        ];
        style = "bg:black fg:bright-black";
        show_notifications = true;
        notification_timeout = 10000;
      };
      username = {
        format = lib.concatStrings [
          "[ ](bg:black fg:bright-black)"
          "[$user ]($style)"
        ];
        style_user = "bg:black fg:yellow";
        style_root = "bg:black bold fg:bright-red";
      };
      hostname = {
        ssh_only = true;
        ssh_symbol = "@";
        format = lib.concatStrings [
          "[ ](bg:black fg:bright-black)"
          "[$ssh_symbol](bg:black fg:white)"
          "[$hostname ]($style)"
        ];
        style = "bg:black fg:yellow";
      };
      jobs = {
        symbol = " ";
        format = lib.concatStrings [
          "[ ](bg:black fg:bright-black)"
          "[$symbol](bg:black fg:green)"
          "[$number ]($style)"
        ];
        style = "bg:black fg:green";
      };
      shlvl = {
        disabled = false;
        symbol = " ";
        format = lib.concatStrings [
          "[ ](bg:black fg:bright-black)"
          "[$symbol](bg:black fg:bright-blue)"
          "[$shlvl ]($style)"
        ];
        style = "bg:black fg:bright-blue";
      };
      time = {
        disabled = false;
        format = lib.concatStrings [
          "[ ](bg:black fg:bright-black)"
          "[$time ]($style)"
        ];
        style = "bg:black fg:bright-black";
      };
    };
  };
}
