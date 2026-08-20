return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      preset = "lazy",
      pipe_table = { preset = "round", alignment_indicator = "━" },
      heading = {
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      code = {
        width = "full",
        language_border = " ",
        language_left = "",
        language_right = "",
      },
      checkbox = {
        enabled = true,
      },
      anti_conceal = {
        disabled_modes = { "n" },
      },
      win_options = { concealcursor = { rendered = "nvic" } },
    },
  },
}
