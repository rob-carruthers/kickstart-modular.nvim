local function fix_org_metadata()
  -- Get all lines in the current buffer
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local modified = false

  for i, line in ipairs(lines) do
    -- Look for lines with DEADLINE, CLOSED, and SCHEDULED
    if line:match 'DEADLINE:' and line:match 'CLOSED:' and line:match 'SCHEDULED:' then
      -- Extract the different parts
      local deadline = line:match '(DEADLINE: <[^>]*>)'
      local closed = line:match '(CLOSED: %[[^%]]*%])'
      local scheduled = line:match '(SCHEDULED: <[^>]*>)'

      if deadline and closed and scheduled then
        -- Reorder: CLOSED first, then DEADLINE, then SCHEDULED
        local new_line = closed .. ' ' .. deadline .. ' ' .. scheduled

        -- Only update if the line actually changed
        if new_line ~= line then
          lines[i] = new_line
          modified = true
        end
      end
    end
  end

  -- If we made changes, update the buffer
  if modified then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  end
end

-- Create autocommand that runs before writing org files
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.org',
  callback = fix_org_metadata,
  desc = 'Fix org-mode metadata ordering for beorg compatibility',
})

-- Optional: Create a manual command to run the fix
vim.api.nvim_create_user_command('FixOrgMetadata', fix_org_metadata, {
  desc = 'Manually fix org-mode metadata ordering',
})
