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
        python = function()
          return vim.fn.exepath("python3") or vim.fn.exepath("python")
        end,
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
