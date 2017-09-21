echo '...copying dot.files to home directory'

cp ../.zshrc ~/.
cp ../.gitconfig ~/.
cp ../.vimrc ~/.
cp ../.tmux.conf ~/.
cp ../.aliases ~/.
cp -r ../.i3 ~/.

echo '...finished'
