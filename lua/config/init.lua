local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")

local opts = {
  defaults = {
    colorscheme = { "onedark" }
  },

  change_detection = {
    notify = true,
  },
}

require("lazy").setup("plugins", opts)
require("config.keymaps")
