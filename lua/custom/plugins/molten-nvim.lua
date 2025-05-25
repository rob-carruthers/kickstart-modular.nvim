return {
  {
    'benlubas/molten-nvim',
    version = '^1.0.0',
    build = ':UpdateRemotePlugins',
    init = function()
      vim.g.molten_output_win_max_height = 12
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
