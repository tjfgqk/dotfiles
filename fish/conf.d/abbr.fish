abbr -a -- l 'ls -l'
abbr -a -- la 'ls -a'
abbr -a -- ll 'ls -al'
abbr -a -- lt 'ls --tree --level=2'
abbr -a -- lg 'ls -l --git'

abbr -a -- v nvim
abbr -a -- brew-upgrade 'brew leaves | xargs brew upgrade; and brew autoremove; and brew cleanup; and update-shell-inits'
abbr -a -- cenv 'python3 -m venv .venv'
abbr -a -- aenv 'source .venv/bin/activate.fish'

abbr -a -- fa fabric-ai
abbr -a -- fat 'fabric-ai -p translate -v lang_code:zh-Hans'
abbr -a -- oc opencode

abbr -a -- mame 'mame -inipath ~/.config/mame'

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr -a dotdot --regex '^\.\.+$' --function multicd

abbr -a -- mp 'mutagen project'
abbr -a -- ms 'mutagen sync'

abbr -a -- proxy 'set -x http_proxy http://127.0.0.1:7897; set -x https_proxy http://127.0.0.1:7897'
