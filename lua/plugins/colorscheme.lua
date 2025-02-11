return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require('rose-pine').setup {
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                }, }
        end,

        -- optionally set the colorscheme within lazy config
        init = function()
            vim.cmd("colorscheme rose-pine")
        end
    },
}

