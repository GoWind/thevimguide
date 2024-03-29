"do not care about Vi compatibility
set nocompatible
set ts=4
set sts=2
set shiftwidth=2
set expandtab
set fileencodings=utf-8,gb18030,ucs-bom,cp936
"fuck saving .swp files. very annoying
set nobackup

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
"Plug 'Quramy/tsuquyomi'

"Plugin for working nicely with fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"When opening a file, figures out the "root" of the file's project
"Useful as Rg, fzf etc will search recursively till root of file system
"at times and we need to stop at a certain ancestor (eg: .git, package.json,
"Makefile etc)
Plug 'airblade/vim-rooter'
"surround for quoting and enclosing stuff with braces
Plug 'tpope/vim-surround'

"Zig lang
Plug 'ziglang/zig.vim'
"Zig plugin ^ auto runs `zig fmt` on the file via the 
"Zig exe. We will do all of that via `coc-zig` instead
"Use the zig plugin only for syntax highlighting
let g:zig_fmt_autosave = 0

"CocList hides my cursor . show it using
let g:coc_disable_transparent_cursor=1
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Show open buffers in a line above the status line
Plug 'bling/vim-bufferline'

"Clojure related plugins
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'guns/vim-sexp',    {'for': 'clojure'}


call plug#end()

" Enable vim-iced's default key mapping
" This is recommended for newbies
let g:iced_enable_default_key_mappings = v:true


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
nmap <C-=> <C-W>=
nmap <C-\> <C-W><BAR>

"uncommment below to have NERDTree open when you start the editor
"but it is too noisy
"autocmd VimEnter * NERDTree

nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F3> :set nu!<CR>

"TODO: Need a better of this
nnoremap <C-a> :Lexplore!<CR>

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

silent! autocmd BufWritePre *.zig call CocAction('format')
"coc diagnostics loads list of erros in the location list
"we setup shortcuts to the location list to manipulate it easily
"set shortcuts to manipulate the location list
nmap <leader>lo :lopen<CR>
nmap <leader>lc :lclose<CR>
nmap <leader>ln :lnext<CR>
nmap <leader>lp :lprevious<CR>

augroup AutoDeleteNetrwHiddenBuffers
  au!
  au FileType netrw setlocal bufhidden=wipe
augroup end


"use * in Normal mode, to jump to search word under cursor in the forward direction
"use # in Normal mode, to jump to search word under cursor in the backward direction

"to load configuration from the current file, use `:so %`
"doing so while editing ~/.vimrc will cause Vim to reload your
"configuration
let g:coc_disable_startup_warning = 1
let g:rooter_patterns = [".git", "Makefile", "build.zig", "package.json"]
let g:fzf_preview_window = ['up:40%', 'ctrl-/']

nmap <leader><tab> <plug>(fzf-maps-n)
nmap <leader>gd <plug>(coc-declaration)
nmap <leader>gg <plug>(coc-implementation)


"remap Ctrl-E to scroll down in insert mode
inoremap <C-E> <C-X><C-E>
"remap Ctrl-U to scroll up in insert mode 
inoremap <C-U> <C-X><C-Y>

"Copy the content's of the system's clipboard (Ctrl+C) 
"to the unnamed register (so that you can Ctrl-C in another app and simply
"do `p` in normal mode copy the contents into the file.
"Note: For this , vim needs to be built with the `+clipboard` option (needs
"X11 on Linux)
set clipboard=unnamed

"Map leader f to fzf starting from home directory
nnoremap <leader>f :FZF ~<CR>

"Create folds by understanding the syntax of the file
set foldmethod=syntax
"when foldmethod is syntax, all files when opened, have folds
"automatically created. Disable this by setting nofoldenable
set nofoldenable

"When on a symbol, highlight it and its references
autocmd CursorHold * silent call CocActionAsync('highlight')


"
"<C-u> in command line mode wipes all characters from cursor to beginning of line
"Why is this needed ? 
"When pressing `:` to invoke command mode from normal mode, a lot of
"keypresses or commands emit a range, thus fucking up the command you want to
"execute. Example, when you have a visual selection and then press `:` the `:`
"is followed by a range. The `:<C-u> wipes all this range in front of the
"command
nnoremap <silent> <leader>d :<C-u> CocDiagnostics<CR>
