return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          { section = "header" },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          {
            icon = " ",
            key = "s",
            desc = "Restore Session",
            action = function()
              require("persistence").load({ last = true })
            end,
            padding = 1,
          },
          { icon = " ", key = "q", desc = "Quit", action = ":qa", padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
