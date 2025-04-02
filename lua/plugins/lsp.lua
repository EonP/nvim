return {
    "neovim/nvim-lspconfig", -- Actually configure LSP servers
    dependencies = {
        "williamboman/mason.nvim", -- Download and manage LSPs
        "williamboman/mason-lspconfig.nvim", -- Bridge mason with lspconfig
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright"}
        })

        local lspconfig = require("lspconfig")
        -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

        ------------------------------------------------------------------
        ------------------------- LSPs -----------------------------------

        -- Lua
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    },
                },
            },
        })

        -- Python 
        lspconfig.pyright.setup({
            -- capabilities = capabilities, -- Add LSP capabilities for autocompletion
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic", -- Adjust type checking (basic/strict/none)
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        })


        ------------------------------------------------------------------
        ------------------------------------------------------------------

        -- Keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)

                -- helper mapping function
                local map = function(mode, keys, func, desc)
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
                map('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition') -- <C-t> to go back
                map({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            end
        })

        -- Enable folding globally
        vim.o.foldmethod = "expr"  -- Use expression-based folding
        vim.o.foldexpr = "nvim_treesitter#foldexpr()"  -- Treesitter folding (requires nvim-treesitter)
        vim.o.foldenable = true    -- Enable folding by default
        vim.o.foldlevel = 99       -- Open all folds by default

    end
}
