return {
  'neovim/nvim-lspconfig', -- Actually configure LSP servers
  dependencies = {
    { 'williamboman/mason.nvim', config = true }, -- Download and manage LSPs
    'williamboman/mason-lspconfig.nvim', -- Bridge mason with lspconfig
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- Install extra tools
    { 'j-hui/fidget.nvim', opts = {} }, -- Display LSP progress info
    -- 'hrsh7th/cmp-nvim-lsp', -- Enhance autocompletion
  },
  config = function()

    -- keymaps
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

    -- Needed for completion support (using nvim-cmp)
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    local capabilities = vim.lsp.protocol.make_client_capabilities()


    -- Enable language servers ---------------------------------------------
    ------------------------------------------------------------------------

    local servers = {

      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            diagnostics = { disable = { 'missing-fields' } },
            format = {
              enable = false,
            },
          },
        },
      }, 



    }

    ------------------------------------------------------------------------
    ------------------------------------------------------------------------

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})    
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
