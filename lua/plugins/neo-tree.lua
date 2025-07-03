-- ~/.config/nvim/lua/plugins/neo-tree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden items
        hide_dotfiles = false, -- Do not hide .files
        hide_gitignored = false, -- Do not hide gitignored files
        hide_by_name = {},
        never_show = {},
      },
    },
  },
}
