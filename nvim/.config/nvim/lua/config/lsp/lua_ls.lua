return {
  settings = {
    Lua = {
      runtime = {
        -- Use LuaJIT for Neovim
        version = 'LuaJIT',
      },
      workspace = {
        -- Make the server recognize Neovim runtime files
        library = {
		vim.api.nvim_get_runtime_file("", true),-- Add your custom directories here
		vim.fn.expand("~/.config/nvim/lua"),
        	vim.fn.expand("~/.config/nvim/lua/meta-byte"),
        },
      },
      diagnostics = {
        -- Recognize `vim` as a global variable to avoid warnings
        globals = { "vim" },
      },
      telemetry = {
        enable = false, -- Disable telemetry for privacy
      },
    },
  },
}
