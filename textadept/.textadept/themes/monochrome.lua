view.colors.base00 = 0xffffff
view.colors.base01 = 0x000000
view.colors.base02 = 0xababab

view.styles[view.STYLE_DEFAULT] = {
  font = font, size = size, fore = view.colors.base01, back = view.colors.base00
}

view.styles[lexer.COMMENT] = { fore = view.colors.base02 }
