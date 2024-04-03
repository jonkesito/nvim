return {
	{
		"antonyz89/electron-vue.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"numToStr/Comment.nvim",
		keys = { "gcc" },
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
	},
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"christoomey/vim-tmux-navigator",
	},
}
