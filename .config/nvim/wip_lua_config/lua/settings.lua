local utils = require('utils')

local cmd = vim.cmd
local indent = 3

 -- Display line number and relative line numbers
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
-- Disable word wrapping
utils.opt('b', 'tw', 0)
-- Tab settings
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'shiftwidth', indent)
-- More natural split pane postioning
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
-- Disable search highlighting
utils.opt('o', 'hlsearch', false)
-- Min number of lines above/below cursor
utils.opt('o', 'scrolloff', 4)
-- Round indent to multiple of shiftwidth
utils.opt('o', 'shiftround', true)
-- Enable command prompt autocomplete
 utils.opt('o', 'wildmode', 'longest,list,full')
utils.opt('o', 'wildmenu', true)
-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
-- Use sh as shell
utils.opt('o', 'shell', 'sh')
-- Use the same symbols as TextMate for tabstops and EOLs
--utils.opt('o', 'listchars', 'tab:▸,eol:¬')

cmd([[
" Color scheme
if (has("termguicolors"))
	set termguicolors
endif
syntax on
color dracula
hi Normal guibg=None ctermbg=None


" Detect i3 config file for syntax highlighting
aug i3config_ft_detection
	au!
	au BufNewFile,BufRead ~/.config/regolith/i3/config set filetype=i3config
aug end

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])
