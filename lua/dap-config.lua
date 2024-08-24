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

require('telescope').setup()
require('telescope').load_extension('dap')
require("nvim-dap-virtual-text").setup()

map('n', '<F5>', '<Cmd>lua require\'dap\'.continue()<CR>', opts)
map("n", "<F6>", "<cmd>lua require'dap'.disconnect() <CR><cmd>lua require'dap'.close() <CR><cmd>lua require 'dapui'.close()<cr>", opts)
map('n', '<F10>', '<Cmd>lua require\'dap\'.step_over()<CR>', opts)
map('n', '<F11>', '<Cmd>lua require\'dap\'.step_into()<CR>', opts)
map('n', '<F12>', '<Cmd>lua require\'dap\'.step_out()<CR>', opts)
map('n', '<F9>', '<Cmd>lua require\'dap\'.toggle_breakpoint()<CR>', opts)
map('n', '<Leader>B', '<Cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', opts)
map('n', '<Leader>lp', '<Cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>', opts)
map('n', '<Leader>dr', '<Cmd>lua require\'dap\'.repl.open()<CR>', opts)
map('n', '<Leader>dl', '<Cmd>lua require\'dap\'.run_last()<CR>', opts)
map('n', '<Leader>rd', '<Cmd>lua require("dap-go").debug_test()<CR>', opts)

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

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  -- {
  --   type = "delve",
  --   name = "Debug test", -- configuration for debugging test files
  --   request = "launch",
  --   mode = "test",
  --   program = "${file}"
  -- },
  -- -- works with go.mod packages and sub packages 
  -- {
  --   type = "delve",
  --   name = "Debug test (go.mod)",
  --   request = "launch",
  --   mode = "test",
  --   program = "./${relativeFileDirname}"
  -- } 
}
-- Python Debugger
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'


-- C/C++ Debugger
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/saltfish/.config/nvim/tools/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/saltfish/.config/nvim/tools/codelldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}
-- cpp config
-- WARN: IF ANY WRONG WITH DEBUG, ENSURE YOU COMPILE WITH -g FLAG
-- local dap = require('dap')
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

-- cpp config
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "gdb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = "${workspaceFolder}",
--     stopAtBeginningOfMainSubprogram = false,
--   },
--   {
--     name = "Select and attach to process",
--     type = "gdb",
--     request = "attach",
--     program = function()
--        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     pid = function()
--        local name = vim.fn.input('Executable name (filter): ')
--        return require("dap.utils").pick_process({ filter = name })
--     end,
--     cwd = '${workspaceFolder}'
--   },
--   {
--     name = 'Attach to gdbserver :1234',
--     type = 'gdb',
--     request = 'attach',
--     target = 'localhost:1234',
--     program = function()
--        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}'
--   },
-- }
-- local dap = require('dap')
