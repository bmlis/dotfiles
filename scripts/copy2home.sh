echo '...copying dot.files to home directory'

ln -s $PWD/../.zshrc ~/.
ln -s $PWD/../.gitconfig ~/.
ln -s $PWD/../.vimrc ~/.
ln -s $PWD/../.tmux.conf ~/.
ln -s $PWD/../.aliases ~/.
ln -s $PWD/../.pylintrc ~/.

echo '...finished'
