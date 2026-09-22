#!/usr/bin/env fish

set -l required_tools \
    nvim fd fzf eza rg \
    lazygit delta \
    yazi

set -l missing_tools (for tool in $required_tools; type -q $tool; or echo $tool; end)

if test (count $missing_tools) -gt 0
    echo (set_color red)"[错误] 缺少以下工具，请先安装：" (set_color normal)
    for tool in $missing_tools
        echo "  - $tool"
    end
    exit 1
end

echo (set_color green)"✔ 依赖检查通过，开始初始化..." (set_color normal)

# fish
update-shell-inits
fish_config theme save catppuccin-mocha

ya pkg add "yazi-rs/flavors:catppuccin-mocha"
