sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~

ln -s ~/git/dotfiles/tmux ~/.config/tmux
echo "source ~/git/dotfiles/.zshrc" >> ~/.zshrc
ln -s ~/git/dotfiles/nvim ~/.config/nvim
ln -s ~/git/dotfiles/ghostty/config ~/.config/ghostty/config

# Linux-only (Arch + Hyprland desktop). Skipped on macOS.
if [ "$(uname -s)" = "Linux" ]; then
  git clone --depth=1 https://github.com/adi1090x/rofi.git ~/git/rofi
  cd ~/git/rofi
  chmod +x setup.sh
  ./setup.sh
  cd ~

  ln -s ~/git/dotfiles/hypr/hyprland.lua ~/.config/hypr/hyprland.lua

  mkdir -p ~/.config/dunst
  ln -s ~/git/dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc

  mkdir -p ~/.config/waybar
  ln -s ~/git/dotfiles/waybar/config ~/.config/waybar/config
  ln -s ~/git/dotfiles/waybar/style.css ~/.config/waybar/style.css
  ln -s ~/git/dotfiles/waybar/scripts ~/.config/waybar/scripts
fi
