return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "starlark" })
    opts.highlight = vim.tbl_deep_extend("force", opts.highlight or {}, {
      additional_vim_regex_highlighting = false,
    })
  end,
}
