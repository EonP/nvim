local M = {}

M.enabled = false
M.augroup = vim.api.nvim_create_augroup("AutoSaveToggle", { clear = true })

M.enable = function()
  vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    group = M.augroup,
    callback = function()
      if vim.bo.modified then vim.cmd("silent write") end
    end,
  })
  M.enabled = true
  vim.notify("✅ Autosave enabled", vim.log.levels.INFO)
end

M.disable = function()
  vim.api.nvim_clear_autocmds({ group = M.augroup })
  M.enabled = false
  vim.notify("⛔ Autosave disabled", vim.log.levels.INFO)
end

M.toggle = function()
  if M.enabled then
    M.disable()
  else
    M.enable()
  end
end

return M
