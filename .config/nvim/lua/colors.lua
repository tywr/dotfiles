vim.o.termguicolors = false

local colors = {
    accent = 1,
    main = 2,
    main2 = 5,
    main3 = 6,
    secondary = 3,
    secondary2 = 4,
    accent_bright = 9,
    main_bright = 10,
    main2_bright = 13,
    main3_bright = 14,
    secondary_bright = 11,
    secondary2_bright = 12,
    white = 7,
    black = 0,
    black_comment = 8,
    black2 = 16,
    black3 = 17,
    black4 = 18,
    black5 = 19,
    black6 = 20,
    black7 = 21,
}

local function hl(group_name, opts)
    vim.api.nvim_set_hl(0, group_name, opts)
end

-- Base
hl("CursorLine", { ctermbg = colors.black })
hl("CursorLineNR", { ctermfg = colors.white, cterm = { bold = true } })
hl("LineNr", { ctermfg = colors.black_comment })
hl("Visual", { ctermbg = colors.white, ctermfg = colors.black })
hl("ExtraWhitespace", { ctermbg = colors.black, ctermfg = colors.white })
hl("MatchParen", { ctermbg = colors.main, ctermfg = colors.black })
hl("Normal", { ctermfg = colors.white })
hl("NonText", { ctermfg = colors.black })
hl("Error", { ctermfg = colors.accent })
hl("Ignore", { ctermbg = colors.black, ctermfg = colors.white })
hl("Statement", { ctermfg = colors.main2 })
hl("Todo", { ctermfg = colors.accent })
hl("Type", { ctermfg = colors.main2 })

hl("WinSeparator", { ctermbg = colors.black, ctermfg = colors.black })
hl("ColorColumn", { ctermbg = colors.black })

hl("NonText", { ctermfg = colors.black_comment })

-- Search
hl("IncSearch", { ctermbg = colors.white, ctermfg = colors.black, cterm = { bold = true } })
hl("CurSearch", { ctermbg = colors.main, ctermfg = colors.black, cterm = { bold = true } })
hl("Search", { ctermbg = colors.black2, ctermfg = "NONE", cterm = { bold = true } })

-- StatutsLine
hl("StatusLine", { cterm = { bold = true }, ctermbg = colors.black })
hl("StatusLineNC", { ctermbg = colors.black, ctermfg = colors.white })

-- Gitgutter
hl("GitGutterAddLineNr", { ctermfg = colors.black, ctermbg = colors.main, cterm = { bold = true } })
hl("GitGutterChangeLineNr", { ctermfg = colors.black, cterm = { bold = true } })
hl("GitGutterDeleteLineNr", { ctermfg = colors.black, cterm = { standout = true } })
hl("GitGutterChangeDeleteLineNr", { ctermfg = colors.black, ctermbg = colors.black_comment, cterm = { standout = true } })

-- Pmenu
hl("NormalFloat", { cterm = { bold = true }, ctermbg = colors.black, ctermfg = colors.white })
hl("PmenuSel", { cterm = { bold = true }, ctermbg = colors.main, ctermfg = colors.black })

-- Copilot
hl("CopilotSuggestion", { ctermfg = colors.black_comment, })

-- Hop
hl("HopNextKey", { cterm = { bold = true }, ctermfg = colors.main })
hl("HopNextKey1", { cterm = { bold = true }, ctermfg = colors.secondary })
hl("HopNextKey2", { cterm = { bold = true }, ctermfg = colors.white })

-- Diagnostic
hl("DiagnosticHint", { ctermfg = colors.accent })
hl("DiagnosticWarn", { ctermfg = colors.accent })

-- Code syntax related
hl("Identifier", { ctermfg = colors.secondary })
hl("Keyword", { ctermfg = colors.secondary })
hl("Comment", { ctermfg = colors.black_comment, cterm = { italic = true } })
hl("Constant", { ctermfg = colors.main3 })
hl("Float", { ctermfg = colors.accent })
hl("Number", { ctermfg = colors.accent })
hl("Boolean", { ctermfg = colors.secondary2 })
hl("String", { ctermfg = colors.secondary2 })
hl("Operator", { ctermfg = colors.main })
hl("Special", { ctermfg = colors.main3 })
hl("Delimiter", { ctermfg = colors.main })
hl("Function", { ctermfg = colors.main })

-- Python syntax related
hl("@boolean.python", { ctermfg = colors.secondary2 })
hl("@string.documentation.python", {
    ctermfg = colors.black7,
    ctermbg = "NONE",
    italic = true,
    cterm = { italic = true },
})
hl("@variable.python", { ctermfg = colors.white })
hl("@type.python", { ctermfg = colors.main3 })
hl("@variable.parameter.python", { ctermfg = colors.main3 })
hl("@constructor.python", { ctermfg = colors.main3 })
hl("@function.method.call.python", { ctermfg = colors.main2 })
hl("@function.call.python", { ctermfg = colors.main2 })
