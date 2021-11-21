local utils = require('utils')

-- Unmap space
utils.map('n', '<SPACE>', '', {'noremap': true})

-- Copy to clipboard
utils.map('v', '<leader>y', '"+y', {'noremap': v:true})
utils.map('v', '<leader>y', '"+y', {'noremap': v:true})
utils.map('n', '<leader>Y', '"+yg_', {'noremap': v:true})
utils.map('n', '<leader>y', '"+y', {'noremap': v:true})
utils.map('n', '<leader>yy', '"+yy', {'noremap': v:true})

-- Paste to clipboard
utils.map('n', '<leader>p', '"+p', {'noremap': v:true})
utils.map('n', '<leader>P', '"+P', {'noremap': v:true})
utils.map('v', '<leader>p', '"+p', {'noremap': v:true})
utils.map('v', '<leader>P', '"+P', {'noremap': v:true})

-- Split navigation
utils.map('', '<C-h>', '<C-w>h')
utils.map('', '<C-j>', '<C-w>j')
utils.map('', '<C-k>', '<C-w>k')
utils.map('', '<C-l>', '<C-w>l')
utils.map('' ,'<C-w>z', '<C-w>s')

-- Shortcut to rapidly toggle invisibles
utils.map('n', '<leader>l', ':set list!<CR>')

-- Replace all is aliased to S (uses PCRE).
utils.map('n', '<leader>s', ':%S//g<Left><Left>')

-- Toggle NERDTREE
utils.map('n', '<leader>n', ':NERDTreeToggle<CR>', {'noremap': v:true, 'silent': v:true})
