return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({
			template_file = {
				cpp = "~/template/gen.cpp",
			},
			testcases_use_single_file = true,
			testcases_auto_detect_storage = true,
			-- testcases_directory = "./test_cases"
			received_contests_problems_path = "/$(CONTEST)/$(PROBLEM)/main.$(FEXT)",

			-- 2. For individual problems (not part of a contest):
			received_problems_path = "$(CWD)/$(PROBLEM)/main.$(FEXT)",
		})
	end,
}
