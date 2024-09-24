require("ash.plugins")
require("ash.settings")
require("ash.remap")
require("ash.treesitter")
require("ash.telescope")
require("ash.lsp")
require("ash.oil")
require("ash.autopairs")
require("ash.leap")
require("ash.conform")
require("ash.vimtex")

require("lspconfig").csharp_ls.setup({})
require("lspconfig").css_variables.setup({})
-- For init.lua
local nvim_lsp = require("lspconfig")

nvim_lsp.clangd.setup({})

-- Optional: Use nvim-lsp-installer to automatically install LSP servers
require("lspconfig").clangd.setup({})
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
	cmd = { "clangd", "--compile-commands-dir=./build" },
	root_dir = function()
		return vim.loop.cwd()
	end,
})
