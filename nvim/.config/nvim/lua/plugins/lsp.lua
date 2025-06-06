return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
        -- "omnisharp",   -- C#
        "gopls",          -- Go
        "ts_ls",          -- JavaScript/TypeScript (use tsserver instead of ts_ls)
        "pyright",        -- Python
        "jsonls",         -- JSON
        "eslint",         -- Linter for JavaScript/TypeScript
        "lua_ls",         -- Lua (note: renamed from sumneko_lua to lua_ls)
      },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.pyright.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}