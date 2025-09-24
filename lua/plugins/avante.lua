return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  commit="2f2aaee3b48340c51f857e75408a3f2695e261a5",
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  config = function()
    require("avante").setup({
      -- debug = true,
      windows = {
        width = 40,
      },
      mode = "agentic",
      --- @class AvanteFileSelectorConfig
      file_selector = {
        provider = "snacks",
        -- Options override for custom providers
        provider_opts = {},
      },
      selector = {
        ---@alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
        provider = "snacks",
        provider_opts = {},
      },
      -- other config
      -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
      -- cursor_applying_provider = 'ollama',
      behaviour = {
        enable_cursor_planning_mode = true,
        enable_claude_text_editor_tool_mode = true,
      },
      provider = "copilot",
      copilot = {
        model = "claude-3.7-sonnet",
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub:get_active_servers_prompt()
      end,
      --The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
      custom_tools = function()
        local mcp_tools = require("mcphub.extensions.avante").mcp_tool()
        return mcp_tools -- Now returns both use_mcp_tool and access_mcp_resource
      end,

      -- You should also add the disabled_tools to avoid conflicts
      disabled_tools = {
        "list_files",
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash",
      },
    })
  end,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
