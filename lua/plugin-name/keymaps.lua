-- lua/nvim-plugin-template/keymaps.lua

local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>hp", function()
		print("Hello this is a keymap")
	end, { desc = "Keymap Description" })
end

return M
