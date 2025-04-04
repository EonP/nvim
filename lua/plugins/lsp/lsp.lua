return {
    {
        "neovim/nvim-lspconfig", -- Actually configure LSP servers
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- Autocompletion
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            ------------------------------------------------------------------
            ------------------------- LSPs Configs ---------------------------

            -- Lua
            local lua_config =
            {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim" }, -- Recognize 'vim' as a global
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            }

            -- Python
            local python_config =
            {
                capabilities = capabilities, -- Add LSP capabilities for autocompletion
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic", -- Adjust type checking (basic/strict/none)
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            }

            ------------------------------------------------------------------
            ------------------------- Setup Configs --------------------------

            lspconfig.lua_ls.setup(lua_config)
            lspconfig.pyright.setup(python_config)

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
    },
    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
    },
}
