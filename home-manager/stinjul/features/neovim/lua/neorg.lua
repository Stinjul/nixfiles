require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    home = "~/Documents/Notes",
                    work = "~/Work/Documents/Notes",
                },
                default_workspace = "home",
            },
        },
        ["core.concealer"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
    },
})
