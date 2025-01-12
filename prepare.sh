sudo pacman -Syu
sudo pacman -S --needed git vscode discord keepassxc unzip ntfs-3g flatpak

git config --global user.name "SyRoxS1"

echo Write your email for git config
read email
git config --global user.email "$email"

# https://github.com/lutris/docs/blob/master/InstallingDrivers.md intel 32 bits driver

sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

mkdir ~/workspace

# Installing osu (ofc)

git clone https://github.com/NelloKudo/osu-winello.git
cd osu-winello
chmod +x ./osu-winello.sh
./osu-winello.sh

