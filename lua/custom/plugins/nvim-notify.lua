return {
  {
    'rcarriga/nvim-notify',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = function()
      require('notify').setup {
        stages = 'fade',
        background_colour = 'FloatShadow',
        timeout = 3000,
      }
      vim.notify = require 'notify'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
