sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/git/dotfiles/tmux ~/.config/tmux
"source ~/git/dotfiles/.zshrc" >> ~/.zshrc
ln -s ~/git/dotfiles/nvim ~/.config/nvim 
ln -s ~/git/dotfiles/ghostty/config ~/.config/ghostty/config
ln -s ~/git/dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
