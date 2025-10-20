-- used to automatically insert a closing tag when you open one.
-- Example: function doAThing( -> This will automatically close the tag
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) function
}
