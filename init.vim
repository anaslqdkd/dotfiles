call plug#begin()
Plug 'lervag/vimtex'

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'
let g:vimtex_indent_enabled = 0
let g:tex_indent_items = 0
" Filter out some compilation warning messages from QuickFix display
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
let b:ale_linters = {'python': ['pyflakes'], 'latex': ['chktex']}
" let b:ale_fixers= {'python': ['black', 'ruff' ]}
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'python': ['black'],
" \}
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'preservim/nerdtree'
Plug 'fcpg/vim-altscreen'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='bubblegum'
" Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
""Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DrawIt'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'nvim-tree/nvim-web-devicons'
Plug 'ap/vim-css-color'


Plug 'deoplete-plugins/deoplete-go'
let g:deoplete#enable_at_startup = 1

Plug 'folke/tokyonight.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

Plug 'nvim-lua/plenary.nvim'
" Plug 'tjdevries/express_line.nvim'

" Plug 'feline-nvim/feline.nvim'

Plug 'karb94/neoscroll.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim' 
Plug 'pechorin/any-jump.vim'
Plug 'chentoast/marks.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'anuvyklack/pretty-fold.nvim'
Plug 'ggandor/leap.nvim'
Plug 'sindrets/diffview.nvim'

call plug#end()
" call deoplete#custom#var('omni', 'input_patterns', {
"
"     \ 'tex': g:vimtex#re#deoplete
"     \})

inoremap " ""<left>
" inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
" inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" autocmd FileType html inoremap ' ''<left>
" autocmd FileType python inoremap ' ''<left>
" autocmd FileType txt inoremap ' ''<left>
" autocmd FileType c inoremap ' ''<left>
autocmd FileType c,cpp imap {<CR> {<CR>}<Esc>O
" autocmd FileType c,cpp imap <<CR> <><left>
" autocmd FileType python set foldmethod=indent
nnoremap <silent> [a :ALEPrevious<CR>
nnoremap <silent> ]a :ALENext<CR>
nnoremap <C-i> :buffers<CR>:buffer<Space>
nnoremap <C-b> :bn<CR>


let mapleader=","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <leader>f :NERDTreeFind<CR>
" nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>r :w !python3 %<CR>
nnoremap <silent> <leader>s :call UltiSnips#RefreshSnippets()<CR>
" nnoremap <c-h> :tabprevious<CR>
" nnoremap <c-l> :tabprevious<CR>

" tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
" nnoremap   <silent>   <F8>    :FloatermPrev<CR>
" tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
" nnoremap   <silent>   <F9>    :FloatermNext<CR>
" tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap <silent><leader>g :FloatermNew --height=0.6 --width=0.4 --position=topright<CR>
" noremap  <silent><leader>t  :FloatermToggle<CR>
" noremap! <silent><leader>t  <Esc>:FloatermToggle<CR>
" tnoremap <silent><leader>t  <C-\><C-n>:FloatermToggle<CR>
" nnoremap <leader>u :FloatermNew --autoclose=0 gcc % -o %< && ./%<
" tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent><leader>f <cmd>Telescope find_files hidden=true<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>ff :FZF <CR>
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-i': 'split',
"   \ 'ctrl-v': 'vsplit' }
" let $FZF_DEFAULT_COMMAND = 'rg -g ""'
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a`<esc>`<i`<esc>

map <leader>a : setlocal spell spelllang=fr<CR>
map <leader>n : set nospell<CR>
map <leader>c : spellrepall<CR>
map <silent> <leader>v : w !xsel -bi<CR>
map <silent> <leader>i : AnyJumpArg
map <leader>m : MarksListAll<CR>
map <leader>b : BookmarksListAll<CR>
" map <leader>sn ]s
" map <leader>sp [s

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


" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" " Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" autocmd InsertEnter * set cursorline
" autocmd InsertLeave * set nocursorline

"""""""""" curseur qui change en insert mode 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" set ColorHighlight
" iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
set background=dark

" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END
" set t_Co=256
" set termguicolors


colorscheme tokyonight-night 
set termguicolors
set t_Co=256
"copy filepath
nnoremap yf :let @+=expand('%:p')<CR>
" nnoremap <leader>e o<Esc>
" require('neoscroll').setup()
lua <<EOF


require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- disables mark tracking for specific buftypes. default {}
  excluded_buftypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "!!!",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate =true,
  },
  mappings = {}
}

require'pretty-fold'.setup{
global = {...}, -- global config table for all foldmethods
marker = { process_comment_signs = 'spaces' },
expr   = { process_comment_signs = false },
}
require'leap'.create_default_mappings()

require'pretty-fold'.setup{
   keep_indentation = false,
   fill_char = '.',
   remove_fold_markers = true,
   sections = {
      left = {
         '+++', function() return string.rep('', vim.v.foldlevel) end,
         ' ', 'number_of_folded_lines', ':', 'content',
      }
   }
}
EOF
highlight Folded guibg=#1A1B26
" highlight Folded guibg=Black
