local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--Set leader to space
--keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Save file with cmd+s
keymap("n", "<D-s>", ":wa <CR>", opts)

--Use builtin file explorer
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)
--Use Neotree file explorer
keymap("n", "<leader>e", ":Neotree filesystem reveal left toggle <CR>", opts)

--All modes. Ctrl+c escapes edit, triggers lsp format and saves all buffers.
vim.keymap.set("", "<C-c>", function()
  vim.cmd.stopinsert()
  vim.lsp.buf.format()
  vim.cmd.wa()
end, opts)

--Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--Resize split screens with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<M-f>", ":vertical resize +2<CR>", opts) -- Required as ALT+L is interpretted as "jump to next work on the left"
keymap("n", "<M-b>", ":vertical resize -2<CR>", opts) -- Required as ALT+R is interpretted as "jump to next work on the right"

--Stay in indent mode after indenting
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

--Prevent yank->highlight->paste from yanking highlighted word
keymap("v", "p", '"_dP', opts)

--Clear highlight after search
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)
