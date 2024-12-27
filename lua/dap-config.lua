local dap, dapui = require("dap"), require("dapui")
dapui.setup(
  {
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.55
          }, {
            id = "breakpoints",
            size = 0.15
          }, {
            id = "stacks",
            size = 0.15
          }, {
            id = "watches",
            size = 0.25
          } },
        position = "left",
        size = 70
      }, {
        elements = { {
            id = "repl",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
        position = "bottom",
        size = 10
      } },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  })
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

require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port.
    -- if you set a port in your debug configuration, its value will be
    -- assigned dynamically.
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    -- avaliable ui interactive function to prompt for arguments get_arguments
    build_flags = {},
    -- whether the dlv process to be created detached or not. there is
    -- an issue on Windows where this needs to be set to false
    -- otherwise the dlv server creation will fail.
    -- avaliable ui interactive function to prompt for build flags: get_build_flags
    detached = vim.fn.has("win32") == 0,
    -- the current working directory to run dlv from, if other than
    -- the current working directory.
    cwd = nil,
  },
  -- options related to running closest test
  tests = {
    -- enables verbosity when running the test.
    verbose = false,
  },
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
    command = '/Users/saltfish/.config/nvim/tools/codelldb/extension/adapter/codelldb',
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
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
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
