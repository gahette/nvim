return {
  "supermaven-inc/supermaven-nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = { cpp = true }, -- ou { "cpp" }
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
      log_level = "info", -- "off" pour désactiver complètement
      disable_inline_completion = false, -- désactive l'inline completion si utilisé avec cmp
      disable_keymaps = false, -- désactive les keymaps intégrés pour contrôle manuel
      condition = function()
        return false
      end -- condition pour arrêter Supermaven, true = stop
    })
  end,
}
