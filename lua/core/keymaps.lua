-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set("n", "<leader>as", function()
  require("core.autosave").toggle()
end, { desc = "Toggle Autosave" })

