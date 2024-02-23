local lsp = require('lsp')
local format = require('format')


if not CURSES then
	view:set_theme('monochrome', {font = 'Lucida Console', size=11})
end

buffer.use_tabs = false
buffer.tab_width = 4

-- autoreload buffers from disk (usually due to formatters being run)
events.connect(events.FILE_CHANGED, function(filename)
   buffer:reload()
   return true
end, 1)

format.commands = {
    cpp = 'clang-format',
    ansi_c = 'clang-format',
    lua = 'stylua -',
    go = 'gofmt'
}

keys['ctrl+f12'] = lsp.goto_declaration

lsp.log_rpc = true
lsp.server_commands.cpp = 'clangd'
lsp.server_commands.ansi_c = 'clangd'
lsp.server_commands.go = 'gopls'
lsp.server_commands.lua = 'lua-language-server'

textadept.editing.highlight_words = textadept.editing.HIGHLIGHT_SELECTED
textadept.editing.auto_enclose = true

ui.find.highlight_all_matches = true
