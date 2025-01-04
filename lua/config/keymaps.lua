-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Debug keymaps
local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<F6>", function()
  dap.disconnect()
  dap.close()
  dapui.close()
end, { desc = "Close Debug" })
-- 关闭当前 buffer 并切换到前一个 buffer
vim.keymap.set("n", "<leader>q", "<cmd>bp<cr><cmd>bd #<cr>", { desc = "Close current buffer" })
