return {
	{ "github/copilot.vim" },
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
				{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
			},
			build = "make tiktoken", -- Only on MacOS or Linux
			opts = {
				-- See Configuration section for options
				context = "buffers", -- or "workspace" for full directory, or "file" for current file
				-- Alternatively, use a function for advanced control:
				context_range = function()
					return {
						buffers = true, -- include all open buffers
						workspace = true, -- include project root context
						file = true, -- include current file context
					}
				end,
			},
			-- See Commands section for default commands if you want to lazy load on them
		},
	},
}
