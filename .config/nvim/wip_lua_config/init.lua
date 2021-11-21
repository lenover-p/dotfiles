-- vim.Map leader to space
vim.g.mapleader = "\\<Space>"

local fn = vim.fn
local execute = vim.api.nvim_command
local cmd = vim.cmd

-- Sensible defaults
require('settings')

-- Key mappings
require('keymappings')

-- Auto install vim-plug if it does not exist
local install_path = '~/.local/share/nvim/site/autoload/plug.vim'
if fn.empty(fn.glob(install_path)) > 0 then
	local github_link = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	execute('silent !curl -fLo'..install_path..' --create-dirs '..github_link)
	execute('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

cmd([[
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

Plug 'vimwiki/vimwiki'

Plug 'tmhedberg/SimpylFold'

Plug 'vim-scripts/indentpython.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'dag/vim-fish'

Plug 'sedm0784/vim-resize-mode'

Plug 'rust-lang/rust.vim'

Plug 'othree/eregex.vim'

Plug 'justinmk/vim-sneak'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-compe'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
]])
