local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

lspconfig.csharp_ls.setup{}
-- require'lspconfig'.csharp_ls.setup{}
lspconfig.csharp_ls.setup({
  root_dir = lspconfig.util.root_pattern(".git", ".csproj", "packages.config")
})

lspconfig.csharp_ls.setup({
  root_dir = lspconfig.util.root_pattern(".git", ".csproj", "packages.config"),
  cmd = { "/home/ash/.dotnet/tools/csharp-ls" },  -- Ensure cmd path is correct
  filetypes = { "cs" },  -- Specify file types to activate csharp_ls
  autostart = true,  -- Automatically start the language server
  custom_handlers = {},  -- Optional: Define custom handlers if needed
})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local luasnip = require'luasnip'
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

