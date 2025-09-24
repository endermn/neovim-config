local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.api.nvim_set_keymap("i", "<C-.>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap = true })

-- Function to get the visually selected text
local function get_visual_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  if start_pos[2] == 0 or end_pos[2] == 0 then
    return ""
  end
  local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
  if #lines == 0 then
    return ""
  end
  local num_lines = #lines
  if num_lines == 1 then
    lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
  else
    lines[1] = string.sub(lines[1], start_pos[3])
    if end_pos[3] == vim.fn.col('$') - 1 then
      -- Full line selection, do nothing to the last line
    else
      lines[num_lines] = string.sub(lines[num_lines], 1, end_pos[3])
    end
  end
  return table.concat(lines, "\n")
end

-- Make the function GLOBAL so it can be called from the command-line
function Gevai_visual_command()
  local selected_text = get_visual_selection()
  if selected_text == "" then
    print("No text selected.")
    return
  end

  vim.ui.input({ prompt = "Enter your prompt: " }, function(user_prompt)
    if not user_prompt or user_prompt == "" then
      print("Prompt cancelled.")
      return
    end

    -- --- Spinner and Floating Window Setup ---
    local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    local frame_index = 1
    local spinner_buf, spinner_win

    local function show_spinner()
      spinner_buf = vim.api.nvim_create_buf(false, true)
      local width = 30
      local height = 1
      local win_opts = {
        relative = 'editor',
        width = width,
        height = height,
        col = (vim.o.columns - width) / 2,
        row = (vim.o.lines - height) / 2,
        anchor = 'NW',
        style = 'minimal',
        border = 'rounded'
      }
      spinner_win = vim.api.nvim_open_win(spinner_buf, true, win_opts)
    end

    local timer = vim.loop.new_timer()
    local function update_spinner()
      if vim.api.nvim_win_is_valid(spinner_win) then
        vim.api.nvim_buf_set_lines(spinner_buf, 0, -1, false, { " " .. spinner_frames[frame_index] .. " Waiting for output..." })
        frame_index = (frame_index % #spinner_frames) + 1
      else
        timer:stop()
      end
    end

    -- --- Asynchronous Execution ---
    show_spinner()
    timer:start(0, 100, vim.schedule_wrap(update_spinner))

    local command = { "gevai", user_prompt, selected_text }
    local output_lines = {}

    vim.fn.jobstart(command, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          for _, line in ipairs(data) do
            if line ~= "" then
              table.insert(output_lines, line)
            end
          end
        end
      end,
      on_exit = function()
        timer:stop()
        if vim.api.nvim_win_is_valid(spinner_win) then
          vim.api.nvim_win_close(spinner_win, true)
        end

        local buf = vim.api.nvim_create_buf(true, true)
        vim.cmd('vnew')
        vim.api.nvim_set_current_buf(buf)

        -- Set wrap option for the new window
        vim.wo.wrap = true

        vim.api.nvim_buf_set_lines(buf, 0, -1, false, output_lines)
      end,
    })
  end)
end

-- Keymap to exit visual mode and then call the global Lua function
vim.keymap.set("v", "<leader>ai", ":<C-U>lua Gevai_visual_command()<CR>", { silent = true, noremap = true })
