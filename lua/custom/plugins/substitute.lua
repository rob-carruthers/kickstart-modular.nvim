return {
  {
    'gbprod/substitute.nvim',
    config = function()
      require('substitute').setup()
      vim.keymap.set('n', 's', require('substitute').operator, { noremap = true, desc = 'Substitute with motion' })
      vim.keymap.set('n', 'ss', require('substitute').line, { noremap = true })
      vim.keymap.set('n', 'S', require('substitute').eol, { noremap = true })
      vim.keymap.set('x', 's', require('substitute').visual, { noremap = true })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
