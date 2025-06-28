return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/Sync/orgfiles/**/*',
        org_default_notes_file = '~/Sync/orgfiles/refile.org',
        org_log_into_drawer = nil,
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
