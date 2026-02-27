return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  ft = "python", -- optional: lazy load on python files
  config = function()
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
  end,
}
