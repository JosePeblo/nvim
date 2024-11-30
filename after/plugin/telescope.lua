local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope project find' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git file search' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input('grep: ') });

end)
