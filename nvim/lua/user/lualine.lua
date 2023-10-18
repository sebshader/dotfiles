local custom_16color = require'lualine.themes.16color'

custom_16color.terminal = {
    a = {bg = 51}
}

custom_16color.normal.a.bg = 18
custom_16color.normal.a.fg = 255
custom_16color.insert.a.fg = 255
custom_16color.visual.a.fg = 255
custom_16color.replace.a.fg = 255
custom_16color.inactive.a.fg = 255

require('lualine').setup {
  options = {
    theme = custom_16color,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' }
  }
}
