vim.o.termguicolors = false

vim.g.colors = {
    fg = 7,
    bg = 16,
    fg_bright = 15,

    alt = 0,
    accent = 1,
    main = 2,

    accent_bright = 9,
    main_bright = 10,

    muted = 118,
    comment = 125,
    subtle = 150,
    gray = 160,
    prominent = 199,
}
local colors = vim.g.colors

local function hl(group_name, opts)
    vim.api.nvim_set_hl(0, group_name, opts)
end

hl("CursorLine", { ctermbg = colors.alt })
hl("CursorLineNR", { ctermfg = colors.prominent, cterm = { bold = true } })
hl("LineNr", { ctermfg = colors.muted })
hl("Visual", { ctermbg = colors.fg, ctermfg = colors.alt })
hl("ExtraWhitespace", { ctermbg = colors.alt, ctermfg = colors.fg })
hl("MatchParen", { ctermbg = colors.main, ctermfg = colors.alt })
hl("Normal", { ctermfg = colors.fg })
hl("NonText", { ctermfg = colors.comment })
hl("Error", { ctermfg = colors.accent_bright })
hl("Ignore", { ctermbg = colors.alt, ctermfg = colors.fg })
hl("Statement", { ctermfg = colors.gray })
hl("Todo", { ctermfg = colors.accent })
hl("Type", { ctermfg = colors.fg })
hl("Special", { ctermfg = colors.gray })

hl("WinSeparator", { ctermbg = colors.alt, ctermfg = colors.alt })
hl("ColorColumn", { ctermbg = colors.alt })

-- Search
hl("IncSearch", { ctermbg = colors.fg, ctermfg = colors.alt, cterm = { bold = true } })
hl("CurSearch", { ctermbg = colors.main, ctermfg = colors.alt, cterm = { bold = true } })
hl("Search", { ctermbg = colors.black2, ctermfg = "NONE", cterm = { bold = true } })

-- StatusLine
hl("StatusLine", { cterm = { bold = true }, ctermbg = colors.alt })
hl("StatusLineNC", { ctermbg = colors.alt, ctermfg = colors.fg })

-- Gitgutter
hl("GitGutterAddLineNr", { ctermfg = colors.alt, ctermbg = colors.main, cterm = { bold = true } })
hl("GitGutterChangeLineNr", { ctermfg = colors.alt, cterm = { bold = true } })
hl("GitGutterDeleteLineNr", { ctermfg = colors.alt, cterm = { standout = true } })
hl("GitGutterChangeDeleteLineNr", { ctermfg = colors.alt, ctermbg = colors.comment, cterm = { standout = true } })

-- Pmenu
hl("NormalFloat", { cterm = { bold = true }, ctermbg = colors.alt, ctermfg = colors.fg })
hl("PmenuSel", { cterm = { bold = true }, ctermbg = colors.main, ctermfg = colors.alt })

-- Copilot
hl("CopilotSuggestion", { ctermfg = colors.muted })

-- Hop
hl("HopNextKey", { cterm = { bold = true }, ctermfg = colors.main })
hl("HopNextKey1", { cterm = { bold = true }, ctermfg = colors.subtle })
hl("HopNextKey2", { cterm = { bold = true }, ctermfg = colors.fg })

-- Diagnostic
hl("DiagnosticHint", { ctermfg = colors.subtle })
hl("DiagnosticWarn", { ctermfg = colors.accent })

-- Code syntax
hl("Keyword", { ctermfg = colors.subtle })
hl("Comment", { ctermfg = colors.comment, cterm = { italic = true } })
hl("Constant", { ctermfg = colors.main })
hl("Float", { ctermfg = colors.main })
hl("Number", { ctermfg = colors.main })
hl("Boolean", { ctermfg = colors.main })
hl("String", { ctermfg = colors.main })
hl("Identifier", { ctermfg = colors.fg })
hl("Operator", { ctermfg = colors.prominent })
hl("Delimiter", { ctermfg = colors.prominent })

-- Telescope
hl("TelescopeBorder", { ctermfg = colors.muted })
hl("TelescopePreviewBorder", { ctermfg = colors.muted })
hl("TelescopePromptBorder", { ctermfg = colors.muted })
hl("TelescopeResultsBorder", { ctermfg = colors.muted })
hl("TelescopePreviewLine", { ctermbg = colors.alt })
hl("TelescopeSelection", { ctermbg = colors.alt, ctermfg = colors.fg_bright })
hl("TelescopeMatching", { ctermfg = colors.main })

-- Python
hl("@boolean.python", { ctermfg = colors.main })
hl("@string.documentation.python", {
    ctermfg = colors.subtle,
    ctermbg = "NONE",
    cterm = { italic = true },
})
hl("@variable.python", { ctermfg = colors.fg })
hl("@variable.parameter.python", { ctermfg = colors.fg })
hl("@type.python", { ctermfg = colors.prominent })
hl("@type.builtin.python", { ctermfg = colors.main })
hl("@constant.builtin.python", { ctermfg = colors.main })
hl("@module.builtin.python", { ctermfg = colors.subtle })
hl("@constant.python", { ctermfg = colors.fg })
hl("@constructor.python", { ctermfg = colors.prominent })
hl("@function.method.call.python", { ctermfg = colors.prominent })
hl("@function.method.python", { ctermfg = colors.prominent })
hl("@function.call.python", { ctermfg = colors.prominent })
hl("@function.python", { ctermfg = colors.prominent })
hl("@function.builtin.python", { ctermfg = colors.gray })
