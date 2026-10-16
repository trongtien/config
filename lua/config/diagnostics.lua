local trouble = require("trouble")
vim.keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

vim.keymap.set("n", "<leader>te", function()
	trouble.toggle({
		mode = "diagnostics",
		filter = { severity = vim.diagnostic.severity.ERROR },
	})
end, { desc = "Project Errors" })

vim.keymap.set("n", "<leader>tw", function()
	require("trouble").toggle({
		mode = "diagnostics",
		filter = { severity = vim.diagnostic.severity.WARN },
	})
end, { desc = "Project Warnings" })


