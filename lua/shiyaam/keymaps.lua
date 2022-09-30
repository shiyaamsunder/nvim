---@diagnostic disable: lowercase-global
local utils = require("shiyaam.utils")

local inoremap = utils.inoremap;
local nnoremap = utils.nnoremap;
local vnoremap = utils.vnoremap;


-- persist previous yanked text when using `ya(w/i/W/I)`
vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", { noremap = true, silent = true })

-- Save current buffer
nnoremap("<C-s>", "<cmd>w<CR>")
inoremap("<C-s>", "<cmd>w<CR>")

nnoremap("<Leader>ek", ":tabe ~/.config/nvim/keymaps.lua<CR>")
nnoremap("<Leader>ep", ":tabe ~/.config/nvim/plugins.lua<CR>")
nnoremap("<Leader>tt", ":tabclose<CR>")



-- get function signature
inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nnoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

-- keymap for compiling c++ code. Needs some working
nnoremap("<Leader>b", ":TermExec cmd='g++ -std=c++17 % -o bin/%< && bin/%<'<CR>")

-- Fix * (Keep the cursor position, don't move to next match)
nnoremap("*", '*N')

-- Fix n and N. Keeping cursor in center
nnoremap("n", "nzz")
nnoremap("N", "Nzz")

-- Keep the curosor centered while scrolling
nnoremap("j", "jzz")
nnoremap("k", "kzz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

-- Move to the next/previous buffer
nnoremap('<leader>[', ':bp<CR>')
nnoremap('<leader>]', ':bn<CR>')

-- Move to last buffer
nnoremap("''", ':b#<CR>')

--Windows
-- Copying the vscode behaviour of making window splits
nnoremap('<C-\\>', ':vsplit<CR>')
nnoremap('<A-\\>', ':split<CR>')

-- Better Window navigation
nnoremap("<m-h>", "<C-w>h") -- Move to the left window
nnoremap("<m-j>", "<C-w>j") -- Move to bottom window
nnoremap("<m-k>", "<C-w>k") -- Move to top window
nnoremap("<m-l>", "<C-w>l") -- Move to right window

-- Resize with arrows
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")

-- Tabs --
nnoremap("<m-t>", ":tabnew %<cr>") -- Open current file in new tab
nnoremap("<m-y>", ":tabclose<cr>") -- Close current tab
nnoremap("<m-\\>", ":tabonly<cr>") -- Closes all tabs except the current one
nnoremap("<Tab>", "gt") -- Move to Next tab
nnoremap("<S-Tab>", "gT") -- Move to previous tab

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("<Leader>l", ":set hlsearch!<CR>")

-- go back to the last insert cursor position
nnoremap("gi", "gi<Esc>zzi")

-- Souce current lua file
function source_lua_file()
  vim.cmd [[luafile %]]
  local curr_bufname = vim.fn.bufname()
  print("")
  print(string.format("sourced %s", curr_bufname))
end

nnoremap("<Leader>sf", ":lua source_lua_file()<CR>") -- Source current luafile
