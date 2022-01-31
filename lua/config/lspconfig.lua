local vim = vim

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<Cmd>Neoformat<CR>', opts)
end

local lsp_installer = require("nvim-lsp-installer")
local capabilities = require('cmp_nvim_lsp').update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server.name == "rust_analyzer" then
		require('rust-tools').setup({
			tools = {
				inlay_hints = { highlight = "DiagnosticSignHint" },
			},
			server = {
				on_attach = on_attach,
			},
		})
		return
	elseif server.name == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				}
			}
		}
	end

	server:setup(opts) -- This is the same as lspconfig's setup function.
end)
