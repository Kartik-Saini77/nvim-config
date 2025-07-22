return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        goimports = 'gopls', -- if set to 'gopls' will use golsp format
        gofmt = 'gopls', -- if set to gopls will use golsp format
        tag_transform = false,
        test_dir = '',
        comment_placeholder = '   ',
        lsp_cfg = false, -- false: use your own lspconfig
        lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = nil, -- use on_attach from gopls
        dap_debug = true,
      })
      
      -- Go-specific keymaps
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go test", buffer = true })
          vim.keymap.set("n", "<leader>gT", "<cmd>GoTestFile<CR>", { desc = "Go test file", buffer = true })
          vim.keymap.set("n", "<leader>ga", "<cmd>GoAlternate<CR>", { desc = "Go alternate", buffer = true })
          vim.keymap.set("n", "<leader>gi", "<cmd>GoImports<CR>", { desc = "Go import", buffer = true })
          vim.keymap.set("n", "<leader>gf", "<cmd>GoFmt<CR>", { desc = "Go format", buffer = true })
          vim.keymap.set("n", "<leader>gr", "<cmd>GoRun<CR>", { desc = "Go run", buffer = true })
        end,
      })
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}
