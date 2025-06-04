return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim"
  },
  config = function()
    -- First, set up mason
    require("mason").setup()

    -- Then set up mason-lspconfig with your servers
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- "omnisharp",  -- C#
        "gopls",      -- Go
        "ts_ls",   -- JavaScript/TypeScript (use tsserver instead of ts_ls)
        "pyright",    -- Python
        "jsonls",     -- JSON
        "eslint",     -- Optional: Linter for JavaScript/TypeScript
        "lua_ls",     -- Lua (note: renamed from sumneko_lua to lua_ls)
      },
      -- Handler functions for each server
      handlers = {
        gopls = function()
          local opts = require("config.lsp.gopls") or {}
          require("lspconfig").gopls.setup(opts)
        end,
        ts_ls = function()
          local opts = require("config.lsp.ts_ls") or {}
          require("lspconfig").ts_ls.setup(opts)
        end,
        pyright = function()
          local opts = require("config.lsp.pyright") or {}
          require("lspconfig").pyright.setup(opts)
        end,
        jsonls = function()
          local opts = require("config.lsp.jsonls") or {}
          require("lspconfig").jsonls.setup(opts)
        end,
        eslint = function()
          local opts = require("config.lsp.eslint") or {}
          require("lspconfig").eslint.setup(opts)
        end,
        lua_ls = function()
          local opts = require("config.lsp.lua_ls") or {}
          require("lspconfig").lua_ls.setup(opts)
        end,
      },
    })
    -- Define local variables
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- Load custom LSP configurations
    local function get_server_config(server_name)
      local ok, server_config = pcall(require, "config.lsp." .. server_name)
      if ok then
        return server_config
      else
        return {}
      end
    end
  end,
}