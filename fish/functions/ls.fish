function ls --description 'alias ls=eza'
    # 使用 command 关键字是为了防止函数递归调用自身（死循环）
    # --icons: 显示图标 (需要 Nerd Font)
    # --git: 显示文件的 git 状态 (如果是 git 仓库)
    # --group-directories-first: 先列出目录
    command eza --icons --git --group-directories-first $argv
end