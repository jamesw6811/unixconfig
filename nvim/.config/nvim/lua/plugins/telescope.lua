return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
        },
      })
      telescope.load_extension("fzf")
    end,
    keys = {
      { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>sg", "<cmd>Telescope git_files<cr>", desc = "Git files" },
      { "<leader>sr", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>sh", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      { "<leader>sl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer lines" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
    },
  },
}
