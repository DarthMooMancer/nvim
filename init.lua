local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = {
		{ "rose-pine/neovim", name = "rose-pine",
			config = function()
				require("rose-pine").setup({
					highlight_groups = {
						CurSearch = { fg = "base", bg = "leaf", inherit = false },
						Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
						TelescopeNormal = { bg = "none" },
						TelescopeBorder = { fg = "highlight_high", bg = "none" },
						TelescopePromptNormal = { bg = "base" },
						TelescopeResultsNormal = { fg = "subtle", bg = "none" },
						TelescopeSelection = { fg = "text", bg = "base" },
						TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
					},
				})
				vim.cmd.colorscheme("rose-pine-moon")
			end
		},
		{ "sainnhe/everforest" },
		{ "mbbill/undotree" },
		{ "echasnovski/mini.pairs", version = '*' },
		{ "ibhagwan/fzf-lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
		{ 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
		{ "saghen/blink.cmp", version = "v1.*", opts = {} },
		{ "DarthMooMancer/Polydev", opts = {
			terminal = {
				mode = "floating",
			}
		} },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					highlight = { enable = true },
					indent = { enable = true }
				})
			end
		},
	}
})

require('mini.pairs').setup()

vim.g.mapleader = " "
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
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.lsp.enable({ "lua_ls", "clangd" })
vim.g.everforest_enable_italic = true
vim.g.everforest_transparent_background = 2
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>ff", "ggVG=")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set('n', '<leader><leader>', ":Telescope find_files<CR>")
vim.keymap.set('n', '<leader>gh', ":Telescope help_tags<CR>")
vim.keymap.set('n', '<leader>gg', ":Telescope live_grep<CR>")
vim.keymap.set('n', '<leader>xx', ":Telescope diagnostics<CR>")
vim.keymap.set('n', '<leader>po', ":PolydevOpen<CR>")
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>gR", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>")
