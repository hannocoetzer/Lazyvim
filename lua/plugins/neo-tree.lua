return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show filtered (hidden) files
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {},
        never_show = {}, -- Nothing should be excluded
      },
    },
  },
}
