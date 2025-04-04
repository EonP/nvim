return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1

        -- Manual build
        vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX" })

        -- Forward search
        vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "View PDF" })

        -- Clean aux files
        vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>", { desc = "Clean build files" })

        -- Stop compilation
        vim.keymap.set("n", "<leader>lq", "<cmd>VimtexStop<CR>", { desc = "Stop compiling" })

    end,
}
