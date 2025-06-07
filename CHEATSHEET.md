# Cheatsheet

## Common Movements

| Mapping               | Command / Description                |
| --------------------- | ------------------------------------ |
| `h` / `j` / `k` / `l` | Move left / down / up / right        |
| `w` / `b`             | Next / previous word                 |
| `e`                   | End of word                          |
| `0` / `$`             | Start / end of line                  |
| `gg` / `G`            | Top / bottom of file                 |
| `{` / `}`             | Previous / next paragraph            |
| `%`                   | Jump to matching bracket/brace/paren |
| `*` / `#`             | Search next/prev word under cursor   |
| `^`                   | First non-blank character of line    |

## Substitutions

| Command           | Description                            |
| ----------------- | -------------------------------------- |
| `:s/old/new/`     | Replace first 'old' with 'new' on line |
| `:s/old/new/g`    | Replace all 'old' with 'new' on line   |
| `:%s/old/new/g`   | Replace all in file                    |
| `:%s/old/new/gc`  | Replace all with confirmation          |
| `:.,$s/old/new/g` | Replace from current line to end       |

## Window & Buffer Navigation

| Mapping            | Command / Description         |
| ------------------ | ----------------------------- |
| `\\`               | Open Neo-tree file explorer   |
| `<leader><leader>` | List open buffers (Telescope) |

## Todo (Checkmate)

| Mapping      | Command / Description   |
| ------------ | ----------------------- |
| `<leader>Tn` | Create todo item        |
| `<leader>Tt` | Toggle todo item status |
| `<leader>Tc` | Check todo item         |
| `<leader>Tu` | Uncheck todo item       |

## Search (Telescope)

| Mapping      | Command / Description      |
| ------------ | -------------------------- |
| `<leader>sf` | Search files               |
| `<leader>sg` | Live grep                  |
| `<leader>sh` | Search help tags           |
| `<leader>sk` | Search keymaps             |
| `<leader>sd` | Search diagnostics         |
| `<leader>sn` | Search Neovim config files |

## Git (Gitsigns)

| Mapping      | Command / Description    |
| ------------ | ------------------------ |
| `]c` / `[c`  | Next/previous git hunk   |
| `<leader>hs` | Stage hunk               |
| `<leader>hr` | Reset hunk               |
| `<leader>hp` | Preview hunk             |
| `<leader>hb` | Blame line               |
| `<leader>hd` | Diff against index       |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle git blame line    |

## LSP

| Mapping      | Command / Description             |
| ------------ | --------------------------------- |
| `gcc`        | Comment line (normal)             |
| `gc`         | Comment line (visual, line-wise)  |
| `gb`         | Comment line (visual, block-wise) |
| `grn`        | Rename symbol                     |
| `gra`        | Code action                       |
| `grr`        | Find references                   |
| `grd`        | Go to definition                  |
| `gri`        | Go to implementation              |
| `grt`        | Go to type definition             |
| `gO`         | Document symbols                  |
| `gW`         | Workspace symbols                 |
| `<leader>th` | Toggle inlay hints                |

## Formatting & Comments

| Mapping              | Command / Description         |
| -------------------- | ----------------------------- |
| `<leader>f`          | Format buffer                 |
| `gc` (normal/visual) | Toggle comment (Comment.nvim) |

## Multicursor

| Mapping               | Command / Description         |
| --------------------- | ----------------------------- |
| `<up>/<down>`         | Add cursor above/below        |
| `<leader><up>/<down>` | Skip cursor above/below       |
| `<leader>n`           | Add cursor to next match      |
| `<leader>x`           | Delete main cursor            |
| `<esc>`               | Enable/clear multicursor mode |

## Molten.nvim (Jupyter-like)

| Mapping                   | Command / Description     |
| ------------------------- | ------------------------- |
| `<localleader>mi`         | Initialise Molten         |
| `<localleader>e`          | Run operator selection    |
| `<localleader>rl`         | Evaluate line             |
| `<localleader>rr`         | Re-evaluate cell          |
| `<localleader>r` (visual) | Evaluate visual selection |
| `<localleader>rd`         | Delete cell               |
| `<localleader>oh`         | Hide cell output          |
| `<localleader>os`         | Show/enter output         |

## Debugging (DAP)

| Mapping     | Command / Description            |
| ----------- | -------------------------------- |
| `<F5>`      | Start/Continue debugging         |
| `<F1>`      | Step into                        |
| `<F2>`      | Step over                        |
| `<F3>`      | Step out                         |
| `<leader>b` | Toggle breakpoint                |
| `<leader>B` | Set conditional breakpoint       |
| `<F7>`      | See last session result (DAP UI) |
