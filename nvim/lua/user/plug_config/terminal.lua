local status_ok, term = pcall(require, "toggleterm")

if not status_ok then
	require('notify')("Failed to load toggleterm")
	return
end

term.setup {
	size = 15,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	start_in_insert = true,
	persist_size = true,
	shade_terminals = true,
	shade_factor = 2,
}

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("Closing terminal")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end


vim.cmd [[ command! LazyGit execute 'lua _lazygit_toggle()' ]]
