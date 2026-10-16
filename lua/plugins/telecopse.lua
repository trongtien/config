return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = { ["<esc>"] = actions.close },
                    n = { ["<esc>"] = { actions.close, type = "action", opts = { nowait = true } } },
                },
            },
        })

        local preview_utils = require("telescope.previewers.utils")
        preview_utils.ts_highlighter = function(bufnr, ft)
            local lang = vim.treesitter.language.get_lang(ft) or ft
            if not lang or lang == "" then
                return false
            end

            return pcall(vim.treesitter.start, bufnr, lang)
        end

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc='Search file in folder'})
        vim.keymap.set('n', '<leader>pg', builtin.git_files, {desc="Search file in git"})
        vim.keymap.set('n', '<leader>sa', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, {desc="Searh text all file"})
        vim.keymap.set('n', '<leader>sf', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, {desc="Seach text in file"})

        vim.keymap.set('n', '<leader>sg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, {desc="Search grep"})


        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {desc="Search help tags"})

        -- Danh sách mọi keymap, tìm theo phím hoặc desc; Enter để chạy keymap đó
        vim.keymap.set('n', '<leader>x', function()
            builtin.keymaps({ modes = { "n", "i", "c", "x", "o", "t" }, show_plug = false })
        end, {desc="Show all keymaps"})
    end
}


