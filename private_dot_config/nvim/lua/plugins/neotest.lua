return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        runner = "pytest",
        python = ".venv/bin/python",
        args = { "-vv" },
        is_test_file = function(file_path)
          if not vim.endswith(file_path, ".py") then
            return false
          end
          return file_path:match("test_") or file_path:match("tests.py")
        end,
      },
    },
  },
}
