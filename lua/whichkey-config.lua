local wk = require("which-key")

wk.setup {
  -- 这里可以放置全局配置
}

wk.register({
  t = {
    name = "+test",
    -- 在这里添加你的测试相关的键绑定
  },
}, { prefix = "<leader>" })

