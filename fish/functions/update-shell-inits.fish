function update-shell-inits --description "一键更新所有 CLI 工具的静态初始化脚本与 Shell 补全"
    echo "🔄 正在更新 Shell 静态配置与补全..."

    # 1. 静态初始化代码 (统一合并导出到一个干净的文件中)
    begin
        type -q brew; and brew shellenv
        type -q fzf; and fzf --fish
        type -q zoxide; and zoxide init fish
        type -q starship; and starship init fish --print-full-init
    end >~/.config/fish/conf.d/tools-generated.fish

    # 2. 补全脚本 (自动分类放入 completions/ 懒加载目录)
    begin
        set -l path ~/.config/fish/completions
        mkdir -p $path
        type -q uv; and uv generate-shell-completion fish >$path/uv.fish
        type -q uvx; and uvx --generate-shell-completion fish >$path/uvx.fish
        type -q mutagen; and mutagen completion fish >$path/mutagen.fish
    end

    echo "✅ 所有静态配置与补全已更新完毕！"
end
