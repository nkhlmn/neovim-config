local vim = vim

local on_attach = function(client, bufnr)
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

  -- Enable winbar breadcrumbs if supported
  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
end

require('mason').setup()
require('mason-lspconfig').setup()

local default_opts = {
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

local installed_servers = require('mason-lspconfig').get_installed_servers()
for _, server in pairs(installed_servers) do
  -- add server-specific config
  if server == 'lua_ls' then
    default_opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    }
  end

  -- default setup for all servers
  require('lspconfig')[server].setup(default_opts)
end

require('rust-tools').setup({ server = default_opts })
