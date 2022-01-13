sudo apt install tmux
sudo apt install vim
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
#git clone https://github.com/round/CatchMouse.git
sh ./deploy.sh
