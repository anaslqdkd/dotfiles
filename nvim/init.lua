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
require("ash.jdtls")
require("ash.aerial")
require("ash.ibl")
require("ash.image")
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
vim.filetype.add({
	pattern = {
		[".*%.fxml$"] = "xml", -- Associate .fxml with XML filetype
	},
})

vim.diagnostic.config({
	virtual_text = true, -- Show diagnostic messages inline with code
	signs = true, -- Show diagnostic signs in the gutter
	underline = true, -- Underline errors and warnings
	severity_sort = true, -- Sort diagnostics by severity
	update_in_insert = false, -- Don't update diagnostics in insert mode
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "java",
-- 	callback = function()
-- 		for _, client in pairs(vim.lsp.get_active_clients()) do
-- 			if client.name == "java_language_server" then
-- 				client.stop()
-- 			end
-- 		end
-- 	end,
-- })
