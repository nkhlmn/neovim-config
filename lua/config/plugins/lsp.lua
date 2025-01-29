local on_attach = function (client, _)
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
end

local init = function ()
  require('mason').setup()
  require('mason-lspconfig').setup()

  local default_opts = {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }

  local installed_servers = require('mason-lspconfig').get_installed_servers()
  for _, server in pairs(installed_servers) do
    -- default setup for all servers
    require('lspconfig')[server].setup(default_opts)
  end

  -- ocamllsp shouldn't be installed with mason so init it here
  require('lspconfig')['ocamllsp'].setup(default_opts)
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', build = ':MasonUpdate' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = init
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
