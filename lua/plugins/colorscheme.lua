return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- 定义主题列表
        local themes = { "everforest", "nord", "poimandres" }
        -- 使用随机数种子
        math.randomseed(os.time())
        -- 随机选择主题
        local theme = themes[math.random(#themes)]

        -- everforest 特定配置
        if theme == "everforest" then
          vim.g.everforest_background = "soft"
          vim.g.everforest_better_performance = 1
        end

        -- nord 特定配置（可选）
        if theme == "nord" then
          vim.g.nord_contrast = true
          vim.g.nord_borders = false
        end

        -- 应用选中的主题
        vim.cmd.colorscheme(theme)
        print("Current theme: " .. theme) -- 显示当前使用的主题
      end,
    },
  },
}
