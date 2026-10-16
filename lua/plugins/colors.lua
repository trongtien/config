return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "moon",
			styles = { italic = false },
			highlight_groups = {
				-- Visual mặc định gần trùng màu CursorLine (netrw bật cursorline) nên không thấy vùng chọn
				Visual = { bg = "highlight_high", inherit = false },
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
}
