-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local dap = require("dap")
local dapui = require("dapui")

-- Debug keymaps
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
  require("tiny-code-action").code_action()
end, { desc = "Toggle tiny code actions", noremap = true, silent = true })
local live_grep_custom = function()
  require("telescope.builtin").live_grep({
    additional_args = function()
      return {
        "--no-ignore",
        "--hidden",
        "--glob",
        "!**/.git/*",
        "--glob",
        "!**/.git/**",
      }
    end,
  })
end

vim.keymap.set("n", "<leader>sg", live_grep_custom, { desc = "Live Grep (skip .git)" })
vim.keymap.set("n", "<leader>/", live_grep_custom, { desc = "Live Grep (quick)" })
vim.keymap.set("n", "<leader>o", ":Neotree reveal<CR>", { desc = "Reveal file in Neo-tree" })
