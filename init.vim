call plug#begin()
Plug 'lervag/vimtex'

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'
let g:vimtex_indent_enabled = 0
let g:tex_indent_items = 0
let g:vimtex_quickfix_ignore_filters = [
      \ 'Package babel Warning',
      \]

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'dense-analysis/ale'
let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1
let b:ale_linters = {'python': ['pyflakes'], 'latex': ['chktex'] }
let b:ale_fixers= {'python': ['black', 'ruff' ]}
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'python': ['black'],
" \}
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'preservim/nerdtree'
Plug 'fcpg/vim-altscreen'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'


Plug 'deoplete-plugins/deoplete-go'
let g:deoplete#enable_at_startup = 0

Plug 'folke/tokyonight.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'pechorin/any-jump.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ggandor/leap.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'sbdchd/neoformat'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter',  {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'preservim/tagbar'
Plug 'fnune/recall.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'mhartington/formatter.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()
" call deoplete#custom#var('omni', 'input_patterns', {
"
"     \ 'tex': g:vimtex#re#deoplete
"     \})

" run the formatter on save
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

inoremap " ""<left>
" inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
" inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
autocmd FileType c,cpp imap {<CR> {<CR>}<Esc>O
noremap <silent> [a :ALEPrevious<CR>
nnoremap <silent> ]a :ALENext<CR>
nnoremap <C-i> :buffers<CR>:buffer<Space>
nnoremap <C-b> :bn<CR>



let mapleader=","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


nnoremap <silent> <leader>r :w !python3 %<CR>
nnoremap <silent> <leader>s :call UltiSnips#RefreshSnippets()<CR>

nnoremap <silent><leader>f <cmd>Telescope find_files hidden=true<cr>

map <silent><leader>a : setlocal spell spelllang=fr<CR>
map <silent><leader>n : set nospell<CR>
map <silent><leader>c : spellrepall<CR>
map <silent> <leader>v : w !xsel -bi<CR>
map <silent> <leader>i : AnyJumpArg
map <silent><leader>m :Telescope recall theme=ivy<CR>
map <silent><Space>m :RecallMark<CR>
map <silent><leader>t :NvimTreeToggle<CR>
map <silent><leader>b :TagbarToggle<CR>
map <silent><leader>l :ALEToggle<CR>


nmap("<C-u>", "<C-u>zz");
nmap("<C-d>", "<C-d>zz");

set hlsearch!

nnoremap <C-p> :set hlsearch!<CR>
" vim.o.scrolloff = 8;



set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set clipboard=unnamed
set encoding=utf-8
set foldmethod=syntax
set foldlevel=99
" set noesckeys
syntax on
filetype on



let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" set ColorHighlight
" iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
set background=dark
set cursorline

" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END
" set t_Co=256
" set termguicolors


colorscheme tokyonight-night
" colorscheme catppuccin-mocha
" colorscheme catppuccin-latte
set termguicolors
set t_Co=256
"copy filepath
nnoremap yf :let @+=expand('%:p')<CR>
" nnoremap <leader>e o<Esc>
" require('neoscroll').setup()
lua <<EOF
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['ccls'].setup {
    capabilities = capabilities
  }
require'lspconfig'.pyright.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.jdtls.setup{}
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
require'leap'.create_default_mappings()
require("nvim-tree").setup()

require'recall'.setup{}
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

