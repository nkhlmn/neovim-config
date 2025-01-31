return {
	{ 'windwp/nvim-autopairs', config = true },

	{ 'kylechui/nvim-surround', config = true },

	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
				javascript = { 'biome', 'prettierd', stop_after_first = true },
				markdown = { 'mdformat' },
			},
			default_format_opts = {
				lsp_format = 'fallback',
			},
		},
	},

	{ 'tpope/vim-repeat' },

	{ 'tpope/vim-unimpaired' },

	{ 'danymat/neogen', dependencies = 'nvim-treesitter/nvim-treesitter', config = true },
}
