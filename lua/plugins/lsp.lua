return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        local on_attach = function(_, bufnr)
          --vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>f', function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end
        require("neodev").setup()
        require("lspconfig").lua_ls.setup({
            on_attach = on_attach,
            settings = {
                Lua = {
                    telemetry = { enable = false },
                    workspace = { checkThirdParty = false },
                }
            }
        }),
        require("lspconfig").pyright.setup({
            cmd:{ "pyright-langserver", "--stdio" },
            filetypes = { 'python' },
            single_file_support = true,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = 'openFilesOnly',
                    },
                },
            },
            commands = {
                PyrightOrganizeImports = {
                  organize_imports,
                  description = 'Organize Imports',
                },
                PyrightSetPythonPath = {
                  set_python_path,
                  description = 'Reconfigure pyright with the provided python path',
                  nargs = 1,
                  complete = 'file',
                },
              },
              docs = {
                description = [[
            https://github.com/microsoft/pyright
            
            `pyright`, a static type checker and language server for python
            ]],
              },
        })
    end
}
