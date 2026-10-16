require("options")

if vim.loader then
	vim.loader.enable()
end

require("config.lazy")
require("remap")
require("config.autocmd")
