return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "mocha",
	},
	config = function(_, opts)
		require("catppuccin").setup({
			flavour = opts.flavour,
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
