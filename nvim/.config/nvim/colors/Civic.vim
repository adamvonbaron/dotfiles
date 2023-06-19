" Vim color file
" Converted from Textmate theme Civic using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Civic"

hi Cursor ctermfg=233 ctermbg=231 cterm=NONE guifg=#252630 guibg=#fcffff gui=NONE
hi Visual ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#3c4856 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#383942 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#383942 gui=NONE
hi SignColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#383942 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#383942 gui=NONE
hi LineNr ctermfg=102 ctermbg=235 cterm=NONE guifg=#83848c guibg=#383942 gui=NONE
hi VertSplit ctermfg=235 ctermbg=235 cterm=NONE guifg=#5c5d65 guibg=#5c5d65 gui=NONE
hi MatchParen ctermfg=168 ctermbg=NONE cterm=underline guifg=#cf3f93 guibg=NONE gui=underline
hi StatusLine ctermfg=254 ctermbg=235 cterm=bold guifg=#e1e2e7 guibg=#5c5d65 gui=bold
hi StatusLineNC ctermfg=254 ctermbg=235 cterm=NONE guifg=#e1e2e7 guibg=#5c5d65 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#3c4856 gui=NONE
hi IncSearch ctermfg=233 ctermbg=167 cterm=NONE guifg=#252630 guibg=#ca4540 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ca4540 guibg=NONE gui=NONE
hi Folded ctermfg=77 ctermbg=233 cterm=NONE guifg=#32cf72 guibg=#252630 gui=NONE

hi Normal ctermfg=254 ctermbg=233 cterm=NONE guifg=#e1e2e7 guibg=#252630 gui=NONE
hi Boolean ctermfg=173 ctermbg=NONE cterm=NONE guifg=#c77a4b guibg=NONE gui=NONE
hi Character ctermfg=173 ctermbg=NONE cterm=NONE guifg=#c77a4b guibg=NONE gui=NONE
hi Comment ctermfg=77 ctermbg=NONE cterm=NONE guifg=#32cf72 guibg=NONE gui=NONE
hi Conditional ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi Constant ctermfg=66 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi Define ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi DiffAdd ctermfg=77 ctermbg=235 cterm=bold guifg=#e1e2e7 guibg=#46830e gui=bold
hi DiffDelete ctermfg=89 ctermbg=235 cterm=NONE guifg=#8b080a guibg=NONE gui=NONE
hi DiffChange ctermfg=45 ctermbg=235 cterm=NONE guifg=#e1e2e7 guibg=#23385c gui=NONE
hi DiffText ctermfg=24 ctermbg=235 cterm=bold guifg=#e1e2e7 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=131 ctermbg=235 cterm=NONE guifg=#e1e2e7 guibg=#af5d38 gui=NONE
hi WarningMsg ctermfg=254 ctermbg=131 cterm=NONE guifg=#e1e2e7 guibg=#af5d38 gui=NONE
hi Float ctermfg=173 ctermbg=NONE cterm=NONE guifg=#c77a4b guibg=NONE gui=NONE
hi Function ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi Identifier ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi Keyword ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi Label ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ca4540 guibg=NONE gui=NONE
hi NonText ctermfg=244 ctermbg=233 cterm=NONE guifg=#7f7f7f guibg=#2e2f39 gui=NONE
hi Number ctermfg=173 ctermbg=NONE cterm=NONE guifg=#c77a4b guibg=NONE gui=NONE
hi Operator ctermfg=97 ctermbg=NONE cterm=NONE guifg=#746db0 guibg=NONE gui=NONE
hi PreProc ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi Special ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e1e2e7 guibg=NONE gui=NONE
hi SpecialKey ctermfg=244 ctermbg=235 cterm=NONE guifg=#7f7f7f guibg=#383942 gui=NONE
hi Statement ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi StorageClass ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi String ctermfg=161 ctermbg=NONE cterm=NONE guifg=#ca4540 guibg=NONE gui=NONE
hi Tag ctermfg=97 ctermbg=NONE cterm=NONE guifg=#746db0 guibg=NONE gui=NONE
hi Title ctermfg=254 ctermbg=NONE cterm=bold guifg=#e1e2e7 guibg=NONE gui=bold
hi Todo ctermfg=77 ctermbg=NONE cterm=inverse,bold guifg=#32cf72 guibg=NONE gui=inverse,bold
hi Type ctermfg=162 ctermbg=NONE cterm=NONE guifg=#d7008f guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi rubyFunction ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ca4540 guibg=NONE gui=NONE
hi rubyConstant ctermfg=37 ctermbg=NONE cterm=NONE guifg=#1da9a2 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ca4540 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=173 ctermbg=NONE cterm=NONE guifg=#c77a4b guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=131 ctermbg=NONE cterm=NONE guifg=#af5d38 guibg=NONE gui=NONE
hi rubyInclude ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e1e2e7 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=97 ctermbg=NONE cterm=NONE guifg=#746db0 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=97 ctermbg=NONE cterm=NONE guifg=#746db0 guibg=NONE gui=NONE
hi rubyEscape ctermfg=97 ctermbg=NONE cterm=NONE guifg=#746db0 guibg=NONE gui=NONE
hi rubyControl ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e1e2e7 guibg=NONE gui=NONE
hi rubyOperator ctermfg=97 ctermbg=NONE cterm=NONE guifg=#746db0 guibg=NONE gui=NONE
hi rubyException ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=131 ctermbg=NONE cterm=NONE guifg=#af5d38 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=37 ctermbg=NONE cterm=NONE guifg=#1da9a2 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=66 ctermbg=NONE cterm=NONE guifg=#55747c guibg=NONE gui=NONE
hi erubyComment ctermfg=77 ctermbg=NONE cterm=NONE guifg=#32cf72 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi htmlTag ctermfg=66 ctermbg=NONE cterm=NONE guifg=#55747c guibg=NONE gui=NONE
hi htmlEndTag ctermfg=66 ctermbg=NONE cterm=NONE guifg=#55747c guibg=NONE gui=NONE
hi htmlTagName ctermfg=66 ctermbg=NONE cterm=NONE guifg=#55747c guibg=NONE gui=NONE
hi htmlArg ctermfg=66 ctermbg=NONE cterm=NONE guifg=#55747c guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=173 ctermbg=NONE cterm=NONE guifg=#c77a4b guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=168 ctermbg=NONE cterm=NONE guifg=#cf3f93 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=66 ctermbg=NONE cterm=NONE guifg=#55747c guibg=NONE gui=NONE
hi jsFuncCall ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi phpClasses ctermfg=66 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi phpFunction ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi phpMethodsVar ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi yamlKey ctermfg=97 ctermbg=NONE cterm=NONE guifg=#746db0 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e1e2e7 guibg=NONE gui=NONE
hi yamlAlias ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e1e2e7 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=167 ctermbg=NONE cterm=NONE guifg=#ca4540 guibg=NONE gui=NONE
hi cssURL ctermfg=173 ctermbg=NONE cterm=NONE guifg=#c77a4b guibg=NONE gui=NONE
hi cssFunctionName ctermfg=73 ctermbg=NONE cterm=NONE guifg=#56afb0 guibg=NONE gui=NONE
hi cssColor ctermfg=66 ctermbg=NONE cterm=NONE guifg=#55747c guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=37 ctermbg=NONE cterm=NONE guifg=#1da9a2 guibg=NONE gui=NONE
hi cssClassName ctermfg=37 ctermbg=NONE cterm=NONE guifg=#1da9a2 guibg=NONE gui=NONE
hi cssValueLength ctermfg=173 ctermbg=NONE cterm=NONE guifg=#c77a4b guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=173 ctermbg=NONE cterm=NONE guifg=#c77a4b guibg=NONE gui=NONE
hi cssBraces ctermfg=66 ctermbg=NONE cterm=NONE guifg=#55747c guibg=NONE gui=NONE
