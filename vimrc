" automatic installation vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'sainnhe/everforest'
Plug 'roxma/nvim-yarp'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'dense-analysis/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let b:ale_linters = {'python': ['pyflakes'], 'latex': ['chktex']}
let b:ale_fixers= {'python': ['black', 'ruff' ]}
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'python': ['black'],
" \}
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'preservim/nerdtree'
Plug 'fcpg/vim-altscreen'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
""Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'

Plug 'deoplete-plugins/deoplete-go'
let g:deoplete#enable_at_startup = 1


call plug#end()

call deoplete#custom#var('omni', 'input_patterns', {
    \ 'tex': g:vimtex#re#deoplete
    \})

inoremap " ""<left>
" inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
" inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
autocmd FileType html inoremap ' ''<left>
autocmd FileType python inoremap ' ''<left>
autocmd FileType txt inoremap ' ''<left>
autocmd FileType c inoremap ' ''<left>
autocmd FileType c,cpp imap {<CR> {<CR>}<Esc>O
autocmd FileType c,cpp imap <<CR> <><left>




let mapleader=","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>r :w !python3 %<CR>
nnoremap <leader>s :call UltiSnips#RefreshSnippets()<CR>
nnoremap <c-h> :tabprevious<CR>
nnoremap <c-l> :tabprevious<CR>


vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

map <F1> : setlocal spell spelllang=fr<CR>
map <F2> : set nospell<CR>
map <leader>c : spellrepall<CR>
map <leader>v : w !xsel -bi<CR>
map <leader>sn ]s
map <leader>sp [s


set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set clipboard=unnamed
set encoding=utf-8
set foldmethod=indent
set foldlevel=99
" set noesckeys
syntax on
filetype on

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

"""""""""" curseur qui change en insert mode 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

colorscheme catppuccin-mocha
" set ColorHighlight
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

