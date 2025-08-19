return {
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "tpope/vim-dotenv",
            "nvim-telescope/telescope.nvim",
            "MunifTanjim/nui.nvim",
            "kevinhwang91/promise-async",
        },
        cmd = { "Laravel" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
        },
        event = { "VeryLazy" },
        config = true,
        opts = {
            user_providers = {
                {
                    register = function(self, app)
                        local route_info_view = {}
                        function route_info_view:get(route)
                            return {
                                virt_text = {
                                    -- { "[", "comment" },
                                    -- { "Method: ", "comment" },
                                    { table.concat(route.methods, "|"), "@enum" },
                                    { " => /",                          "comment" },
                                    { route.uri,                        "@enum" },
                                    -- { "]", "comment" },
                                },
                            }
                        end

                        local model_info_view = {}

                        function model_info_view:get(model)
                            local virt_lines = {
                                -- { { "[", "comment" } },
                                -- { { " Database: ", "comment" },  { model.database, "@enum" } },
                                -- { { " Table: ", "comment" },     { model.table, "@enum" } },
                                { { "|-", "comment" } },
                            }

                            for _, attribute in ipairs(model.attributes) do
                                table.insert(virt_lines, {
                                    {
                                        " - " .. attribute.name,
                                        "@enum",
                                    },
                                    {
                                        " " .. (attribute.type or "null") .. (attribute.nullable and "|null" or ""),
                                        "comment",
                                    },
                                    attribute.cast and { " -> " .. attribute.cast, "@enum" } or nil,
                                })
                            end

                            -- table.insert(virt_lines, { { "]", "comment" } })

                            return {
                                virt_lines = virt_lines,
                                virt_lines_above = true,
                            }
                        end

                        app:instance("model_info_view", model_info_view)
                        app:instance("route_info_view", route_info_view)
                    end,
                    boot = function(self, app)
                        -- Optional boot logic
                    end,
                },
            },
        },
    },
    {
        "ricardoramirezr/blade-nav.nvim",
        dependencies = {
            "hrsh7th/nvim-cmp", -- if using nvim-cmp
        },
        ft = { "blade", "php" }, -- optional, improves startup time
        "ricardoramirezr/blade-nav.nvim",
        dependencies = {
            "hrsh7th/nvim-cmp", -- if using nvim-cmp
        },
        ft = { "blade", "php" }, -- optional, improves startup time
    },
}
