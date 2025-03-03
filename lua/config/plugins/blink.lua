return {
	{
		'saghen/blink.cmp',
		dependencies = 'rafamadriz/friendly-snippets',
		version = '*',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
				list = {
					selection = {
						preselect = false,
					},
				},
			},
			appearance = {
				use_nvim_cmp_as_default = true,
			},
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
				providers = {
					lazydev = {
						name = 'LazyDev',
						module = 'lazydev.integrations.blink',
						score_offset = 100, -- make lazydev completions top priority (see `:h blink.cmp`)
					},
				},
			},
			signature = { enabled = true },
		},

		opts_extend = { 'sources.default' },
	},
}
