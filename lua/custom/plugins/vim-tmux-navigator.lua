if os.getenv 'TMUX' then
  TMUX_NAVIGATOR_ENABLED = true
else
  TMUX_NAVIGATOR_ENABLED = false
end

return {
  {
    'christoomey/vim-tmux-navigator',
    enabled = TMUX_NAVIGATOR_ENABLED,
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
