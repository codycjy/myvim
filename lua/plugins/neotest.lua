return {
  {
    "nvim-neotest/neotest",
    lazy = false,
    priority = 1000,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",
      "alfaix/neotest-gtest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-gtest").setup({
          debug_adapter = "codelldb",
          args = { "--no-color" },
          filter_dir = function(name)
            return name ~= "build" and name ~= ".git"
          end,
        })
      )
      
      -- 其他配置
      opts.status = opts.status or {}
      opts.status.virtual_text = true
      
      opts.output = opts.output or {}
      opts.output.open_on_run = true
      
      opts.quickfix = opts.quickfix or {}
      opts.quickfix.open = function()
        if require("lazy.core.config").plugins["trouble.nvim"] ~= nil then
          vim.cmd("Trouble quickfix")
        else
          vim.cmd("copen")
        end
      end
      
      return opts
    end,
  },
}
