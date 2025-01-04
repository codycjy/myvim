return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    -- 原有的键位映射
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },

    -- 添加数字跳转键位
    { "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to Buffer 1" },
    { "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to Buffer 2" },
    { "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to Buffer 3" },
    { "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to Buffer 4" },
    { "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to Buffer 5" },
    { "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to Buffer 6" },
    { "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to Buffer 7" },
    { "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to Buffer 8" },
    { "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to Buffer 9" },
    { "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", desc = "Go to Last Buffer" },
  },
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) Snacks.bufdelete(n) end,
      -- stylua: ignore
      right_mouse_command = function(n) Snacks.bufdelete(n) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true, -- 改为 true 以始终显示 bufferline

      -- 启用序号显示
      numbers = "ordinal",

      -- 添加 groups 配置，支持 pin 功能
      groups = {
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = "󰐃 " }),
        },
      },

      diagnostics_indicator = function(_, _, diag)
        local icons = LazyVim.config.icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,

      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },

      -- 显示图标
      show_buffer_icons = true,
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",

      ---@param opts bufferline.IconFetcherOpts
      get_element_icon = function(opts)
        return LazyVim.config.icons.ft[opts.filetype]
      end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
