return {
  -- Add gtest adapter
  { "alfaix/neotest-gtest" },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",
    },
    opts = {
      -- Add gtest to adapters list
      adapters = {
        ["neotest-gtest"] = {
          -- Optional custom configuration for gtest
          args = { "--no-color" }, -- Arguments for test execution
          filter_dir = function(name)
            -- Optional: filter directories where tests are discovered
            return name ~= "build" and name ~= ".git"
          end,
        },
      },
      -- Rest of the default neotest configuration
      status = {
        virtual_text = true,
      },
      output = {
        open_on_run = true,
      },
      quickfix = {
        open = function()
          if require("lazy.core.config").plugins["trouble.nvim"] ~= nil then
            vim.cmd("Trouble quickfix")
          else
            vim.cmd("copen")
          end
        end,
      },
    },
  },
}
