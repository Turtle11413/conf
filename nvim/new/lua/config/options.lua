local opt = vim.opt
local cmd = vim.cmd

opt.number         = true                  -- Enable line numbering
opt.relativenumber = true                  -- Enable relative line numbering
opt.autowrite      = true                  -- Automatically save the file before certain actions
opt.ignorecase     = true                  -- Ignore case when searching
opt.smartcase      = true                  -- Consider case if uppercase letters are used
opt.showmode       = true                  -- Show current mode
opt.history        = 1000                  -- Number of commands to remember
opt.wildmenu       = true                  -- Enable command line completion menu
opt.autochdir      = false                 -- Do not automatically change the current directory
opt.spelllang      = { 'en_us', 'ru_ru' }  -- Languages for spell checking
opt.showmatch      = false                 -- Do not highlight matching brackets
opt.mouse          = 'a'                   -- Enable mouse support
opt.clipboard      = 'unnamedplus'         -- Use the system clipboard
opt.backup         = false                 -- Do not create backup files
opt.writebackup    = false                 -- Do not create backup files before writing
opt.cursorline     = true                  -- Highlight the current line
opt.signcolumn     = "yes"                 -- Always show the sign column

-- INDENTATION SETTINGS
opt.autoindent     = true                  -- Enable automatic indentation
opt.tabstop        = 2                     -- Number of spaces in a tab
opt.shiftwidth     = 2                     -- Indentation width
opt.softtabstop    = 2                     -- Number of spaces in a tab
opt.scrolloff      = 5                     -- Minimum number of lines above and below the cursor during scrolling

opt.termguicolors  = false                 -- Disable 24-bit color support
