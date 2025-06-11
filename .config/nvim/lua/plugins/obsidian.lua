return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre /Users/deadpixel/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal/**",
    "BufNewFile /Users/deadpixel/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal/**",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    notes = "10-19 Life admin/10 Me/10.02 Scratchpad",
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal/",
      },
    },
    templates = {
      folder = "00-09 Admin/00 Metadata/00.01 Templates",
    },
    daily_notes = {
      folder = "10-19 Life admin/10 Me/10.01 Journal",
      default_tags = { "journal" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "daily",
    },
  },
}
