---@type LazySpec
return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
  },
  build = "npm install -g mcp-hub@latest",
  event = "User AstroFile",
  cmd = "MCPHub",
  opts = {},
  specs = {
    {
      "olimorris/codecompanion.nvim",
      optional = true,
      opts = {
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              -- MCP Tools
              make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
              add_mcp_prefix_to_tool_names = true, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
              show_result_in_chat = true, -- Show tool results directly in chat buffer

              -- MCP Resources
              make_vars = true, -- Convert MCP resources to #variables for prompts

              -- MCP Prompts
              make_slash_commands = true, -- Add MCP prompts as /slash commands
            },
          },
        },
      },
    },
  },
}
