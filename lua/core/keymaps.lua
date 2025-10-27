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

--Re-map 'Esc' to ctrl+c to trigger LSP update and save all buffers, after editing
keymap("i", "<C-c>", "<esc><cmd>wa<CR>", opts)
keymap("n", "<C-c>", "<cmd>wa<CR>", opts) -- Handle if already exited input mode

--Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--Resize split screens with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

--Stay in indent mode after indenting
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

--Move selected text as a group (vscode)
keymap("n", "<a-j>", ":m .+1<CR>==", opts)
keymap("n", "<a-k>", ":m .-2<CR>==", opts)
keymap("v", "<a-j>", ":m '>+1<CR>==gv=gv", opts)
keymap("v", "<a-k>", ":m '<-2<CR>==gv=gv", opts)

--Prevent yank->highlight->paste from yanking highlighted word
keymap("v", "p", '"_dP', opts)

--Clear highlight after search
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)
