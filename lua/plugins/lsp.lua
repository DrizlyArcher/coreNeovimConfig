return {
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- ensure_installed = { "lua_ls" , "ts_ls"},
      automatic_installaion = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      --Need this line to setup the lsp
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostics" })
      vim.keymap.set("n", "<leader>gsd", function()
        vim.cmd("split")
        vim.lsp.buf.definition()
      end, { desc = "[G]o to [D]efinition in a horizontal split" })
      vim.keymap.set("n", "<leader>gvd", function()
        vim.cmd("vertical split")
        vim.lsp.buf.definition()
      end, { desc = "[G]o to [D]efinition in a vertical split" })
    end,
  },
}
