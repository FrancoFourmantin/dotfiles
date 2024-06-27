vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1 -- Ajusta este valor según tu preferencia


vim.opt.showmode = false

-- Configuración de la transparencia
-- vim.cmd [[
--   hi LineNr guibg=NONE ctermbg=NONE guifg=#5c6370
--   hi CursorLineNr guibg=NONE ctermbg=NONE guifg=#abb2bf
--   hi SignColumn guibg=NONE ctermbg=NONE
--   hi GitSignsAdd guibg=NONE ctermbg=NONE
--   hi GitSignsChange guibg=NONE ctermbg=NONE
--   hi GitSignsDelete guibg=NONE ctermbg=NONE
--   hi DiagnosticSignError guibg=NONE ctermbg=NONE
--   hi DiagnosticSignWarn guibg=NONE ctermbg=NONE
--   hi DiagnosticSignInfo guibg=NONE ctermbg=NONE
--   hi DiagnosticSignHint guibg=NONE ctermbg=NONE
--   hi EndOfBuffer guibg=NONE ctermbg=NONE
-- ]]
-- Remove empty lines tildes
vim.cmd([[highlight EndOfBuffer guifg=bg]])


-- Configuración adicional para que la transparencia sea efectiva
vim.opt.winblend = 10
vim.opt.pumblend = 10


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true;

vim.opt.wrap = false



vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 16

vim.opt.updatetime = 50

if true then

end

vim.keymap.set("i" , "jk" , "<esc>" );
vim.keymap.set("v" , "jk" , "<esc>" );


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>v", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
--vim.keypmap.set("n" , "<leader>Y" , "\"+Y")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- Moverse entre ventanas en Neovim usando Lua
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
