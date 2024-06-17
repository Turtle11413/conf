-- Bootstrapping lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Start lazy.nvim
require("lazy").setup({{ import = "plugins" }}, {
		checker = { enabled = false },					-- disable check for plugin updates
		change_detection = { enabled = false }, -- disable check for config file changes
		install = { colorscheme = { "tokyonight", "habamax" } },

})

require("config.options")
require("config.keymaps")

vim.cmd [[
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
]]

vim.cmd [[
  syntax enable
	colorscheme gruvbox
]]
