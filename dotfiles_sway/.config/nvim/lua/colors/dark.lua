local wal = {}
for line in io.lines(os.getenv("HOME") .. "/.cache/wal/colors") do
  table.insert(wal, line)
end

local c = {
  bg        = wal[1],
  fg        = wal[8],
  surface   = wal[1],
  primary   = wal[5],
  secondary = wal[8],
  error     = wal[2],
}

vim.cmd("highlight clear")
vim.o.termguicolors = true
vim.g.colors_name = "mono_black"

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalNC",     { fg = c.fg, bg = c.bg })
hi("CursorLine",   { bg = c.surface })
hi("Visual",       { bg = c.primary, fg = c.fg })
hi("LineNr",       { fg = c.secondary })
hi("CursorLineNr", { fg = c.fg, bold = true })
hi("StatusLine",   { fg = c.fg, bg = c.surface })
hi("ErrorMsg",     { fg = c.error, bold = true })

