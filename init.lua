local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = {
		{ "echasnovski/mini.pairs", version = '*' },
		{ "saghen/blink.cmp", version = "v1.*", opts = {} },
		{ "DarthMooMancer/Polydev", dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
		{ "ibhagwan/fzf-lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
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
vim.keymap.set('n', '<leader><leader>', ":FzfLua files<CR>")
vim.keymap.set('n', '<leader>gh', ":FzfLua helptags<CR>")
vim.keymap.set('n', '<leader>gg', ":FzfLua live_grep<CR>")
vim.keymap.set('n', '<leader>xx', ":FzfLua diagnostics_workspace<CR>")
vim.keymap.set('n', '<leader>po', ":PolydevOpen<CR>")
vim.lsp.enable({ "lua_ls", "clangd" })
vim.cmd.colorscheme('everforest')

require('mini.pairs').setup()
require("fzf-lua").setup({
	"border-fused",
	fzf_opts = { ["--wrap"] = true },
	previewers = {
		builtin = {
			syntax_limit_b = -102400, -- 100KB limit on highlighting files
		},
	},
	winopts = {
		preview = {
			wrap = true,
		},
	},
	grep = {
		rg_glob = true,
		rg_glob_fn = function(query)
			local regex, flags = query:match("^(.-)%s%-%-(.*)$")
			return (regex or query), flags
		end,
	},
	defaults = {
		-- git_icons = false,
		-- file_icons = false,
		-- color_icons = false,
		formatter = "path.filename_first",
	},
})
