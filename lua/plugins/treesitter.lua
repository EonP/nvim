return {
  "nvim-treesitter/nvim-treesitter", build= ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "vim", "vimdoc",
        "query",
        "markdown", "markdown_inline",
        "python",
        "c",
        "java",
        "c_sharp",
        "scala",
        "asm",
        "bash",
        "sql",
        "javascript",
        "typescript",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
