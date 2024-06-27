-- Configurar keymaps después de que Neovim haya cargado los plugins
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function()
		vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
	end
})
