local keymap = vim.api.nvim_set_keymap

return {
  "nvim-neorg/neorg",
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~./notes",
              -- Work specific note locations
              ["cards-notes"] = "~./Desktop/Repositories/rise-pol/apps/cards/charlie-notes",
              ["rec-cards-notes"] = "~./Desktop/Repositories/rise-pol/apps/reconciliation-cards/charlie-notes"
            },
            --default_workspace =  "~./notes"
          }
        }
      },
    })
  end,
  run = ":Neorg sync-parsers",

  keymap("n", "<leader>ni", ":Neorg index<CR>", { desc = "[N]eorg open [I]ndex file" })
}
