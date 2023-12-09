local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<F5>', '<Cmd>lua require\'dap\'.continue()<CR>', opts)
map('n', '<F10>', '<Cmd>lua require\'dap\'.step_over()<CR>', opts)
map('n', '<F11>', '<Cmd>lua require\'dap\'.step_into()<CR>', opts)
map('n', '<F12>', '<Cmd>lua require\'dap\'.step_out()<CR>', opts)
map('n', '<F9>', '<Cmd>lua require\'dap\'.toggle_breakpoint()<CR>', opts)
map('n', '<Leader>B', '<Cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', opts)
map('n', '<Leader>lp', '<Cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>', opts)
map('n', '<Leader>dr', '<Cmd>lua require\'dap\'.repl.open()<CR>', opts)
map('n', '<Leader>dl', '<Cmd>lua require\'dap\'.run_last()<CR>', opts)

local dap_breakpoint = {
	error = {
		text = "",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	},
	rejected = {
		text = "",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "⭐️",
		texthl = "LspDiagnosticsSignInformation",
		linehl = "DiagnosticUnderlineInfo",
		numhl = "LspDiagnosticsSignInformation",
	},
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

-- Go Debugger
dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/.config/nvim/tools/vscode-go/dist/debugAdapter.js'};
}
dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = "${file}";
    dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
  },
}

-- Python Debugger
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

