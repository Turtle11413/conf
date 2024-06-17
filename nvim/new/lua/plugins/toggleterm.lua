return {
	'akinsho/toggleterm.nvim',

	version = "*",
  config = function()
    local function map(mode, lhs, rhs, opts)
      local options = { noremap = true, silent = true }
      if opts then
        options = vim.tbl_extend('force', options, opts)
      end
      vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end

		require("toggleterm").setup()
		map('n', '<C-n>', '<CMD>ToggleTerm size=20 direction=horizontal<CR>')
		map('t', '<C-n>', '<CMD>ToggleTerm size=20 direction=horizontal<CR>')
		map('t', '<c-\\><c-\\>', '<c-\\><c-n>')
		map('t', '<c-h>', '<c-\\><c-n><c-w>h')
		map('t', '<c-j>', '<c-\\><c-n><c-w>j')
		map('t', '<c-k>', '<c-\\><c-n><c-w>k')
		map('t', '<c-l>', '<c-\\><c-n><c-w>l')
	end
}

