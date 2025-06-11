return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Set background to light BEFORE loading the colorscheme
      vim.o.background = "light"

      require("gruvbox").setup({
        contrast = "hard", -- can be "hard", "soft" or empty string
        -- Add any other gruvbox options here
      })

      vim.cmd("colorscheme gruvbox")
    end,
  },
}
