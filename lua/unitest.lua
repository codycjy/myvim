vim.cmd [[
  let g:ultest_virtual_text = 1
  let g:ultest_pass_sign = ""
  let g:ultest_fail_sign = ""
  let g:ultest_running_sign = ""
  let g:ultest_not_run_sign = "?"
  let g:ultest_max_threads = 12
  let g:ultest_output_on_line = 0
  let g:ultest_use_pty = 1
]]


require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-timeout=60s" }
    })
  }
})


vim.api.nvim_set_keymap('n', '<leader>ts', ':lua require("neotest").summary.toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>lua require("neotest").run.run()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ta', '<cmd>lua require("neotest").run.run({suite = true})<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tx', '<cmd>lua require("neotest").run.stop()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>td', '<cmd>lua require("neotest").run.attach()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>rd', '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', { noremap = true, silent = true })

-- nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
-- nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>





