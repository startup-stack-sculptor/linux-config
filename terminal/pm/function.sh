mcd() {
    mkdir $1
    cd $1
}


bfe() {
    local file
    file=$(fzf --preview-window=80% --preview 'bat --color=always {}' --query="$1" --exit-0)
    [[ -n "$file" ]] && emacsclient -n -a '' "$file"
}

gtc() {
    g clone "$1" --depth 1 --single-branch
}

genpass() {
    openssl rand -base64 "$1"
}

fsearch() {
    find . -iname "*$1*"
}

mvnsearch() {
    curl -s "https://search.maven.org/solrsearch/select?q=$1&rows=$2&wt=json" | jq '.response.docs[].id'
}

http() {
    python -m http.server "$1"
}

cout() {
    if [ -x "$(command -v xclip)" ]; then
        "$@" | tee /dev/tty | xclip -selection clipboard
    else
        echo "xclip is not installed. Please install xclip to use this function."
    fi
}

get_video_duration() {
  if [[ -z "$1" ]]; then
    echo "Please provide a filename as an argument."
    return 1
  fi

  if ! command -v ffprobe &>/dev/null; then
    echo "ffprobe command not found. Please install ffmpeg package."
    return 1
  fi

  duration=$(ffprobe -i "$1" -show_entries format=duration -v quiet -of csv="p=0")
  duration=$(LC_NUMERIC="en_US.UTF-8" printf "%.2f" "$duration")

  echo "Duration of $1: $duration seconds"
}

pydelete() {
    rm -rf ~/.venv/$1
}

pyactivate() {
    local dir="/home/patw/.venv/$1"
    local file="bin/activate"
    
    
    # Check if the directory exists
    if [ -d "$dir" ]; then
	# If the directory exists, source the file
	source "$dir/$file"
    else
	# If the directory doesn't exist, create it and source the file
	python -m venv "$dir"
	source "$dir/$file"
    fi
}


# File: ~/.oh-my-zsh/custom/plugins/mycompletions/_py_completion

# Completion function for pycreate and pyactivate aliases
# This function will suggest options from the ~/.venv directory
_py_completion() {
    local venv_dir="$HOME/.venv"
    local venvs=("$venv_dir"/*(/))

    # Extract only directory names from the full paths
    venvs=("${venvs[@]##*/}")


    compadd -a venvs
}
# Register the completion function for pycreate and pyactivate aliases
compdef _py_completion pyactivate pydelete


git_sparse_checkout() {
    local repo_url="$1"   # The URL of the repository
    local directory="$2"  # The directory to sparse checkout


    # Check if the destination directory exists, if not, create it
    if [ ! -d "$directory" ]; then
        mkdir -p "$directory"
    fi

    # Clone the repository with a shallow depth and sparse checkout
    git clone --depth 1 --single-branch --filter=blob:none "$repo_url" "$directory"

    # Enter the destination directory and perform sparse checkout
    cd "$directory"
    git sparse-checkout init --cone
    git sparse-checkout set "$directory"

    # Clean up unnecessary files
    # git reset --hard HEAD
}

function rmd() {
    local current_dir=$(pwd)
    cd ..
    rm -rf $current_dir 
}


liblocation() {
    ldconfig -p | grep lib$1
}

gtc-n-cout() {
    gtc $1
    cout pwd
}

e.() {
    ec -n .
}


ce() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: compile_with_emacs <project_directory> <compile_command>"
        return 1
    fi

    local project_dir="$1"
    local compile_cmd="$2"

    emacsclient -e "(progn (setq default-directory \"$project_dir\") (compile \"$compile_cmd\"))"
}


send-to-shared() {
    mv $1 ~/VirtualBox VMs/Shared/
}

e.mk() {
    make -f /usr/local/direct/erlang.mk $*
    cp /usr/local/direct/erlang.mk .
}

split-audio-45() {
    ffmpeg -i $1 -f segment -segment_time 2700 -c copy output_%03d.mp3
}


appx() {
    x /usr/local/direct/$1
}

# Define a custom completion function for the "appx" command
_appx() {
    local files
    files=("/usr/local/direct/"*.{tar.gz,tar.xz,zip,7z}(:t))
    compadd -a files
}

# Associate the completion function with the "appx" command
compdef _appx appx


lo() {
    livereload -o 0
}

ariaui() {
    cd /usr/local/direct/webui-aria2/
    lo
}

grantdb() {
    local db_name=$1

    mariadb -e "CREATE DATABASE ${db_name};"
    mariadb -e "show databases;"
    echo "Granting ALL privileges on ${db_name} to bijay"
    mariadb -e "GRANT ALL PRIVILEGES ON ${db_name}.* TO 'bijay'@'localhost';"
    mariadb -e "FLUSH PRIVILEGES;"
    echo "You're good now :)"
}

deno_upgrade() {
    deno upgrade
    objcopy -S ~/.deno/bin/deno ~/.deno/bin/deno_stripped
    mv ~/.deno/bin/deno_stripped ~/.deno/bin/deno
}

aur-clone() {
    git clone https://aur.archlinux.org/$1
    cd $1
    makepkg -s
}

gtc-gh() {
    gtc https://github.com/$1
}
