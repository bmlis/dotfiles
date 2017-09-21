echo '...copying dot.files from home directory'

cp ~/.zshrc ../.
cp ~/.gitconfig ../.
cp ~/.vimrc ../.
cp ~/.tmux.conf ../.
cp ~/.aliases ../.
cp -r ~/.i3/ ../.i3

echo '...finished'
