-- automatically closes HTML tags, useful for UI work
return {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
