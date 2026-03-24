-- Load core config
require("config.options")
require("config.keybinds")
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ok, _ = pcall(require, "colors.dark")
    if not ok then
      vim.notify("colors.dark_blue not found", vim.log.levels.WARN)
    end
  end,
})
