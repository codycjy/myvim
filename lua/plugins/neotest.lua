return {
  {
    "nvim-neotest/neotest",
    lazy = false,
    priority = 1000,
    dependencies = {
      "alfaix/neotest-gtest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-gtest").setup({
          debug_adapter = "codelldb",
        })
      )
    end,
  },
}
