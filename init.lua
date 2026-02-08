-- General Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.virtualedit = "onemore"
vim.keymap.set('n', '<End>', '$l', { noremap = true })

-- Tabs and Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Clipboard
if vim.fn.has("wsl") == 1 and vim.fn.executable("wl-copy") == 1 then
  vim.g.clipboard = {
    name = "wl-clipboard-wsl",
    copy = {
      ["+"] = "wl-copy --type text/plain",
      ["*"] = "wl-copy --primary --type text/plain",
    },
    paste = {
      ["+"] = function()
        return vim.fn.systemlist('wl-paste --no-newline | sed -e "s/\\r$//"')
      end,
      ["*"] = function()
        return vim.fn.systemlist('wl-paste --primary --no-newline | sed -e "s/\\r$//"')
      end,
    },
    cache_enabled = true,
  }
  vim.opt.clipboard = "unnamedplus"
end

-- Mouse Support
vim.opt.mouse = "a"
-- vim.opt.guicursor = "n-v-c-sm:ver25,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Split Management
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.guifont = "MesloLGS NF:h17"  -- You can adjust the size (h14) as needed

-- Go-specific settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = false  -- Go uses tabs, not spaces
    end,
})

-- Keymaps
require("config.keymaps")

-- Lazy Plugins 
require("config.lazy")
