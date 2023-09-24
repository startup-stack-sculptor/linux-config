# less color scheme
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export VCPKG_ROOT="/home/pm/code/.c/vcpkg/"
export GOBIN="$HOME/go/bin"

alias code="unset NODE_OPTIONS && code"

alias source-emsdk="source ~/.asdf/installs/emsdk/3.1.44/emsdk_env.sh"
alias mcd_project="cd /tmp && mcd project"
alias blender="/usr/local/direct/blender/blender"
alias lite="/usr/local/direct/lite-xl/lite-xl"
alias rebar="~/.asdf/installs/elixir/.mix/elixir/1-15/rebar3"
alias dow="aria2c -x 15 $1"
alias mcd=mkcd
alias godot="~/Desktop/Godot"
alias conan-install="conan install . --output-folder=build --build=missing"
alias conan-cmake="cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release"
alias vcpkg-cmake="cmake .. -DCMAKE_TOOLCHAIN_FILE=~/code/.c/vcpkg/scripts/buildsystems/vcpkg.cmake"

alias u="apt purge --auto-remove"
alias e="emacs -nw"
alias ec="emacsclient"
alias E="SUDO_EDITOR=\"emacsclient\" sudo -e"
alias p="python -m http.server"
alias netbeans="/usr/local/direct/netbeans/bin/netbeans"
alias kawa="/usr/local/direct/kawa/bin/kawa"
alias lo="livereload -o 0"

# live reload local websites
alias serve="browser-sync start -s -f . --no-notify --host localhost --port 3000"
alias cockroach="/usr/local/direct/cockroach/cockroach "

# export NODE_OPTIONS=--openssl-legacy-provider
export ANDROID_HOME=~/Android/Sdk
export ANDROID_NDK=~/Android/Sdk/ndk
export GH_URL="https://github.com/startup-stack-sculptor"
export DATABASE_URL="postgresql://bijya:CCOjReABUohF_O_MD5PrcQ@satin-goose-4048.8nk.cockroachlabs.cloud:26257/defaultdb?sslmode=verify-full"
alias cockroach_db_pass="CCOjReABUohF_O_MD5PrcQ"
alias t="touch"
alias wxmaxima="/usr/local/direct/wxmaxima"
alias balena="/usr/local/direct/balenaEtcher"
alias android-studio="/usr/local/direct/android-studio/bin/studio.sh"
alias flutter-reload="~/.utils/flutter-reload.sh"
  
export PATH=$PATH:"$HOME/.pub-cache/bin":"$HOME/.config/composer/vendor/bin":"/opt/fpcup/cross/bin/all-android/bin":"/home/pm/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin":"$HOME/go/bin"

alias lambdanative="/home/pm/Downloads/lambdanative-1.1.1/scripts/lambdanative"

alias METAMASK_PASSWORD='c28b6ad6d27e'
alias OPENAPI_KEY="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"
alias FIVERR="https://www.fiverr.com/jdmishr"
alias GITHUB_URL="https://github.com/startup-stack-sculptor"


