if [ -d "/opt/homebrew/bin/brew" ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [ ! -z "$ASDF_DATA_DIR" ] || [ -d "$HOME/.asdf" ]; then
	export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi

if [ -d "$HOME/Workspace/Odin" ]; then
  export PATH="$HOME/Workspace/Odin:$PATH"
fi
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH=$PATH:$HOME/.linkerd2/bin
