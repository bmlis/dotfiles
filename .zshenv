export H_USER=`id -un`
export ZSH=/Users/$H_USER/.oh-my-zsh
export LANG=en_US.UTF-8
export VISUAL=emacs
export EDITOR="$VISUAL"
export NVM_DIR="$HOME/.nvm"
export VAGRANT_DEFAULT_PROVIDER=virtualbox
if [ -x "$(command -v pyenv)" ]
then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi
if test -d $HOME/.poetry; then
	source $HOME/.poetry/env
fi
if test -d /usr/local/opt/openjdk; then
	export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

if test -d ~/.asdf/plugins/golang; then
	. ~/.asdf/plugins/golang/set-env.zsh
fi
