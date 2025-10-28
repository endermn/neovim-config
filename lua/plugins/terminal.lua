return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",
  opts = {},
  config = function()
    local map = vim.keymap.set

    map("n", "<leader>ft", "<cmd>FloatermToggle<CR>", { noremap = true, silent = true })
  end,
}
