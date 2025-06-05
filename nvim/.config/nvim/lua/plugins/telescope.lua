return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
  config = function()
    require("telescope").setup()
    local TelescopeKeymaps = require("keymaps.telescope")
    TelescopeKeymaps.setup()
  end
}