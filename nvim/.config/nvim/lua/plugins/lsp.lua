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
        "ts_ls",   -- JavaScript/TypeScript
        "pyright",    -- Python
        "jsonls",     -- JSON
        "eslint",     -- Optional: Linter for JavaScript/TypeScript
        "lua_ls",     -- Lua (note: renamed from sumneko_lua to lua_ls)
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
    
    -- Set up handlers - using the local variable, not requiring the module again
    mason_lspconfig.setup_handlers({
      function(server_name) -- Default setup for all servers
        local opts = get_server_config(server_name)
        lspconfig[server_name].setup(opts)
      end,
    })
  end,
}
