return {
  "nvim-treesitter/nvim-treesitter",
  dependencies={
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
  opts={
    ensure_installed = {
      "lua",
      "luadoc",
      "php",
      "java",
      "python",
        "javascript",
    },
    highligth={
      enable=true,
    },
    indent = {
      enable =true,
    },
    textobjects={
      select ={
        enable=true,
        lookahead = true,
        keymaps={
          ["af"]= "@function.outer",
          ["if"]= "@function.inner",
          ["af"]= "@conditional.outer",
          ["if"]= "@conditional.inner",
          ["af"]= "@loop.outer",
          ["if"]= "@loop.inner",
          
        },
      },
    },
  },

}
