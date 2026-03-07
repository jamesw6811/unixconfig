return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "lua", "python", "typescript", "javascript", "tsx", "json",
          "html", "css", "rust", "ruby", "markdown", "markdown_inline",
          "yaml", "toml", "bash", "just", "vim", "vimdoc",
        },
      })
    end,
  },
}
