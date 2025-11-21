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
              -- I am disabling these for now in favour of a centralised note location "~./notes", I think this has made the whole thing too complicated.
              --["cards-notes"] = "~./Desktop/Repositories/rise-pol/apps/cards/charlie-notes",
              --["rec-cards-notes"] = "~./Desktop/Repositories/rise-pol/apps/reconciliation-cards/charlie-notes",
              --["payment-sessions-notes"] = "~./Desktop/Repositories/rise-pol/apps/payment-sessions/charlie-notes",
              --["general-repo-notes"] = "~./Desktop/Repositories/rise-pol/apps/charlie-notes-general"
            },
            default_workspace = "notes",
            open_last_workspace = true,
            use_popup = true
          }
        }
      },
    })
  end,
  run = ":Neorg sync-parsers",

  keymap("n", "<leader>ni", ":Neorg index<CR>", { desc = "[N]eorg open [I]ndex file" }),
  keymap("n", "<leader>nd", ":Neorg journal custom<CR>", { desc = "[N]eorg open Journal by [D]ate" })
}
