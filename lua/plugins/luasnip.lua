return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    require("luasnip.loaders.from_vscode").lazy_load(),
    verion="v2.*",
    main="config.plugins.luasnip",
    config=true,
}
