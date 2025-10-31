local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = {
		{ "rose-pine/neovim", name = "rose-pine" },
		{ "mbbill/undotree" },
		{ "echasnovski/mini.pairs", version = '*' },
		{ "ibhagwan/fzf-lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
		{ "saghen/blink.cmp", version = "v1.*", opts = {} },
		{ dir = "~/personal/Projects/Lua/Polydev/", opts = {
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
require("fzf-lua").setup({
	"border-fused",
	fzf_opts = { ["--wrap"] = true },
	previewers = {
		builtin = {
			syntax_limit_b = -102400, -- 100KB limit on highlighting files
		},
	},
	winopts = {
		height           = 0.50,            -- window height
		width            = 0.45,            -- window width
		row              = 0.35,            -- window row position (0=top, 1=bottom)
		col              = 0.50,            -- window col position (0=left, 1=right)
		border           = "rounded",
		backdrop         = 0,
		fullscreen       = false,           -- start fullscreen?
		treesitter       = {
			enabled    = true,
			fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
		},
		preview = {
			border         = "rounded",       -- preview border: accepts both `nvim_open_win`
			wrap           = false,           -- preview line wrap (fzf's 'wrap|nowrap')
			hidden         = true,           -- start preview hidden
			vertical       = "down:45%",      -- up|down:size
			horizontal     = "right:60%",     -- right|left:size
			layout         = "flex",          -- horizontal|vertical|flex
			flip_columns   = 100,             -- #cols to switch to horizontal on flex
			title          = true,            -- preview border title (file/buf)?
			title_pos      = "center",        -- left|center|right, title alignment
			scrollbar      = false,         -- `false` or string:'float|border'
			scrolloff      = -1,              -- float scrollbar offset from right
			delay          = 20,              -- delay(ms) displaying the preview
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
		formatter = "path.filename_first",
	},
})

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
vim.cmd.colorscheme("rose-pine-moon")
vim.lsp.enable({ "lua_ls", "clangd" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineTerm", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#232136", bg = "#95b1ac" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>ff", "ggVG=")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set('n', '<leader><leader>', ":FzfLua files<CR>")
vim.keymap.set('n', '<leader>gh', ":FzfLua helptags<CR>")
vim.keymap.set('n', '<leader>gg', ":FzfLua live_grep<CR>")
vim.keymap.set('n', '<leader>xx', ":FzfLua diagnostics_workspace<CR>")
vim.keymap.set('n', '<leader>po', ":PolydevOpen<CR>")
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>gR", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>")
