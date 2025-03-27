local on_attach = function(client, buf)
	-- setup keymappings
	local keymaps = require('config.keymaps').lsp_keymaps
	local default_keymap_opts = { noremap = true, silent = true, buffer = true }
	local default_keymaps = keymaps.defaults
	for _, val in pairs(default_keymaps) do
		vim.keymap.set(val[1], val[2], val[3], val[4] or default_keymap_opts)
	end

	local lsp_keymaps = keymaps[client.name]
	if lsp_keymaps ~= nil then
		for _, val in pairs(lsp_keymaps) do
			vim.keymap.set(val[1], val[2], val[3], val[4] or default_keymap_opts)
		end
	end

	-- client specific handling
	if client.name == 'sqls' then
		require('sqls').on_attach(client, buf)
	end
end

local init = function()
	local default_opts = {
		on_attach = on_attach,
		capabilities = require('blink.cmp').get_lsp_capabilities(),
	}

  -- setup lsp's installed with Mason
	require('mason').setup()
	require('mason-lspconfig').setup()
	require('mason-lspconfig').setup_handlers({
		function(server_name)
			require('lspconfig')[server_name].setup(default_opts)
		end,
	})

	-- setup lsp's NOT installed with Mason
	require('lspconfig')['ocamllsp'].setup(default_opts)
end

return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', build = ':MasonUpdate' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'saghen/blink.cmp' },
		},
		config = init,
	},

	{
		'folke/lazydev.nvim',
		ft = 'lua', -- only load on lua files
		opts = {
			library = {
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } }, -- Load luvit types when the `vim.uv` word is found
			},
		},
	},
}
