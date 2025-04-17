-- Keep writes in‑place so mtime doesn’t look “external”
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.backupcopy = 'yes'

-- (Optional) auto‑reload changed files and skip the warning
vim.opt.autoread = true
vim.opt.shortmess:append 'W'
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  command = 'checktime',
})
