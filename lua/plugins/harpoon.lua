return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    local list = harpoon:list()

    -- Keymaps
    vim.keymap.set("n", "<leader>a", function()
      list:add()
    end, { desc = "Harpoon add file" })

    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = "Harpoon quick menu" })

    -- Navigate files
    vim.keymap.set("n", "<leader>1", function() list:select(1) end)
    vim.keymap.set("n", "<leader>2", function() list:select(2) end)
    vim.keymap.set("n", "<leader>3", function() list:select(3) end)
    vim.keymap.set("n", "<leader>4", function() list:select(4) end)
    vim.keymap.set("n", "<leader>5", function() list:select(5) end)
    vim.keymap.set("n", "<leader>6", function() list:select(6) end)

    -- Optional: cycle through files
    vim.keymap.set("n", "<C-n>", function() list:next() end)
    vim.keymap.set("n", "<C-p>", function() list:prev() end)
  end,
}
