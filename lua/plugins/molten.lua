return {
	{
		"benlubas/molten-nvim",
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		enabled = false,
		init = function()
			-- These are examples, not defaults. Change as needed.
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_wrap_output = false
			vim.g.molten_output_win_max_height = 100
			vim.g.molten_output_win_max_width = 1000
			vim.g.molten_auto_open_output = false -- I prefer manual
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by_1 = true
			vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Initialize Molten" })
			vim.keymap.set("n", "<leader>r", ":MoltenEvaluateOperator<CR>", { desc = "Run operator" })
			vim.keymap.set("n", "<leader>rr", ":MoltenEvaluateLine<CR>", { desc = "Run line" })
			vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "Run visual selection" })
			vim.keymap.set("n", "<leader>rc", ":MoltenReevaluateCell<CR>", { desc = "Re-evaluate cell" })
		end,
	},
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty", -- Or "ueberzug" for linux users without kitty
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki", "quarto" },
				},
				neorg = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "norg" },
				},
			},
			max_width = 100,
			max_height = 12,
			max_width_window_percentage = math.huge,
			max_height_window_percentage = math.huge,
			window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"neovim/nvim-lspconfig",
		},
		ft = { "quarto", "markdown" },
		config = function()
			require("quarto").setup({
				lspFeatures = {
					enabled = true,
					languages = { "r", "python", "julia", "bash", "html" },
					diagnostics = {
						enabled = true,
						triggers = { "BufWritePost" },
					},
					completion = {
						enabled = true,
					},
				},
			})
		end,
	},
}
