return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
	"williamboman/mason-lspconfig.nvim"
  },
  config = function()
    -- custom hover
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = "single" }
    )

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_keymaps = function(client, bufnr)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = bufnr}) -- Hover documentation
      vim.keymap.set("n", "<leader>i", vim.lsp.buf.incoming_calls, {buffer = bufnr})  -- Show incoming calls
      vim.keymap.set("n", "<leader>o", vim.lsp.buf.outgoing_calls, {buffer = bufnr})  -- Show outgoing calls
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr}) -- Go to definition
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = bufnr})  -- Go to declaration
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = bufnr}) -- Show references
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = bufnr})  -- Go to type definition
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = bufnr}) -- Go to implementation
      vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer = bufnr}) -- Go to next diagnostic
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer = bufnr}) -- Go to previous diagnostic
      vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer = bufnr}) -- List diagnostics
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = bufnr})  -- Rename symbol
      vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, {buffer = bufnr})  -- Find references
      vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float(nil, {focusable = false, scope = "line", max_width = 80, border = "single"})
      end, {buffer = bufnr})  -- Show diagnostics in a floating window
    end
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "gopls", "pyright" },
      automatic_installation = true,
    })

    vim.lsp.config("clangd", {
      capabilities = capabilities,
      on_attach = lsp_keymaps,
      cmd = { "clangd", "--compile-commands-dir=build" },
      root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
    })
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      on_attach = lsp_keymaps,
    })
    vim.lsp.config("gopls", {
      capabilities = capabilities,
      on_attach = lsp_keymaps,
      settings = {
        gopls = {
          gofumpt = true,
          analyses = { unusedparams = true },
          staticcheck = true,
        }
      }
    })
  end,
}
