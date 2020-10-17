set ts=2
set expandtab
nnoremap ; :

inoremap jj <Esc>

"brackets
inoremap {  {}<Esc>i
inoremap [  []<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
nnoremap confr :so $MYVIMRC<CR>

let mapleader=","
let maplocalleader=" "
nnoremap <Space> <Nop>
nmap <localleader>n :cnext<CR>
nmap <localleader>p :cprevious<CR>

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'jremmen/vim-ripgrep'

"Prettify typescript code
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"clojure plugins
Plug 'junegunn/fzf'
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}

"surround for quoting and enclosing stuff with braces
Plug 'tpope/vim-surround'

"git
Plug 'tpope/vim-fugitive'

"Vimwiki
Plug 'vimwiki/vimwiki'

"Typescript
Plug 'quramy/tsuquyomi'



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

"
let g:vimwiki =[{'path': '~/vimwiki'},{'path': '~/work/vimwiki'}]
nnoremap <F6> :NERDTreeToggle<CR>

augroup filetype_go
  "This will echo the shell commands executed
  "by the vim-go plugin
  "let g:go_debug=['shell-commands']
  let maplocalleader=" "
  nmap <leader>b <Plug>(go-build)
  nmap <leader>r <Plug>(go-run)
  nmap <leader>t <Plug>(go-test)
  "quick fix window
  nmap <localleader>o :copen<CR>
  nmap <localleader>c :ccl<CR>
  nmap <localleader>n :cnext<CR>
  nmap <localleader>p :cprevious<CR>
augroup END

augroup filetype_clojure
  "https://gist.github.com/cszentkiralyi/a9a4e78dc746e29e0cc8
  nnoremap <Space> <Nop>
  let maplocalleader=" "

  let g:iced_enable_default_key_mappings=v:true
  nmap <localleader>s <Plug>(iced_slurp)
  nmap <localleader>b <Plug>(iced_barf)
  nmap <leader>rr <Plug>(iced_require)
augroup END

"use * in Normal mode, to jump to search word under cursor in the forward direction
"use # in Normal mode, to jump to search word under cursor in the backward direction

