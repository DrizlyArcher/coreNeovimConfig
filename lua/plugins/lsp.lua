return {
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "ts_ls" },
      automatic_installaion = true,
      handlers = {
        function(server)
          local lspconfig = require("lspconfig")
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          lspconfig[server].setup({
            capabilities = capabilities,
          })
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
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
