-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window', -- your custom close key
          ['<cr>'] = 'open',       -- default: opens in current window (but still creates buffer)
          ['s'] = 'open_split',    -- open in horizontal split (new buffer)
          ['v'] = 'open_vsplit',   -- open in vertical split (new buffer)
          ['t'] = 'open_tabnew',   -- open in new tab page
        },
      },
      follow_current_file = { enabled = true }, -- optional but nice
      hijack_netrw_behavior = 'open_default',   -- recommended
    },
  },
}
