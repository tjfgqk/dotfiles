return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "fish-lsp")
    end,
  },

  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       fish_lsp = {},
  --     },
  --   },
  -- },

  -- （可选）确保 Treesitter 自动安装 fish 语法高亮
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     if type(opts.ensure_installed) == "table" then
  --       vim.list_extend(opts.ensure_installed, { "fish" })
  --     end
  --   end,
  -- },
}
