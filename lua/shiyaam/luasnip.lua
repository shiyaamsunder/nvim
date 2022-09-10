local status_ok,ls = pcall(require, "luasnip")
if not status_ok then
    return
end

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
	s("pc", {
		t("local status_ok,"), i(1, "mod"), t("= pcall(require, "), i(2, "mod"), t({")", "if not status_ok then", "    return", "end"}),
	})
})


