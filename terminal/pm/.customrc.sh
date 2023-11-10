alias m="mkdir"
alias tf="terraform"
alias mcd_project="mcd /tmp/project"
alias mm="micromamba"
alias manb="man -P 'bat -l man'"
alias create-lisp-project="cookiecutter https://github.com/vindarel/cl-cookieproject"
alias p="pacman"
alias xr="xmake && xmake run"
alias zig="/usr/local/bin/zig"
alias chrome="/tmp/project/chrome/chrome"
alias docker="sudo docker"
alias sp="sudo pacman"
alias deno="~/.deno/bin/deno"
alias e="emacs -nw"
alias ec="emacsclient -n"
alias in="sudo pacman -S"
alias out="sudo pacman -Rs"
alias se="pacman -Ss"
alias dow="aria2c -x 15"
alias dbviewer="gobang"
alias kawa="/usr/local/direct/kawa/bin/kawa"
alias kfx="/usr/local/direct/kawa/bin/kfx"

# Js aliases
alias neu="bun x @neutralinojs/neu"
export JAVA_HOME="$(asdf where java)"
export KAWA_HOME="/usr/local/direct/kawa/lib"
alias tinygo="/tmp/project/tinygo/bin/tinygo"
# live reload local websites
alias serve="npx browser-sync start -s -f . --no-notify --host localhost --port 3000"
alias livebook="~/.mix/escripts/livebook"

eval "$(mcfly init zsh)"
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
# export LIBGL_ALWAYS_SOFTWARE=1
export COSMO_FLAG="-g -Os -static -nostdlib -nostdinc -fno-pie -no-pie -mno-red-zone \
  -fno-omit-frame-pointer -pg -mnop-mcount -mno-tls-direct-seg-refs -gdwarf-4 \
  -fuse-ld=bfd -Wl,-T,ape.lds -Wl,--gc-sections \
  -Wl,-z,common-page-size=0x1000 -Wl,-z,max-page-size=0x1000 \
  -include cosmopolitan.h crt.o ape-no-modify-self.o cosmopolitan.a"

export MANPAGER='less -s -M +Gg'

export MARIADB_BIJAY_PASSWORD="bijay00"


export PATH=$PATH:/opt/cosmo/bin
