local fluoromachine = require("fluoromachine.colorscheme")
local utils = require("fluoromachine.utils")
local colortool = require("fluoromachine.colortool")
local darken = colortool.darken
local blend = colortool.blend

function fluoromachine.setup(user_config)
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "fluoromachine"

	-- user config
	fluoromachine.config = vim.tbl_extend("force", fluoromachine.config, user_config or {})

	-- override or add highlight group
	if user_config and type(user_config.colors) == "table" then
		fluoromachine.colors = vim.tbl_extend("force", fluoromachine.colors, user_config.colors)
	elseif user_config and type(user_config.colors) == "function" then
		fluoromachine.colors =
			vim.tbl_extend("force", fluoromachine.colors, user_config.colors(fluoromachine.colors, darken, blend))
	end

	require("fluoromachine.highlights")

	-- override or add colors
	if user_config and type(user_config.highlights) == "table" then
		fluoromachine.highlights = vim.tbl_extend("force", fluoromachine.highlights, user_config.highlights)
	elseif user_config and type(user_config.highlights) == "function" then
		fluoromachine.highlights = vim.tbl_extend(
			"force",
			fluoromachine.highlights,
			user_config.highlights(fluoromachine.colors, darken, blend)
		)
	end

	utils.set_highlights(fluoromachine.highlights)
end

return fluoromachine
