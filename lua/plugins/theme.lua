return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      })
      vim.cmd[[colorscheme tokyonight-night]]
    end,
  },
}

-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     opts = {
--       flavour = "mocha",           -- or latte, frappe, macchiato, mocha
--       transparent_background = false,
--       term_colors = false,
--       dim_inactive = {
--         enabled = false, -- dims the background color of inactive window
--         shade = "dark",
--         percentage = 0.15, -- percentage of the shade to apply to the inactive window
--       },
--       styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--       },
--       default_integrations = true,
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         treesitter = true,
--         mini = {
--           enabled = true,
--           indentscope_color = "",
--         },
--       },
--     },
--     config = function(_, opts)
--       require("catppuccin").setup(opts)
--       vim.cmd.colorscheme("catppuccin")
--     end,
--   },
-- }
