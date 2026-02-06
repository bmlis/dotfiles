return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
        gomod = { "golangcilint" },
        gowork = { "golangcilint" },
      },
    },
  },
  {
    "mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "golangci-lint",
      })
    end,
  },
}
