return {
{
        "jake-stewart/multicursor.nvim",
        -- branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()

            local set = vim.keymap.set

            set("x", "<leader>mv", mc.visualToCursors, { desc = "MC visual → cursors" })
            set({ "n", "x" }, "<leader>ma", mc.matchAllAddCursors, { desc = "MC select all matches" })
            set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end, { desc = "MC add prev occurrence" })
            set({ "n", "x" }, "<C-x>", function() mc.matchSkipCursor(1) end, { desc = "MC skip current match" })

            set("n", "<Esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                elseif mc.hasCursors() then
                    mc.clearCursors()
                else
                    vim.cmd("nohlsearch")
                end
            end)
        end,
    }
}
