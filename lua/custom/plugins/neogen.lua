return {
  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    keys = {
      {
        '<leader>dg',
        function()
          require('neogen').generate()
        end,
        desc = 'Generate docstring',
      },
    },
    config = function()
      require('neogen').setup {
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = 'numpydoc',
            },
          },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
