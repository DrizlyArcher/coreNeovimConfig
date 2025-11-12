return {
  'vim-test/vim-test',
  dependencies = {
    "preservim/vimux"
  },
  vim.keymap.set('n', '<leader>rt', ':TestNearest<CR>', { desc = "[R]un nearest [T]est" }),
  vim.keymap.set('n', '<leader>rT', ':TestFile<CR>', { desc = "[R]un [T]est file" }),
  vim.keymap.set('n', '<leader>ra', ':TestSuite<CR>', { desc = "[R]un [A]ll of test suite" }),
  vim.keymap.set('n', '<leader>rl', ':TestLast<CR>', { desc = "[R]un [T]est last" }),
  vim.keymap.set('n', '<leader>rg', ':TestVisit<CR>', { desc = "[R]un test visit" }),
  vim.cmd("let test#strategy = 'vimux'")
}
