-- lua/angular-tools/commands.lua
local M = {}

function M.setup()
	vim.api.nvim_create_user_command("testCommand", function()
		print("¡Hello this is a command!")
	end, {})
end

return M
