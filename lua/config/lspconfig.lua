local vim = vim

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- local function setup_servers()
--   local lspinstall = require('lspinstall')
--   lspinstall.setup()
--   local installed_servers = lspinstall.installed_servers()
--   for _, server in pairs(installed_servers) do
--     require'lspconfig'[server].setup{
--       on_attach = on_attach,
--       capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     }
--   end
-- end

-- setup_servers()

local lsp_installer = require("nvim-lsp-installer")
local capabilities = require('cmp_nvim_lsp').update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
	local opts = { 
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- (optional) Customize the options passed to the server
	-- if server.name == "tsserver" then
	--     opts.root_dir = function() ... end
	-- end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

-- Setup rust-tools
require('rust-tools').setup({})
