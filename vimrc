set ts=2
set expandtab
nnoremap ; :

inoremap jj <Esc>
inoremap {  {}<Esc>i
inoremap [  []<Esc>i
inoremap ( ()<Esc>i
"nnoremap confr :so $MYVIMRC<CR>

let mapleader=","

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'jremmen/vim-ripgrep'

"clojure plugins
Plug 'junegunn/fzf'
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}

"surround for quoting and enclosing stuff with braces
Plug 'tpope/vim-surround'



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

"uncommment below to have NERDTree open when you start the editor
"but it is too noisy
"autocmd VimEnter * NERDTree

nnoremap <F6> :NERDTreeToggle<CR>

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

"use * in Normal mode, to jump to search word under cursor in the forward direction
"use # in Normal mode, to jump to search word under cursor in the backward direction

