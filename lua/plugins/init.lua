return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "folke/which-key.nvim" },
        config = function()
            require "configs.lspconfig"

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "go",
                callback = function()
                    local wk = require("which-key")
                    wk.register({
                        ["<leader>"] = {
                            c = {
                                name = "Code",
                                a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Action" }
                            },
                            r = {
                                name = "Refactor",
                                n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" }
                            },
                            -- Descomentado y añadido el grupo "Go to"
                            g = {
                                name = "Go to",
                                d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
                                r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
                            },
                        },
                        K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
                    }, { buffer = 0 })
                end
            })
        end,
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
        },
        cmd = "UndotreeToggle",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        event = "VeryLazy",
        config = function()
            require("configs.harpoon")
        end,
    },
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        keys = {
            { "<leader>gs", function() vim.cmd("Git") end,               desc = "Status" },
            { "<leader>gp", function() vim.cmd("Git push") end,          desc = "Push" },
            { "<leader>gP", function() vim.cmd("Git pull --rebase") end, desc = "Pull (Rebase)" },
            { "<leader>gf", function() vim.cmd("Git fetch --all") end,   desc = "Fetch All" },
            { "<leader>gc", function() vim.cmd("Git commit") end,        desc = "Commit" },
            { "<leader>gd", function() vim.cmd("Gdiffsplit") end,        desc = "Diff" },
            { "<leader>gb", function() vim.cmd("Git blame") end,         desc = "Blame" },
            { "<leader>gl", function() vim.cmd("Git log") end,           desc = "Log" },
            { "<leader>gh", "<cmd>diffget //3<CR>",                      desc = "Get diff from right" },
            { "<leader>gu", "<cmd>diffget //2<CR>",                      desc = "Get diff from left" },
            { "<leader>gt", ":Git push -u origin ",                      desc = "Push to Origin",     expr = true, replace_keycodes = false },
        },
        config = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>"] = {
                g = {
                    name = "Git",
                },
            },
        })
    end,
    },
    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
