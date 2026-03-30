return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local is_nixos = require("jkb.env").is_nixos
        local treesitter = require("nvim-treesitter")
        treesitter.setup()

        if not is_nixos then
            treesitter.install { "vim", "vimdoc", "c", "lua", "python", "bash", "html", "yaml", "json" }
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "vim", "vimdoc", "c", "lua", "python", "bash", "html", "yaml", "json" },
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
