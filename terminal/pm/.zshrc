# less color scheme
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export VCPKG_ROOT="/home/pm/code/.c/vcpkg/"

alias conan-install="conan install . --output-folder=build --build=missing"
alias conan-cmake="cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release"
alias vcpkg-cmake="cmake .. -DCMAKE_TOOLCHAIN_FILE=~/code/.c/vcpkg/scripts/buildsystems/vcpkg.cmake"

activate_env() {
    source ~/.venv/"$1"/bin/activate
}
alias deno="~/.deno/bin/deno"
alias u="apt purge --auto-remove"
alias e="emacs -nw"
alias ec="emacsclient"
alias E="SUDO_EDITOR=\"emacsclient\" sudo -e"
alias p="python -m http.server"
alias npx="bun x"
alias netbeans="/usr/local/direct/netbeans/bin/netbeans"
alias kawa="~/Downloads/kawa-3.1.1/bin/kawa"

# live reload local websites
alias serve="browser-sync start -s -f . --no-notify --host localhost --port 3000"
alias cockroach="/usr/local/direct/cockroach/cockroach "

export NODE_OPTIONS=--openssl-legacy-provider
export ANDROID_HOME=~/Android/Sdk
export DOTNET_ROOT=~/.asdf/installs/dotnet/7.0.203
export DATABASE_URL="postgresql://bijya:CCOjReABUohF_O_MD5PrcQ@satin-goose-4048.8nk.cockroachlabs.cloud:26257/defaultdb?sslmode=verify-full"
alias cockroach_db_pass="CCOjReABUohF_O_MD5PrcQ"
alias t="touch"
alias wxmaxima="/usr/local/direct/wxmaxima"
alias balena="/usr/local/direct/balenaEtcher"
alias android-studio="/usr/local/direct/android-studio/bin/studio.sh"
alias flutter-reload="~/.utils/flutter-reload.sh"
export PATH=$PATH:"$HOME/.pub-cache/bin":"$HOME/.dotnet/tools":"$HOME/.config/composer/vendor/bin"

alias lambdanative="/home/pm/Downloads/lambdanative-1.1.1/scripts/lambdanative"
manswitch () { man $1 | less -p "^ +$2"}

alias METAMASK_PASSWORD='c28b6ad6d27e'
alias OPENAPI_KEY="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"

function fe() {
    local file
    file=$(fzf --preview-window=80% --preview 'bat --color=always {}' --query="$1" --exit-0)
    [[ -n "$file" ]] && emacsclient -n -a '' "$file"
}

