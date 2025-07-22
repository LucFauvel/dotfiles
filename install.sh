sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth=1 https://github.com/adi1090x/rofi.git ~/git/rofi

cd ~/git/rofi
chmod +x setup.sh
./setup.sh

cd ~

ln -s ~/git/dotfiles/tmux ~/.config/tmux
"source ~/git/dotfiles/.zshrc" >> ~/.zshrc
ln -s ~/git/dotfiles/nvim ~/.config/nvim 
ln -s ~/git/dotfiles/ghostty/config ~/.config/ghostty/config
ln -s ~/git/dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
