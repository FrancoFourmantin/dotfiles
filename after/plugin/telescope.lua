local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local custom_actions = {}

function custom_actions.open_in_vsplit(propmt_bufnr)
 local selected_entry = action_state.get_selected_entry()
 actions.close(propmt_bufnr)
 vim.cmd(string.format("vsplit %s", selected_entry.value))
 vim.cmd("wincmd L")  -- Move the split to the right
end

require('telescope').setup({
    defaults = {
        -- Configura aquí las opciones predeterminadas de Telescope
        --
        borderchars = { " ", " ", " ", " ", "╭", "╮", "╯", "╰" },
        prompt_prefix = " ",
        selection_caret = " ",
        results_title = " ",
        prompt_title = "Prompt",
        layout_strategy = "center",
        layout_config = {
            height = 0.2,
            -- preview_cutoff = 10,
            prompt_position = "bottom",
            width = 0.5
            --
        },
        preview = false,
        pickers = {
            find_files = {
                hidden = false,
                no_ignore = true,
                no_ignore_parent = true
            }
        },
        -- selection_strategy = "reset",
        -- sorting_strategy = "ascending",
        initial_mode = "insert",
        file_ignore_patterns = { "node_modules", "vendor" },
        mappings = {
            i = {
                ["<C-n>"] = require('telescope.actions').move_selection_next,
                ["<C-p>"] = require('telescope.actions').move_selection_previous,
                ["<C-l>"] = custom_actions.open_in_vsplit,
                ["<esc>"] = actions.close
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
    }
})

require('telescope').load_extension('fzf')


-- Configurar keymaps después de que Neovim haya cargado los plugins
vim.api.nvim_create_autocmd("User", {
    pattern = "LazyLoad",
    callback = function()
        vim.keymap.set('n', '<leader>ff', builtin.find_files , {})
        vim.keymap.set('n', '<leader>pp', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
})
