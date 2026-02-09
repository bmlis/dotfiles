return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/Workspace/orgfiles/**/*",
      org_default_notes_file = "~/Workspace/orgfiles/refile.org",
      org_todo_keywords = { "TODO", "CURRENT", "|", "DONE" },
      org_agenda_span = "day",
      org_todo_keyword_faces = {
        CURRENT = ":foreground #90D5FF :weight bold",
      },
      org_capture_templates = {
        t = { description = "Task", template = "* TODO %?\n %u", target = "~/Workspace/orgfiles/todos.org" },
      },
    })
    vim.lsp.enable("org")
  end,
}
