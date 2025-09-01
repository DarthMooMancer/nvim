local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = {
		{ "echasnovski/mini.pairs", version = '*' },
		{ "nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' } },
		{ "saghen/blink.cmp", version = "v1.*", opts = {} },
		{ "DarthMooMancer/Polydev", dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
		{ "folke/trouble.nvim", opts = {}, cmd = "Trouble" },
	}
})

vim.g.mapleader = " "
vim.opt.mouse = ""
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.hlsearch = false
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>ff", "ggVG=")
vim.keymap.set('n', '<leader><leader>', ":Telescope find_files<CR>")
vim.keymap.set('n', '<leader>xh', ":Telescope help_tags<CR>")
vim.keymap.set('n', '<leader>xx', ":Trouble diagnostics toggle<CR>")
vim.keymap.set('n', '<leader>po', ":PolydevOpen<CR>")
vim.lsp.enable({ "lua_ls", "clangd" })
vim.cmd.colorscheme('everforest')

require('mini.pairs').setup()
