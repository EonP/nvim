-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- remove highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- toggle autosave
vim.keymap.set("n", "<leader>as", function()
  require("core.autosave").toggle()
end, { desc = "Toggle Autosave" })



