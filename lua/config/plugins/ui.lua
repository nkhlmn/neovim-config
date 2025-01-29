return {
	{ 'stevearc/dressing.nvim' },

	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
				globalstatus = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { { 'filename', path = 3 } },
				lualine_x = { vim.uv.cwd, 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
		},
	},

	{ 'akinsho/bufferline.nvim', version = '*', config = true },

	{
		'b0o/incline.nvim',
		config = true,
		event = 'VeryLazy',
	},
}
