return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        local on_attach = function(_, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("pyright", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("clangd", {
            capabilities = capabilities,
            on_attach = on_attach,

            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--offset-encoding=utf-8"
            },

            filetypes = { "c", "cpp" },

            root_markers = {
                ".clangd",
                "compile_command.json",
                "compile_flags.txt",
                ".git",
            },
        })

        vim.lsp.config("nil_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.enable({
            "lua_ls",
            "pyright",
            "clangd",
            "nil_ls",
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
            })
        })

        vim.diagnostic.config({
            update_in_insert = false,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
