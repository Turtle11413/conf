local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
   'wbthomason/packer.nvim',
   'sainnhe/sonokai',
   'morhetz/gruvbox',
   'doums/darcula',

   { "nvim-treesitter/nvim-treesitter",
    build = function()
        local ts_update = require("nvim-treesitter.install").update {
            with_sync = true,
        }
        ts_update()
    end,
    config = function()
        local ts_config = require "nvim-treesitter.configs"

        ts_config.setup {
            ensure_installed = {
							"vim",
							"lua",
							"java",
							"cpp",
						},
        }
    end,
	 },

   {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
   },
      {
       'francoiscabrol/ranger.vim',
       requires = { 'rbgrouleff/bclose.vim' }
      },

	 'nvim-lua/plenary.nvim',

   'rstacruz/vim-closer',
   'tpope/vim-endwise',
   'tpope/vim-surround',
   'tpope/vim-commentary',
   'norcalli/nvim-colorizer.lua',
   'lukas-reineke/indent-blankline.nvim',
   'michaeljsmith/vim-indent-object',

   'neovim/nvim-lspconfig',
   'ranjithshegde/ccls.nvim',

   'mfussenegger/nvim-dap',
   'rcarriga/nvim-dap-ui',
   'folke/neodev.nvim',
   'ldelossa/nvim-dap-projects',

	 'kevinhwang91/rnvimr',

        "williamboman/mason.nvim",
        'neoclide/coc.nvim',
        -- branch = 'release'
		 {
			'jose-elias-alvarez/null-ls.nvim',
			requires = { 'https://github.com/nvim-lua/plenary.nvim' }
		},

	 "akinsho/toggleterm.nvim",
     'tpope/vim-fugitive',
     'airblade/vim-gitgutter',

	 {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	},
})

local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local b = vim.b
local opt = vim.opt
local api = vim.api

-- GENERAL SETTINGS
opt.number = true
opt.relativenumber = true
opt.autowrite = true
opt.ignorecase = true
opt.smartcase = true
opt.showmode = true
opt.history = 1000
opt.wildmenu = true
opt.autochdir = false
opt.spelllang = { 'en_us', 'ru_ru' }
opt.showmatch = false
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.backup = false
opt.writebackup = false
opt.cursorline = true
-- opt.updatetime = 300
opt.signcolumn = "yes"

-- INDENTATION
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.scrolloff = 5

-- COLORS
opt.termguicolors = false
cmd [[
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
syntax enable
]]
-- g.sonokai_enable_italic = 1
cmd'colorscheme gruvbox'

-- KEYMAPS/SHORTCUTS/HOTKEYS
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<SPACE>', '<Nop>');
g.mapleader = " "
map('n', '<C-T>', ':RnvimrToggle<CR>')
-- i hate reloading vim every single time
map('', '<C-M><C-M>', ':luafile $MYVIMRC<CR>')
-- i hate jumping lines
map('n', 'k', 'gk')
map('n', 'j', 'gj')
map('v', 'k', 'gk')
map('v', 'j', 'gj')
--tabs and stuff
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-s>', '<C-w>s')
map('n', '<C-v>', '<C-w>v')
map('n', '<C-q>', '<C-w>q')
map('n', '<C-,>', '3<C-w><')
map('n', '<C-.>', '3<C-w>>')
map('n', '<C-=>', '3<C-w>+')
map('n', '<C-->', '3<C-w>-')
-- nvim-dap maps monstrocity (even though I will be using mouse probably lmao)
map('n', '<F3>', ':set spell!<CR>')
map('n', '<F5>', ':DapContinue<CR>')
map('n', '<F6>', '<CMD>lua require(\'dap\').run_last()<CR>')
map('n', '<F7>', '<CMD>make<CR>')
map('n', '<F8>', '<CMD>luafile nvim-dap.lua<CR>') -- fuck nvim-dap-projects
map('n', '<C-b>', ':DapToggleBreakpoint<CR>')
map('n', '<C-d>', '<CMD>lua require(\'dapui\').toggle()<CR>')
map('n', '<F10>', ':DapStepOver<CR>')
map('n', '<F11>', ':DapStepInto<CR>')
map('n', '<F12>', ':DapStepOut<CR>')
map('v', '<C-k>', '<CMD>lua require("dapui").eval()<CR>')
-- termninal mappings
require("toggleterm").setup()
map('n', '<C-n>', '<CMD>ToggleTerm size=20 direction=horizontal<CR>')
map('t', '<C-n>', '<CMD>ToggleTerm size=20 direction=horizontal<CR>')
map('t', '<c-\\><c-\\>', '<c-\\><c-n>')
map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')
map('n', '<C-T>', ':RangerCurrentDirectory<CR>')

-- LUALINE
require('lualine').setup {
	sections = {
		lualine_x = {'filetype'},
	},
	options = {
		theme = 'auto',
	},
}

-- MASON
require("mason").setup()

-- COMPLETION
local keyset = vim.keymap.set
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- LATEX
g.vimtex_view_method = 'mupdf'
local maplocalleader = ','
g.vimtex_view_general_options = '-reuse-instance u/pdf'
cmd'au User VimtexEventCompileSuccess silent :exe "!pkill -HUP mupdf"'

-- ranger.nvim
g.rnvimr_enable_ex = 1

-- startup.nvim
require("startup").setup({theme = "startify"})

-- COCNVIM
cmd [[autocmd FileType c,cpp setlocal commentstring=//\ %s]]

-- NULL-LS
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
null_ls.setup({
    sources = { 
        null_ls.builtins.formatting.clang_format,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
