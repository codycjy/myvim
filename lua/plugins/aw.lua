return {
  "ActivityWatch/aw-watcher-vim",
  event = "VimEnter", -- 改用 VimEnter 而不是 VeryLazy
  config = function()
    -- 基础配置
    vim.g.aw_apiurl_host = "127.0.0.1"
    vim.g.aw_apiurl_port = 5600
    vim.g.aw_api_timeout = 2.0

    -- 使用 VimEnter 自动命令确保在 Vim 完全启动后运行
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.defer_fn(function()
          vim.cmd("AWStart")
          -- 可选：添加启动通知
          vim.notify("ActivityWatch started", vim.log.levels.INFO)
        end, 1000) -- 延迟 1 秒执行
      end,
      group = vim.api.nvim_create_augroup("ActivityWatchStart", { clear = true }),
    })
  end,
  keys = {
    { "<leader>aws", "<cmd>AWStart<cr>", desc = "Start AW tracking" },
    { "<leader>awx", "<cmd>AWStop<cr>", desc = "Stop AW tracking" },
    { "<leader>awc", "<cmd>AWStatus<cr>", desc = "Check AW status" },
  },
}
