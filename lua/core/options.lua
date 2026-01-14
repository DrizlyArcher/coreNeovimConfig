--vim.opt.expandtab = true --Apparently converts tabs to spaces
--vim.opt.tabstop = 2 --Set tab to 2 spaces
--vim.opt.cursorlineopt = "screenline" --Current line highlighting visuals

local options = {
  --    smarttab = true, --Smort tabs
  --    softtabstop = 4, --Combination of this and 'shiftwidth' sorts tab indentation
  --    shiftwidth = 4,
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  cursorline = true,         --Enable current line highlighting
  number = true,             --Enable line numbers
  relativenumber = true,     --Enable relative line numbers
  clipboard = "unnamedplus", --Sync vim clipboard with systems
  showmode = false,          --Doesn't show the mode in the bottom, this is taken care of with lualine
  --breakindent = true,
  scrolloff = 999,           -- Minimum number of screen lines to keep above and below the cursor.
  splitbelow = true,
  splitright = true,
  spell = true,
  -- spelllang = "en_GB"     --Apparently this isn't supported for adding exceptions
}

-- Loop over options table
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable spellcheck within quickfix windows
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.spell = false
  end
})
