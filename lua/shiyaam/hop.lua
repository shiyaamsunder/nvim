require 'hop'.setup()

local map = require("shiyaam.utils").map
local nnoremap = require("shiyaam.utils").nnoremap

nnoremap("<Leader>h", "<cmd>HopWord<CR>")
map('', 'f',
"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
)
map('', 'F',
"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
)
map('', 't',
"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
)
map('', 'T',
"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
)
