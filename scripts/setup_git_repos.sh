echo '...cloning gnome terminal colors'
git clone https://github.com/gnumoksha/gnome-terminal-colors ~/Customization/gnome-terminal-colors

echo '...cloning vundle'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo '...cloning powerline fonts'
git clone https://github.com/powerline/fonts ~/Customization/fonts;
echo '...installing powerline fonts'
cd ~/Customization/fonts;./install.sh;

echo '...finished'

