return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        vim.keymap.set('n', '<leader>ff', "telescope.find_files", { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', "telescopel.ive_grep", { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', "telescope.buffers", { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', "telescope.help_tags", { desc = 'Telescope help tags' })
    end,
}
