return { -- using lazy.nvim
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    opts = {
      mode = 'buffers',
      always_show_bufferline = true,
    },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers', -- IMPORTANT: shows buffer tabs, not tabpages
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          diagnostics = false,
        },
      }
      vim.o.showtabline = 2
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
