return {
    {
        'nvim-telescope/telescope.nvim',

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<C-l>', builtin.git_files, {})

            vim.keymap.set('n', '<leader>fs', function()
                regex = vim.fn.input("Grep > ")
                if regex ~= "" then
                    builtin.grep_string({ search = regex })
                else
                    builtin.grep_string()
                end
            end)
        end

    },
}
