genpass() {
    openssl rand -base64 "$1"
}

fsearch() {
    find . -iname "*$1*"
}

extract() {
    if [ -f "$1" ]; then
	case "$1" in
	    *.tar.gz) tar xvfz "$1";;
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
