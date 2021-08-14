if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data').'/plugged')

Plug 'dracula/vim'

" Dependancy for ranger
Plug 'rbgrouleff/bclose.vim'

" Allows use of ranger as file manager
Plug 'francoiscabrol/ranger.vim'

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'

Plug 'ryanoasis/vim-devicons'

Plug 'tmhedberg/SimpylFold'

Plug 'jiangmiao/auto-pairs'

Plug 'dag/vim-fish'

Plug 'sedm0784/vim-resize-mode'

Plug 'othree/eregex.vim'

Plug 'justinmk/vim-sneak'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-compe'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'kabouzeid/nvim-lspinstall'

Plug 'puremourning/vimspector'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'tami5/sql.nvim'

Plug 'ahmedkhalf/lsp-rooter.nvim'

call plug#end()
" :PlugInstall
" :PlugUpdate

if &shell =~# 'fish$'
	set shell=sh
endif

if (has("termguicolors"))
	set termguicolors
endif
syntax on
color dracula
hi Normal guibg=NONE ctermbg=NONE

" Display line number and relative line numbers
set number
set relativenumber

" Disable word wrapping
set tw=0

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

" spell languages
set spelllang=en_ca

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

map <C-w>z <C-w>s

" Shortcut to rapidly toggle invisibles
nmap <leader>l :set list!<CR>

" Replace all is aliased to S (uses PCRE).
nnoremap <leader>s :%S//g<Left><Left>
vnoremap <leader>s :%S//g<Left><Left>
vnoremap / :<BS><BS><BS><BS><BS>M/

" Save file as sudo on files that require root permission
" This doesn't work yet
" cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

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
map <leader>R :RangerNewTab<CR>
autocmd TermOpen term://*:ranger* setlocal nonumber norelativenumber signcolumn=no

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
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
au BufNewFile,BufRead *.py set encoding=utf-8

" Full stack indentation
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2

" Wrap if text file
au BufNewFile,BufRead *.txt set wrap linebreak

" Unmap command history
nnoremap q: <NOP>
nnoremap q/ <NOP>

" F5 to run Python script
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" rust specific
autocmd FileType rust nmap <F5> :make run<CR>
autocmd FileType rust nmap <F4> :make build<CR>
autocmd FileType rust nmap <F6> :make test<CR>

" Set up :make to use fish for syntax checking.
autocmd filetype fish compiler fish

" Set this to have long lines wrap inside comments.
autocmd filetype fish setlocal textwidth=79

" Enable folding of block structures in fish.
autocmd filetype fish setlocal foldmethod=expr

" Enable fish syntax checker
let g:syntastic_fish_checkers = ['fish']

let g:airline_symbols_ascii = 1

lua << EOF
local nvim_lsp = require('lspconfig')
	local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap("n", '<leader>o', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- for nvim-lspinstall
local function setup_servers()
	require'lspinstall'.setup()
	local servers = require'lspinstall'.installed_servers()
	for _, server in pairs(servers) do
		require'lspconfig'[server].setup{ on_attach = on_attach }
	end
end
setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


-- Automagically cd to project directory using nvim lsp
require("lsp-rooter").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	}

-- CCLS was manually installed
-- nvim-lspinstall install clangd for C/C++
-- clangd has problems finding standard libraries
-- CCLS is used instead
-- Needs to be configured manually since not installed with nvim-lspinstall
local lspconfig = require'lspconfig'
lspconfig.ccls.setup {
	init_options = {
		index = {
			threads = 0;
		};
		clang = {
			excludeArgs = { "-frounding-math"} ;
		};
	};
	on_attach = on_attach;
}

EOF

set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch

nmap <Leader>A :mksession! ~/.neovim/.session/
nmap <Leader>L :source ~/.neovim/.session/
nmap <Leader>H :lua require('telescope').extensions.frecency.frecency()<CR>
