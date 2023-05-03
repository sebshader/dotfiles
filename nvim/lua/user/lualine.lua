local custom_16color = require'lualine.themes.16color'

custom_16color.normal.a.bg = 18

require('lualine').setup {
  options = {
    theme = custom_16color,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' }
  }
}
