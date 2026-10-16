local keymap = vim.keymap

keymap.set("n", "ns", [[:tabnew ]], { desc = "New tab" })
keymap.set("n", "sT", "<C-w>T", { desc = "Move window to new tab" })

keymap.set("n", "sq", function()
	if vim.fn.tabpagenr("$") == 1 then
		vim.notify("One tab", vim.log.levels.WARN)
		return
	end
	vim.cmd.tabclose()
end, { desc = "Close tab" })

-- Di chuyển qua lại giữa các tab
keymap.set("n", "<S-L>", "<Cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<S-H>", "<Cmd>tabprevious<CR>", { desc = "Previous tab" })

keymap.set("n", "s<", "<Cmd>-tabmove<CR>", { desc = "Move tab left" })
keymap.set("n", "s>", "<Cmd>+tabmove<CR>", { desc = "Move tab right" })

keymap.set("n", "sr", ":TabRename ", { desc = "Rename tab" })

vim.api.nvim_create_user_command("TabRename", function(o)
	vim.t.tabname = o.args ~= "" and o.args or nil
	if package.loaded["lualine"] then
		require("lualine").refresh({ place = { "tabline" }, force = true })
	end
	vim.cmd.redrawtabline()
end, { nargs = "?", desc = "Rename current tab" })
