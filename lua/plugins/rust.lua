return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  ft = { "rust" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
  },
  config = function()
    -- reuse your existing lsp_keymaps
    local lsp_keymaps = require("plugins.lsp").lsp_keymaps

    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          -- enable native inlay hints (modern API)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
            check = { command = "clippy" },
            procMacro = { enable = true },
          },
        },
      },

      dap = {
        adapter = function()
          return {
            type = "server",
            port = "${port}",
            executable = {
              command = "codelldb",
              args = { "--port", "${port}" },
            },
          }
        end,
      },
    }

    -- Rust-specific keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "rust",
      callback = function()
        vim.keymap.set("n", "<leader>rr", ":!cargo run<CR>", { buffer = true })
        vim.keymap.set("n", "<leader>rb", ":!cargo build<CR>", { buffer = true })
        vim.keymap.set("n", "<leader>rt", ":!cargo test<CR>", { buffer = true })
        vim.keymap.set("n", "<leader>rf", ":!cargo fmt<CR>", { buffer = true })
        vim.keymap.set("n", "<leader>dc", function()
          require("dap").continue()
        end, { buffer = true })
      end,
    })
  end,
}
