return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = {
            -- 动态设置是否预选第一项：处于 snippet 状态时不预选
            preselect = function(ctx)
              return not require("blink.cmp").snippet_active({ direction = 1 })
            end,
          },
        },
      },
      keymap = {
        preset = "super-tab",
      },
    },
  },
}
