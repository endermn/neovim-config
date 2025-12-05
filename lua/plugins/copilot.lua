return {
	{ "github/copilot.vim"},
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				{ "github/copilot.vim" },
				{ "nvim-lua/plenary.nvim", branch = "master" },
			},
			build = "make tiktoken",
			opts = {
				context = "buffers",
				context_range = function()
					return {
						buffers = true,
						workspace = true,
						file = true,
					}
				end,
			},
		},
	},
}
