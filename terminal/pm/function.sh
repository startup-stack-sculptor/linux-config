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

extract() {
    if [ -f "$1" ]; then
	case "$1" in
	    *.tar.gz | *.tgz) tar xvfz "$1";;
	    *.tar.bz2) tar xvfj "$1";;
	    *.tar.xz) tar xvfJ "$1";;
	    *.gz) gunzip "$1";;
	    *.bz2) tar xvfz "$1";;
	    *.zip) unzip "$1";;
	    *.rar) unrar x "$1";;
	    *.7z) 7z x "$1";;
	    *) echo "Cannot extract file '$1'";;
	esac     	
    else
	echo "'$1' is not a valid file"
    fi
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
    local dir="/home/pm/.venv/$1"
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
function _py_completion {
    local -a completions
    local cur

    cur=${words[-1]}
    completions=(~/.venv/*(/))

    reply=( "${completions[@]##*/}" )
}

# Register the completion function for pycreate and pyactivate aliases
compctl -K _py_completion pyactivate pydelete


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

lovecopy() {
    cp $1 love-android/app/src/embed/assets
}

love2html() {
    love.js -c game.love html
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


compile_with_emacs() {
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


function split_audio_file() {
  # Get the input arguments
  local input_file=$1
  local output_dir=$2
  local interval=$3

  # Check if the input file exists
  if [[ ! -f "$input_file" ]]; then
    echo "Input file does not exist."
    return 1
  fi

  # Create the output directory if it does not exist
  if [[ ! -d "$output_dir" ]]; then
    mkdir "$output_dir"
  fi

  # Get the duration of the input file
  local duration=$(ffprobe -i "$input_file" -show_entries format=duration -v quiet)

  # Calculate the number of splits
  local num_splits=$(echo "$duration/$interval" | bc)

  # Start splitting the file
  for (( i=0; i<$num_splits; i++ )); do
    local start=$(echo "$interval*$i" | bc)
    local end=$(echo "$interval*($i+1)" | bc)
    local output_file="$output_dir/split-$i.wav"

    ffmpeg -i "$input_file" -ss "$start" -t "$end" "$output_file"
  done
}

