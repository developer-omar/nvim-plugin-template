local M = {}

function M.setup()
	require("nvim-plugin-template.config").setup()
	require("nvim-plugin-template.commands").setup()
	require("nvim-plugin-template.keymaps").setup()
end

return M
