return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
	require'nvim-treesitter.configs'.setup {
		ensure_installed = { "lua", "java", "cpp" },
		highlight = {
			enable = true,          -- false will disable the whole extension
		},
	}
	end
}
