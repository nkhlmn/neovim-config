return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		dependencies = {
			{ 'nvim-treesitter/nvim-treesitter-context' },
			{ 'nvim-treesitter/nvim-treesitter-refactor' },
		},
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
				},
				refactor = {
					highlight_definitions = {
						enable = true,
						clear_on_cursor_move = false, -- Set to false if you have an `updatetime` of ~100.
					},
					smart_rename = {
						enable = true,
						keymaps = {
							smart_rename = 'grr',
						},
					},
				},
			})
		end,
	},
}
