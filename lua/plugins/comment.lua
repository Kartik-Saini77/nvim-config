return {
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
    config = function()
      require('Comment').setup({
        ---Lines to be ignored while (un)comment
        -- ignores empty lines
        ignore = '^$',
        -- LHS of toggle mappings in NORMAL mode
        toggler = {
          line = 'gcc', -- Line-comment toggle keymap
          block = 'gbc', -- Block-comment toggle keymap
        },
        -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          line = 'gc', -- Line-comment keymap
          block = 'gb', -- Block-comment keymap
        },
        -- LHS of extra mappings
        extra = {
          above = 'gcO', -- Add comment on the line above
          below = 'gco', -- Add comment on the line below
          eol = 'gcA', -- Add comment at the end of line
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = false,
        },
      })
    end
  }
}
