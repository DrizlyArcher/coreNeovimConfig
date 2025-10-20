-- multi select, akin to VsCdoes CMD+D
return {
	"mg979/vim-visual-multi",
  lazy = false, --Removed lazy load for now to prevent a minor stutter when using.
	keys = {
		{ "<C-n>", "<Plug>(VM-Find-Next)", mode = { "n", "x" }, desc = "Visual Multi: Find Next" },
		{ "<C-p>", "<Plug>(VM-Find-Prev)", mode = { "n", "x" }, desc = "Visual Multi: Find Previous" },
		{ "<C-a>", "<Plug>(VM-Add-Cursor-At-Pos)", mode = { "n", "x" }, desc = "Visual Multi: Add Cursor at Position" },
		{ "<C-x>", "<Plug>(VM-Remove-Cursor)", mode = { "n", "x" }, desc = "Visual Multi: Remove Cursor" },
	},
}
