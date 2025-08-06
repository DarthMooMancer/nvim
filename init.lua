-- local pack_add = function(specs)
--   local norm_specs = {}
--   for i, s in ipairs(specs) do
--     if type(s) == 'string' then s = { src = s } end
--     if s.src:find('^[%w-]+/[%w-_.]+$') ~= nil then s.src = 'https://github.com/' .. s.src end
--     norm_specs[i] = s
--   end

--   vim.pack.add(norm_specs)
-- end

-- pack_add({
--   'echasnovski/mini.pick',
--   'echasnovski/mini.files',
-- })

vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.opt.mouse =  ""

vim.lsp.enable({ "lua_ls", "clangd" })
vim.cmd.colorscheme('everforest')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>ff", "ggVG=")
vim.keymap.set('n', '<leader><leader>', ":Pick files<CR>")
vim.keymap.set('n', '<leader>xh', ":Pick help<CR>")
vim.keymap.set('n', '<leader>xx', ":Pick diagnostic<CR>")

vim.pack.add({
	{ src = 'echasnovski/mini.pick', version = '*' },
	{ src = 'echasnovski/mini.extra', version = '*' },
	{ src = 'echasnovski/mini.pairs', version = '*' },
	{ src = "saghen/blink.cmp", version = "v1.*" },
})

require('mini.pick').setup()
require('mini.extra').setup()
require('mini.pairs').setup()
require("blink.cmp").setup()
