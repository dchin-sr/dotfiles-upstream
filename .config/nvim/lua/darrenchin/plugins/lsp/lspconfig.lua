return {
  "neovim/nvim-lspconfig",
--  event = { "BufReadPre", "BufNewFile" },
--  dependencies = {
--    "hrsh7th/cmp-nvim-lsp",
--    { "antosha417/nvim-lsp-file-operations", config = true },
--  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- Configure LSP servers
    lspconfig["ansiblels"].setup({
      settings = {},
      filetypes = { 'yaml.ansible' }
    })
    lspconfig["bashls"].setup({})
    -- lspconfig["cue"].setup({})
    lspconfig["gopls"].setup({})
    lspconfig["helm_ls"].setup({})
    lspconfig["jsonls"].setup({})
    lspconfig["lua_ls"].setup({})
    lspconfig["pyright"].setup({})
    lspconfig["terraformls"].setup({
      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.tf", "*.tfvars"},
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    })
    lspconfig["yamlls"].setup({})

    -- Set up additional keybindings
--    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

  end,
}
