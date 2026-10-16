-- Resize window mode: vào bằng `rs` (hoặc <C-w> + mũi tên), sau đó chỉ cần bấm
-- h/l (hẹp/rộng), j/k (thấp/cao) hoặc mũi tên để resize liên tục.
-- Bấm phím khác để thoát (phím đó vẫn được thực thi), <Esc> để thoát mà không làm gì.
-- Gõ số trước khi vào mode để nhân bước, ví dụ `3rs`.
local width_step = 5
local height_step = 3

local resize_keys = {}
for keys, action in pairs({
	["h <Left>"] = { "<", width_step },
	["l <Right>"] = { ">", width_step },
	["k <Up>"] = { "+", height_step },
	["j <Down>"] = { "-", height_step },
}) do
	for _, key in ipairs(vim.split(keys, " ")) do
		resize_keys[vim.keycode(key)] = action
	end
end

local function resize_mode(first)
	local count = vim.v.count1
	local action = first and resize_keys[vim.keycode(first)]
	-- cmdheight = 0 nên không thấy mode message, báo tạm trên statusline
	local statusline = vim.api.nvim_get_option_value("statusline", { scope = "local" })
	vim.wo.statusline = "%#ModeMsg# -- RESIZE -- %* h/j/k/l: resize  <Esc>: thoát"
	while true do
		if action then
			vim.cmd.wincmd({ args = { action[1] }, count = action[2] * count })
		end
		vim.cmd.redraw()
		local ok, key = pcall(vim.fn.getcharstr)
		action = ok and resize_keys[key]
		if not action then
			vim.wo.statusline = statusline
			if ok and key ~= vim.keycode("<Esc>") then
				vim.api.nvim_feedkeys(key, "m", false)
			end
			return
		end
	end
end

vim.keymap.set("n", "<leader>rs", function()
	resize_mode()
end, { desc = "Resize mode" })

for _, key in ipairs({ "<Left>", "<Right>", "<Up>", "<Down>" }) do
	vim.keymap.set("n", "<C-w>" .. key, function()
		resize_mode(key)
	end, { desc = "Resize window" })
end
