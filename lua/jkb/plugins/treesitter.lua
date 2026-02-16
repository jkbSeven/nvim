return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup()
        treesitter.install { "vim", "vimdoc", "c", "lua", "python", "bash", "html", "yaml" }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "vim", "vimdoc", "c", "lua", "python", "bash", "html", "yaml" },
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
