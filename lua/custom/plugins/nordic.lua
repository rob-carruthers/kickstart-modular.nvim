return {
  {
    'AlexvZyl/nordic.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nordic').setup {
        after_palette = function(palette)
          local U = require 'nordic.utils'
          palette.bg = palette.black1
          palette.bg_visual = U.blend(palette.orange.base, palette.bg, 0.15)
        end,
        bold_keywords = true,
        italic_comments = true,
        reduced_blue = true,
        bright_border = true,
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'nordic'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
