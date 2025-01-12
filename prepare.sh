#!/bin/bash

sudo pacman -Syu
sudo pacman -S --needed git vscode discord keepassxc unzip ntfs-3g flatpak veracrypt base-devel go

git config --global user.name "SyRoxS1"

echo Write your email for git config
read email
git config --global user.email "$email"

# https://github.com/lutris/docs/blob/master/InstallingDrivers.md intel 32 bits driver

sudo pacman -S --needed --noconfirm lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

mkdir ~/workspace

# Installing mullvad from AUR

cd ~/workspace
git clone https://aur.archlinux.org/mullvad-vpn-bin.git 
gpg --recv-key A26581F219C8314C 
cd mullvad-vpn-bin
makepkg


# Regex pattern for the desired file format
PATTERN-MULL="^mullvad-vpn-bin-[0-9]+\.[0-9]+-[0-9]+-x86_64\.pkg\.tar\.zst$"

for file in ~/workspace/mullvad-vpn-bin/*; do
  if [[ $(basename "$file") =~ $PATTERN-MULL ]]; then
    echo "Running file: $file"
    sudo pacman -U --noconfirm "$file"
    break
  fi
done

# Installing yay

cd ~/workspace
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg

PATTERN-YAY="^yay-[0-9]+\.[0-9]+\.[0-9]+-[0-9]+-x86_64\.pkg\.tar\.zst$"
# Loop through all files in the directory
for file in ~/workspace/yay/*; do
  if [[ $(basename "$file") =~ $PATTERN ]]; then
    echo "Running file: $file"
    sudo pacman -U --noconfirm "$file"
    break 
  fi
done

# Installing osu (ofc) it works best with x11 protocol ( as of 12/01/25 )

git clone https://github.com/NelloKudo/osu-winello.git
cd osu-winello
chmod +x ./osu-winello.sh
./osu-winello.sh

