vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
-- vim.keymap.set('n', '<C-s>', vim.cmd.w) -- shame

-- Exit terminal mode with esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })

vim.keymap.set('n', '<leader>t', ':belowright split | resize 8<CR>:terminal<CR>', { silent = true })

