vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.hlsearch = false
vim.opt.completeopt = { "menuone", "noselect", "popup" }
-- vim.opt.winborder = 'rounded'

vim.lsp.enable({ "lua_ls", "clangd" })
vim.cmd.colorscheme('everforest')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>ff", "ggVG=")
vim.keymap.set('n', '<leader><leader>', ":Pick files<CR>")
vim.keymap.set('n', '<leader>xh', ":Pick help<CR>")

vim.pack.add({
	"cohama/lexima.vim",
	{ src = 'echasnovski/mini.pick', version = '*' },
	{ src = "saghen/blink.cmp", version = "v1.*" },
})

require('mini.pick').setup()
require("blink.cmp").setup()
