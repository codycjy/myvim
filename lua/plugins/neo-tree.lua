-- lua/plugins/neo-tree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      follow_current_file = true,
      use_libuv_file_watcher = true,
      -- 强制使用当前目录作为根
      never_show_by_pattern = { ".git" },
      -- 禁用通过 .git 寻找项目根目录
      find_by_full_path_words = true,
      group_empty_dirs = true,
    },
  },
}
