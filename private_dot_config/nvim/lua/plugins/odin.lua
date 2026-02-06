return {
  {
    "Tetralux/odin.vim",
    ft = "odin",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = opts.ensure_installed or {}
      -- You can keep "ols" here; if Mason can't install it, we'll polyfill below.
      if not vim.tbl_contains(opts.ensure_installed, "ols") then
        table.insert(opts.ensure_installed, "ols")
      end
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.ols = {}
    end,
  },
}
