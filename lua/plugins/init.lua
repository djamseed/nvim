-- Plugins that do not require any setup are defined here

return {
	{ "nvim-lua/plenary.nvim", lazy = true }, -- Reusable Lua functions that are used by other plugins
	{ "tpope/vim-fugitive", event = "VeryLazy" }, -- Git wrapper
}
