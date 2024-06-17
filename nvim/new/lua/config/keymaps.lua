local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local g = vim.g

map('n', '<SPACE>', '<Nop>');
g.mapleader = " "
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
map('n', '<C-Right>', '3<C-w><')
map('n', '<C-Left>', '3<C-w>>')
map('n', '<C-Up>', '3<C-w>+')
map('n', '<C-Down>', '3<C-w>-')

local keyset = vim.keymap.set
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

local cmd = vim.cmd
cmd [[autocmd FileType c,cpp setlocal commentstring=//\ %s]]
