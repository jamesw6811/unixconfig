return {
  -- avante.nvim: Cursor-like AI with Claude Code (Max) and Ollama (offline)
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "MeanderingProgrammer/render-markdown.nvim",
    },
    config = function()
      require("avante").setup({
        -- Default to Claude Code (uses your Max subscription)
        provider = "claude-code",
        claude_code = {
          command = "claude",
        },
        -- Ollama for offline use
        providers = {
          ollama = {
            __inherited_from = "openai",
            endpoint = "http://127.0.0.1:11434/v1",
            model = "qwen2.5-coder:7b",
            api_key_name = "",
          },
        },
      })

      -- Toggle between online (Claude Code) and offline (Ollama)
      vim.api.nvim_create_user_command("AIOnline", function()
        require("avante.config").override({ provider = "claude-code" })
        vim.notify("AI: Claude Code (online)", vim.log.levels.INFO)
      end, {})

      vim.api.nvim_create_user_command("AIOffline", function()
        require("avante.config").override({ provider = "ollama" })
        vim.notify("AI: Ollama (offline)", vim.log.levels.INFO)
      end, {})

      vim.api.nvim_create_user_command("AIToggle", function()
        local current = require("avante.config").provider
        if current == "claude-code" then
          vim.cmd("AIOffline")
        else
          vim.cmd("AIOnline")
        end
      end, {})
    end,
    keys = {
      { "<leader>aa", "<cmd>AvanteAsk<cr>", mode = { "n", "v" }, desc = "AI Ask" },
      { "<leader>ac", "<cmd>AvanteChat<cr>", mode = { "n", "v" }, desc = "AI Chat" },
      { "<leader>ae", "<cmd>AvanteEdit<cr>", mode = "v", desc = "AI Edit selection" },
      { "<leader>at", "<cmd>AIToggle<cr>", desc = "Toggle online/offline AI" },
    },
  },
  -- llama.vim: offline ghost-text autocomplete (disabled by default)
  {
    "ggml-org/llama.vim",
    enabled = true,
    init = function()
      vim.g.llama_enabled = 0

      vim.api.nvim_create_user_command("LlamaEnable", function()
        vim.g.llama_enabled = 1
        vim.notify("llama.vim: enabled (start llama-server if needed)", vim.log.levels.INFO)
      end, {})

      vim.api.nvim_create_user_command("LlamaDisable", function()
        vim.g.llama_enabled = 0
        vim.notify("llama.vim: disabled", vim.log.levels.INFO)
      end, {})
    end,
    keys = {
      { "<leader>al", "<cmd>LlamaEnable<cr>", desc = "Enable llama autocomplete" },
      { "<leader>aL", "<cmd>LlamaDisable<cr>", desc = "Disable llama autocomplete" },
    },
  },
}
