function ColorMySheed(color)
	color = color or 'gruvbox-material'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NomralFloat', { bg = 'none' })

end

ColorMySheed()

