-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#6b7280" })
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#6b7280" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#6b7280" })
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#6b7280" })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#6b7280" })
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#6b7280" })
vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = "#6b7280" })
vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#aaaaaa", underline = true })
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#ffaaaa" })
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#6b7280" })
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ffaaaa" })
vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = "#aaaaaa" })
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#6b7280", bold = false })
vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#333333" })
vim.api.nvim_set_hl(0, "NvimTreeFileIcon" , { fg = "#6b7280" })
vim.api.nvim_set_hl(0 , "NvimTreeNormal" , { fg = "#6b7280" })

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyLoad",
    callback = function()
    end
})

require("nvim-tree").setup()


require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    on_attach = function(bufnr) -- No olvidarse de bufnr para que no queden los remaps para todos lados
        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        local api = require("nvim-tree.api")

        local function edit_or_open()
            local node = api.tree.get_node_under_cursor()

            if node.nodes ~= nil then
                -- expand or collapse folder
                api.node.open.edit()
            else
                -- open file
                api.node.open.edit()
                -- Close the tree if file was opened
                api.tree.close()
            end
        end

        -- open as vsplit on current node
        local function vsplit_preview()
            local node = api.tree.get_node_under_cursor()

            if node.nodes ~= nil then
                -- expand or collapse folder
                api.node.open.edit()
            else
                -- open file as vsplit
                api.node.open.vertical()
            end

            -- Finally refocus on tree if it was lost
            api.tree.focus()
        end

        vim.keymap.set("n", "l", edit_or_open, opts('Edit or Open'))
        vim.keymap.set("n", "L", vsplit_preview, opts('Vertical Split'))


        local mappings = {
            -- BEGIN_DEFAULT_ON_ATTACH
            ["<C-]>"] = { api.tree.change_root_to_node, "CD" },
            ["<C-e>"] = { api.node.open.replace_tree_buffer, "Open: In Place" },
            ["<C-k>"] = { api.node.show_info_popup, "Info" },
            ["<C-r>"] = { api.fs.rename_sub, "Rename: Omit Filename" },
            ["<C-t>"] = { api.node.open.tab, "Open: New Tab" },
            ["<C-v>"] = { api.node.open.vertical, "Open: Vertical Split" },
            ["<C-x>"] = { api.node.open.horizontal, "Open: Horizontal Split" },
            ["<BS>"] = { api.node.navigate.parent_close, "Close Directory" },
            ["<CR>"] = { api.node.open.edit, "Open" },
            ["<Tab>"] = { api.node.open.preview, "Open Preview" },
            [">"] = { api.node.navigate.sibling.next, "Next Sibling" },
            ["<"] = { api.node.navigate.sibling.prev, "Previous Sibling" },
            ["."] = { api.node.run.cmd, "Run Command" },
            ["-"] = { api.tree.change_root_to_parent, "Up" },
            ["a"] = { api.fs.create, "Create" },
            ["bmv"] = { api.marks.bulk.move, "Move Bookmarked" },
            ["B"] = { api.tree.toggle_no_buffer_filter, "Toggle No Buffer" },
            ["c"] = { api.fs.copy.node, "Copy" },
            ["C"] = { api.tree.toggle_git_clean_filter, "Toggle Git Clean" },
            ["[c"] = { api.node.navigate.git.prev, "Prev Git" },
            ["]c"] = { api.node.navigate.git.next, "Next Git" },
            ["d"] = { api.fs.remove, "Delete" },
            ["D"] = { api.fs.trash, "Trash" },
            ["E"] = { api.tree.expand_all, "Expand All" },
            ["e"] = { api.fs.rename_basename, "Rename: Basename" },
            ["]e"] = { api.node.navigate.diagnostics.next, "Next Diagnostic" },
            ["[e"] = { api.node.navigate.diagnostics.prev, "Prev Diagnostic" },
            ["F"] = { api.live_filter.clear, "Clean Filter" },
            ["f"] = { api.live_filter.start, "Filter" },
            ["g?"] = { api.tree.toggle_help, "Help" },
            ["gy"] = { api.fs.copy.absolute_path, "Copy Absolute Path" },
            ["H"] = { api.tree.toggle_hidden_filter, "Toggle Dotfiles" },
            ["I"] = { api.tree.toggle_gitignore_filter, "Toggle Git Ignore" },
            ["J"] = { api.node.navigate.sibling.last, "Last Sibling" },
            ["K"] = { api.node.navigate.sibling.first, "First Sibling" },
            ["m"] = { api.marks.toggle, "Toggle Bookmark" },
            ["o"] = { api.node.open.edit, "Open" },
            ["O"] = { api.node.open.no_window_picker, "Open: No Window Picker" },
            ["p"] = { api.fs.paste, "Paste" },
            ["P"] = { api.node.navigate.parent, "Parent Directory" },
            ["q"] = { api.tree.close, "Close" },
            ["r"] = { api.fs.rename, "Rename" },
            ["R"] = { api.tree.reload, "Refresh" },
            ["s"] = { api.node.run.system, "Run System" },
            ["S"] = { api.tree.search_node, "Search" },
            ["U"] = { api.tree.toggle_custom_filter, "Toggle Hidden" },
            ["W"] = { api.tree.collapse_all, "Collapse" },
            ["x"] = { api.fs.cut, "Cut" },
            ["y"] = { api.fs.copy.filename, "Copy Name" },
            ["Y"] = { api.fs.copy.relative_path, "Copy Relative Path" },
            ["<2-LeftMouse>"] = { api.node.open.edit, "Open" },
            ["<2-RightMouse>"] = { api.tree.change_root_to_node, "CD" },
            -- END_DEFAULT_ON_ATTACH

            -- Mappings migrated from view.mappings.list
            ["l"] = { api.node.open.edit, "Open" },
            ["<CR>"] = { api.node.open.edit, "Open" },
            ["o"] = { api.node.open.edit, "Open" },
            ["h"] = { api.node.navigate.parent_close, "Close Directory" },
            ["v"] = { api.node.open.vertical, "Open: Vertical Split" },
            ["C"] = { api.tree.change_root_to_node, "CD" },
        }

        for keys, mapping in pairs(mappings) do
            vim.keymap.set("n", keys, mapping[1], opts(mapping[2]))
        end
    end,
    view = {
        width = 25
    },
    renderer = {
        group_empty = true,
        add_trailing = false,
        full_name = false,
        root_folder_label = ":t",
        indent_width = 2,
    },
    filters = {
        dotfiles = true,
    },
})
