-- 左 option 映射为 meta
vim.g.neovide_input_macos_option_key_is_meta = "only_left"

-- 添加 cmd + v 粘贴
local function paste()
  vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end
vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })

-- 启动 Neovide 时禁用 IME，确保初始进入 Normal 模式时不会唤起输入法
vim.g.neovide_input_ime = false

-- 以下摘自官方文档, 仅在插入模式启用 IME
local function set_ime(args)
  if args.event:match("Enter$") then
    vim.g.neovide_input_ime = true
  else
    vim.g.neovide_input_ime = false
  end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  group = ime_input,
  pattern = "*",
  callback = set_ime,
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
  group = ime_input,
  pattern = "[/\\?]",
  callback = set_ime,
})

-- 补丁：文件保存后强制关闭 IME（防止 Ctrl+S 等保存动作绕过 InsertLeave）
vim.api.nvim_create_autocmd("BufWritePost", {
  group = ime_input,
  pattern = "*",
  callback = set_ime,
})

-- 补丁：终端专属事件（确保进入/关闭 Terminal 窗口时状态同步）
vim.api.nvim_create_autocmd({ "TermEnter", "TermLeave", "TermClose" }, {
  group = ime_input,
  pattern = "*",
  callback = set_ime,
})

-- 解决 IME 显示问题
local ns = vim.api.nvim_create_namespace("ime_preedit")

---@diagnostic disable-next-line: undefined-global
neovide.preedit_handler = function(preedit_raw_text, _, _)
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

  if preedit_raw_text == "" then
    return
  end

  local cursor = vim.api.nvim_win_get_cursor(0)

  vim.api.nvim_buf_set_extmark(0, ns, cursor[1] - 1, cursor[2], {
    virt_text = {
      { preedit_raw_text, "Visual" },
    },
    virt_text_pos = "overlay",
  })
end
