echo "this is a test"

echo "update pacman..."
sudo pacman -Syyu

echo "installing yay"
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

echo "installing font"
pacman -S ttf-firacode-nerd

echo "installing foot rofi librewolf nvim waybar stow"
pacman -S foot rofi nvim waybar stow
yay -S librewolf-bin



echo "installing kime"
yay -S kime-bin

