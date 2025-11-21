require("core.keymaps")
require("core.options")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  -- Pull in abstracted plugin lua files
  require("plugins.colourscheme"),
  require("plugins.neotree"),
  require("plugins.lualine"),
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.gitsigns"),
  require("plugins.which-key"),
  require("plugins.lsp"),
  require("plugins.none-ls"),
  require("plugins.completions"),
  require("plugins.auto-pairs"),
  require("plugins.nvim-ufo"),
  require("plugins.visual-multi"),
  --require("plugins.copilot"),
  require("plugins.glow-markdown"),
  require("plugins.autotag"),
  require("plugins.vim-surround"),
  require("plugins.neorg"),
  require("plugins.tiny-inline-diagnostic"),
  require("plugins.vim-tmux-navigator"),
  require("plugins.vim-test"),
  require("plugins.blink-indent"),
  require("plugins.vim-dadbod")
})
