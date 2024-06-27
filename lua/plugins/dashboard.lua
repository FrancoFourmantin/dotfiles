return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',            --  theme is doom and hyper default is hyper
                disable_move = false,       --  default is false disable move keymap for hyper
                shortcut_type = "letter",   --  shorcut type 'letter' or 'number'
                change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
                config = {
                    week_header = {
                        enable = true,
                    },
                    packages = { enable = false }, -- show how many plugins neovim loaded
                    -- limit how many projects list, action when you press key or enter it will run this action.
                    -- action can be a functino type, e.g.
                    -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
                    project = { enable = true, limit = 8, icon = 'Recent projects', label = '', action = 'Telescope find_files cwd=' },
                    mru = { limit = 10, icon = 'Recent files', label = '', cwd_only = false },
                    footer = {}, -- footer
                },
                hide = {
                    statusline = false, -- hide statusline default is true
                    tabline    = true,  -- hide the tabline
                    winbar     = true,  -- hide winbar
                },
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    }
}
