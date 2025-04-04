return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup()
        vim.keymap.set('n', "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
    end
}
