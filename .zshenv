export H_USER=`id -un`
export ZSH=/Users/$H_USER/.oh-my-zsh
export LANG=en_US.UTF-8
export VISUAL=emacs
export EDITOR="$VISUAL"
export NVM_DIR="$HOME/.nvm"
export VAGRANT_DEFAULT_PROVIDER=virtualbox
if test -d $HOME/.poetry; then
	source $HOME/.poetry/env
fi
if test -d /usr/local/opt/openjdk; then
	export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

if test -d ~/.asdf/plugins/golang; then
	. ~/.asdf/plugins/golang/set-env.zsh
  export PATH=${PATH}:`go env GOPATH`/bin
fi
export CC="gcc"
export PATH="/opt/homebrew/bin:$PATH"
