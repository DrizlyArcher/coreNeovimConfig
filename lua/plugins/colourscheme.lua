-- original tokyonight-strom
--return {
--	{
--		"folke/tokyonight.nvim",
--		lazy = false,
--		priority = 1000,
--		opts = {},
--		config = function()
--			vim.cmd([[colorscheme tokyonight-storm]])
--		end,
--	},
--}

-- 2nd scheme, carbonfox

local colourshemes = { "tokyonight-storm", "carbonfox", "everforest" }
local current_index = 1

return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({})
		end,
	},

	vim.keymap.set("n", "<leader>tc", function()
		current_index = current_index % #colourshemes + 1
		local scheme = colourshemes[current_index]
		vim.cmd("colorscheme " .. scheme)
		print("Cycles to colorscheme: " .. scheme)
	end, { desc = "Cycled colorscheme" }),

	-- config = function()
	--   vim.cmd([[colorscheme carbonfox]])
	-- end,
}
