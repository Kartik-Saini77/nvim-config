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
    local lsp_keymaps = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0}) -- Hover documentation
      vim.keymap.set("n", "<leader>i", vim.lsp.buf.incoming_calls, {buffer = 0})  -- Show incoming calls
      vim.keymap.set("n", "<leader>o", vim.lsp.buf.outgoing_calls, {buffer = 0})  -- Show outgoing calls
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0}) -- Go to definition
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = 0})  -- Go to declaration
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = 0}) -- Show references
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})  -- Go to type definition
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0}) -- Go to implementation
      vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer = 0}) -- Go to next diagnostic
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer = 0}) -- Go to previous diagnostic
      vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer = 0}) -- List diagnostics
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})  -- Rename symbol
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})  -- Code action
      vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, {buffer = 0})  -- Find references
      vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float(nil, {focusable = false, scope = "line", max_width = 80, border = "single"})
      end, {buffer = 0})  -- Show diagnostics in a floating window
    end
    require'lspconfig'.clangd.setup{
      capabilities = capabilities,
      on_attach = lsp_keymaps,
      cmd = { "clangd", "--compile-commands-dir=build" },
      root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
    }
    require'lspconfig'.gopls.setup{
      capabilities = capabilities,
      on_attach = lsp_keymaps,
    }
    require'lspconfig'.pyright.setup{
      capabilities = capabilities,
      on_attach = lsp_keymaps,
    }
  end,
}
