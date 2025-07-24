return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    {"nvim-lua/plenary.nvim"},

    -- optional picker via telescope
    {"nvim-telescope/telescope.nvim"},
    -- optional picker via fzf-lua
    -- {"ibhagwan/fzf-lua"},
    -- .. or via snacks
    -- {
    --   "folke/snacks.nvim",
    --   opts = {
    --     terminal = {},
    --   }
    -- }
  },
  event = "LspAttach",
  opts = {
    backend = "delta",
    picker = "telescope",
    backend_opts = {
      delta = {
        -- Header from delta can be quite large.
        -- You can remove them by setting this to the number of lines to remove
        header_lines_to_remove = 4,

        -- The arguments to pass to delta
        -- If you have a custom configuration file, you can set the path to it like so:
        -- args = {
        --     "--config" .. os.getenv("HOME") .. "/.config/delta/config.yml",
        -- }
        args = {
          "--line-numbers",
        },
      } 
    }
  },
}
