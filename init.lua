vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>:cclose<CR>", { noremap = true, silent = true })
	end,
})

vim.pack.add({
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
	"neanias/everforest-nvim",
	"cohama/lexima.vim",
	"DarthMoomancer/Polydev",
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
	"tjdevries/php.nvim",
	"norcalli/nvim-colorizer.lua",
	{ src = "saghen/blink.cmp", version = "v1.*" },
})

require("blink.cmp").setup()
require("everforest").setup({ transparent_background_level = 2 })
require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true }
})

vim.cmd.colorscheme('everforest')
vim.lsp.enable({ "lua_ls", "clangd" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
})

vim.opt.mouse =  ""
vim.opt.completeopt = "noselect"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.swapfile = false

vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>ff", "gg=G")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>xg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>xh', builtin.help_tags, { desc = 'Telescope help tags' })
