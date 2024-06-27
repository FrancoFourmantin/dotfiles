return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "php" },
                sync_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })

            configs.on_config_done = function()
                local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
                parser_config.ejs = {
                    install_info = {
                        url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
                        files = { "src/parser.c" },
                        --require_generate_from_grammar = vrai,
                    },
                    filetype = "ejs",
                }
            end

            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.embedded_template = {
                install_info = {
                    url = "https://github.com/tree-sitter/tree-sitter-embedded-template", -- local path or git repo
                    files = { "src/parser.c" },                                           -- note that some parsers also require src/scanner.c or src/scanner.cc
                    require_generate_from_grammar = true
                },
                used_by = { 'ejs' },
                filetype = "ejs", -- if filetype does not match the parser name
            }

            vim.treesitter.language.register('embedded_template', 'ejs')
            vim.treesitter.language.register('html', 'ejs')

            -- Asegurar el tipo de archivo correcto
            vim.cmd [[
             autocmd BufRead,BufNewFile *.ejs set filetype=ejs
            ]]
        end
    },
}
