{
    programs.yazi = {
        enable = true;
        keymap = {
            manager.prepend_keymap = [
                {
                    on = "!";
                    run = "shell \"$SHELL\" --block";
                    desc = "open shell here";
                }
            ];
        };
    };
}
