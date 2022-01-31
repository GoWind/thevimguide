o not care about Vi compatibility
set nocompatible
set ts=4
set sts=2
set shiftwidth=2
set expandtab
set fileencodings=utf-8,gb18030,ucs-bom,cp936

"
"set list
"set listchars=tab:>-
nnoremap ; :

inoremap jj <Esc>
"inoremap {  {}<Esc>i
"inoremap [  []<Esc>i
"inoremap ( ()<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i

"enable the next line to type `confr` in normal mode, to reload the Vim configuration file
"nnoremap confr :so $MYVIMRC<CR>

let mapleader=","

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'jremmen/vim-ripgrep'
"Typescript 
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

"Plugin for working nicely with fzf
Plug 'junegunn/fzf'
"When opening a file, figures out the "root" of the file's project
"Useful as Rg, fzf etc will search recursively till root of file system
"at times and we need to stop at a certain ancestor (eg: .git, package.json,
"Makefile etc)
Plug 'airblade/vim-rooter'
"surround for quoting and enclosing stuff with braces
Plug 'tpope/vim-surround'

"Zig lang
Plug 'ziglang/zig.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Show open buffers in a line above the status line
Plug 'bling/vim-bufferline'

call plug#end()

"search stuff
set ignorecase
"if search term has capitalized letters than use that
set smartcase
set incsearch

"Ctrl + navigation keys for switching between windows
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-.> <C-W>>

"uncommment below to have NERDTree open when you start the editor
"but it is too noisy
"autocmd VimEnter * NERDTree

nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F3> :set nu!<CR>

augroup filetype_go
  nmap <leader>b <Plug>(go-build)
  nmap <leader>r <Plug>(go-run)
  "quick fix window
  nmap <leader><C-o> :copen<CR>
  nmap <leader><C-e> :ccl<CR>
  nmap <leader><C-n> :cnext<CR>
  nmap <leader><C-p> :cprevious<CR>
augroup END

augroup filetype_clojure
  let g:iced_enable_default_key_mappings=v:true
  let maplocalleader="\\"
  nmap <localleader>s <Plug>(iced_slurp)
  nmap <localleader>b <Plug>(iced_barf)
augroup END

augroup filetype_zig
  "zig loads errors in the location list
  "set shortcuts to manipulate the location list
  nmap <leader>lo :lopen<CR>
  nmap <leader>lc :lclose<CR>
  nmap <leader>ln :lnext<CR>
  nmap <leader>lp :lprevious<CR>
augroup END

"`>a points to end of selection in visual mode
"`<i point to beginning of selection in visual mode
vmap <leader>sq <Esc>`>a'<ESC>`<i'<ESC>
vmap <leader>dq <Esc>`>a"<ESC>`<i"<ESC>
"use * in Normal mode, to jump to search word under cursor in the forward direction
"use # in Normal mode, to jump to search word under cursor in the backward direction

"to load configuration from the current file, use `:so %`
"doing so while editing ~/.vimrc will cause Vim to reload your
"configuration
let g:coc_disable_startup_warning = 1
let g:rooter_patterns = [".git", "Makefile", "build.zig", "package.json"]
let g:fzf_preview_window = ['up:40%', 'ctrl-/']

nmap <leader><tab> <plug>(fzf-maps-n)
