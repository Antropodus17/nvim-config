
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
        options = {
            section_separators = { left = '-:', right = ':-' },
            component_separators = { left = '|', right = '|' },
            theme= 'molokai',
            
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'buffers'}

            ---***SECTIONS***---

            -- branch (git branch)
            -- buffers (shows currently available buffers)
            -- diagnostics (diagnostics count from your preferred source)
            -- diff (git diff status)
            -- encoding (file encoding)
            -- fileformat (file format)
            -- filename
            -- filesize
            -- filetype
            -- hostname
            -- location (location in file in line:column format)
            -- mode (vim mode)
            -- progress (%progress in file)
            -- searchcount (number of search matches when hlsearch is active)
            -- selectioncount (number of selected characters or lines)
            -- tabs (shows currently available tabs)
            -- windows (shows currently available windows)
        },


    })
    end,
}