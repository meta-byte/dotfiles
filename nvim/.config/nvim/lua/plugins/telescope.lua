return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    config = function()
      --This might be a legacy way of doing this
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local TelescopeKeymaps = require("keymaps.telescope")
      TelescopeKeymaps.setup()
      require("telescope").load_extension("ui-select")
    end
  }
}