local M = {}

---Get attached lsp server names
function M.get_attached_lsp_servers()
	local attached_servers = vim.lsp.get_clients()
	local server_names = {}

	for _, value in pairs(attached_servers) do
		table.insert(server_names, value.name)
	end

	return table.concat(server_names, ' | ')
end

---Toggle whitespace
function M.toggle_whitespace()
	vim.o.list = not vim.o.list
end

---Toggle diff
function M.toggle_diff()
	local action = (vim.o.diff == true and 'off' or 'this')
	vim.cmd('windo diff' .. action)
end

---Toggle diagnostics
function M.toggle_diagnostics()
	if vim.diagnostic.is_enabled() then
		vim.notify('Disable diagnostics', vim.log.levels.INFO)
		vim.diagnostic.enable(false)
	else
		vim.notify('Enable diagnostics', vim.log.levels.INFO)
		vim.diagnostic.enable()
	end
end

---Toggle inlay hints
function M.toggle_inlay_hints()
	local is_enabled = vim.lsp.inlay_hint.is_enabled({})
	vim.lsp.inlay_hint.enable(not is_enabled)
end

---Open telescope find_files with hidden enabled
function M.open_telescope_find_files_with_hidden()
	require('telescope.builtin').find_files({ no_ignore = true, hidden = true })
end

---Rebuild dune projects
local function is_dune_project()
	local cwd = vim.uv.cwd()
	if cwd == nil then
		return false
	end

	local items = vim.fs.dir(cwd)
	return vim.iter(items):any(function(name, type)
		return type == 'file' and (name == 'dune-project' or name == 'dune-workspace')
	end)
end

function M.dune_rebuild()
	if not is_dune_project() then
		return
	end

	local on_event = function(_, data, event)
		if event == 'stdout' then
			vim.notify('dune build called\n' .. table.concat(data, '\n'), vim.log.levels.INFO)
		elseif event == 'stderr' then
			vim.notify(table.concat(data, '\n'), vim.log.levels.ERROR)
		else
			vim.cmd('LspRestart')
		end
	end

	vim.fn.jobstart('dune build @check', {
		stderr_buffered = true,
		stdout_buffered = true,
		on_stderr = on_event,
		on_stdout = on_event,
		on_exit = on_event,
	})
end

return M
