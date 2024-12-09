return {
    "neovim/nvim-lspconfig",
    require 'lspconfig'.pyre.setup {
        cmd = { "pyre", "persistent" },
        filetype = { "python" }
    },
    require "lspconfig".docker_compose_language_service.setup {
        cmd = { "docker-compose-langserver", "--studio" },
        filetype = { "yaml.docker-compose", "yaml.compose" },
        single_file_support = false,
    },
    require "lspconfig".biome.setup {
        cmd = { "biome", "lsp-proxy" },
        filetype = { "astro", "js", "css", "graphql", "javascript", "javascriptreact", "json", "jsonc", "svelte", "typescript", "typescript.tsx", "typescriptreact", "vue" },
        single_file_support = false,
    },
    require 'lspconfig'.lua_ls.setup {
        on_init = function(client)
            if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    return
                end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                        -- Depending on the usage, you might want to add additional paths here.
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                    }
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                    -- library = vim.api.nvim_get_runtime_file("", true)
                }
            })
        end,
        settings = {
            Lua = {}
        }
    }
}
