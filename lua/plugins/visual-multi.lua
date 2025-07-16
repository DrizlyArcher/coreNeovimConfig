return {
	"mg979/vim-visual-multi",
	keys = {
		{ "<C-n>", "<Plug>(VM-Find-Next)", mode = { "n", "x" }, desc = "Visual Multi: Find Next" },
		{ "<C-p>", "<Plug>(VM-Find-Prev)", mode = { "n", "x" }, desc = "Visual Multi: Find Previous" },
		{ "<C-a>", "<Plug>(VM-Add-Cursor-At-Pos)", mode = { "n", "x" }, desc = "Visual Multi: Add Cursor at Position" },
		{ "<C-x>", "<Plug>(VM-Remove-Cursor)", mode = { "n", "x" }, desc = "Visual Multi: Remove Cursor" },
	},
}
