return {
  "DreamMaoMao/yazi.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },

	vim.api.nvim_set_keymap('n', '<C-T>', ':Yazi<CR>', { noremap = true, silent = true })

}
