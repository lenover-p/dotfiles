if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data').'/plugged')

call plug#begin(stdpath('data').'/plugged')

Plug 'dracula/vim'

" Dependancy for ranger
Plug 'rbgrouleff/bclose.vim'

" Allows use of ranger as file manager
Plug 'francoiscabrol/ranger.vim'

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'

Plug 'ryanoasis/vim-devicons'

Plug 'mboughaba/i3config.vim'

Plug 'junegunn/goyo.vim'

Plug 'vimwiki/vimwiki'

Plug 'tmhedberg/SimpylFold'

Plug 'vim-scripts/indentpython.vim'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

Plug 'vim-syntastic/syntastic'

Plug 'jiangmiao/auto-pairs'

call plug#end()

if (has("termguicolors"))
	set termguicolors
endif
syntax on
color dracula
hi Normal guibg=NONE ctermbg=NONE

" Display line number and relative line numbers
set number
set relativenumber

" Tab settings
set tabstop=3
set shiftwidth=3
" set expandtab

" More natural split pane postioning
set splitbelow
set splitright

" Disable search highlighting
set nohlsearch

" Enable command prompt autocomplete
set wildmode=longest,list,full
set wildmenu

" Detect i3 config file for syntax highlighting
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/regolith/i3/config set filetype=i3config
aug end

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" Paste to clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut to rapidly toggle invisibles
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Toggle Goyo
map <leader>g :Goyo<CR>

" Use ranger instead of NERDTree
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

" Display hidden files by default in Ranger
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTREE
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" Toggle Ranger
let g:ranger_map_keys=0
map <leader>r :Ranger<CR>

" Persisent undo
set undofile

" Set directories
set directory=$HOME/.neovim/.swp
set backupdir=$HOME/.neovim/.swp
set undodir=$HOME/.neovim/.undo

" Prerequisites for VimWiki
set nocompatible " Pretty sure this is already set by default
filetype plugin on

" Code folding
set foldmethod=indent
set foldlevel=99
nnoremap <leader>f za

" PEP 8 indentation
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=49
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
au BufNewFile,BufRead *.py set encoding=utf-8

" Full stack indentation
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Syntastic defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Unmap command history
nnoremap q: <NOP>

" F5 to run Python script
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
