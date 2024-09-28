return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "vendor",
        },
        mappings = {
          n = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          }, -- n
          i = {
            ["<C-h>"] = "which_key",
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          }, -- i
        }, -- mappings
      },
    },
  },
}
