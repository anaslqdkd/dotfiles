local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

lspconfig.csharp_ls.setup({})
-- require'lspconfig'.csharp_ls.setup{}
lspconfig.csharp_ls.setup({
	root_dir = lspconfig.util.root_pattern(".git", ".csproj", "packages.config"),
})

lspconfig.csharp_ls.setup({
	root_dir = lspconfig.util.root_pattern(".git", ".csproj", "packages.config"),
	cmd = { "/home/ash/.dotnet/tools/csharp-ls" }, -- Ensure cmd path is correct
	filetypes = { "cs" }, -- Specify file types to activate csharp_ls
	autostart = true, -- Automatically start the language server
	custom_handlers = {}, -- Optional: Define custom handlers if needed
})

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		lsp_zero.default_setup,
	},
})
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

local luasnip = require("luasnip")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

require("lspconfig").rust_analyzer.setup({
	on_attach = function(_, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		local opts = { noremap = true, silent = true }
		buf_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format { async = true }<CR>", opts)
	end,

	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

lspconfig.pylsp.setup({
	on_attach = custom_attach,
	settings = {
		pylsp = {
			plugins = {
				-- formatter options
				black = { enabled = true },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				-- linter options
				pylint = { enabled = true, executable = "pylint" },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				-- type checker
				pylsp_mypy = { enabled = true },
				-- auto-completion options
				jedi_completion = { fuzzy = true },
				-- import sorting
				pyls_isort = { enabled = true },
			},
		},
	},
	flags = {
		debounce_text_changes = 200,
	},
	capabilities = capabilities,
})

lspconfig.java_language_server.setup({
	on_attach = function(client, bufnr)
		client.stop() -- Stop the server as soon as it starts
	end,
	autostart = false, -- Ensure it does not start automatically
})

lspconfig.jdtls.setup({
	settings = {
		java = {
			-- saveActions = {
			-- 	organizeImports = false, -- Disable organizing imports on save
			-- },
			-- diagnostics = {
			-- 	unusedImports = "ignore", -- Ignore unused imports
			-- },
			-- Additional settings can be added here
		},
	},
	on_attach = function(client, bufnr)
		-- Additional customization for `jdtls` if necessary
	end,
})
