return {
    "nvim-treesitter/nvim-treesitter",
    -- dependencies = {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    -- }
	build = ":TSUpdate",
    event= "VeryLazy",
    main = 'nvim-treesitter.configs',
    opts= {
        ensure_installed = {
            "lua",
            "luadoc",
            "java",
            "css",
            "html",
            "query",
            "javascript",
            "vim",
            "vimdoc",
            "markdown",
            "markdown_inline",
            "php",
            "python" 
        },
	    highlight = { 
            enable = true 
        },
	    indent = { 
            enable = true 
        },
        -- textobjects={
        --     select={
        --         enable=true,
        --         lookahead=true,
        --         keymap={
                    
        --         }
        --     }
        -- }
        -- require("nvim-treesitter.install").prefer_git = true,
    }
}