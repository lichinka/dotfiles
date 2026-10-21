#!/bin/bash

#
# Core packages
#
PACKAGES="
    build-essential
    curl
    file
    git
    procps
    rsync
    usbutils
    zsh 

    fido2-tools
    pass
    pcscd
    pcsc-tools
    scdaemon

    brightnessctl
    xbacklight
    xbindkeys
    xinput
    flatpak

    arandr
    i3
    dbus-x11
    dunst
    feh
    libnotify-bin 
    network-manager-gnome
    picom
    rofi
    polybar

    unzip
    zathura

    blueman
    pavucontrol
    pulseaudio-utils

    avahi-daemon
    acpi
    acpid
"
echo "### Installing core packages ..."
sudo apt update 
for p in ${PACKAGES}; do
   if dpkg -s ${p} >/dev/null 2>&1; then
      echo "---> ${p} found. Skipping."
   else
      echo "---> ${p} not found. Installing."
      sudo apt install "${p}"
   fi
done


#
# ZSH
#
echo -n "### Checking oh-my-zsh ... "
OHMYZSH_FOLDER="${HOME}/.oh-my-zsh"
if [[ -d "${OHMYZSH_FOLDER}" ]]; then
   echo "found!"
else
   echo "not found. Installing ..."
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


#
# Ghostty
#
echo -n "### Checking for Ghostty ... "
if command -v ghostty >/dev/null 2>&1; then
   echo "found!"
else
   echo "not found ... installing"
   sudo apt update
   sudo apt install extrepo
   sudo extrepo enable griffo-free
   sudo apt update
   sudo apt install ghostty
fi


#
# HomeBrew
# 
echo -n "### Checking for HomeBrew ... "
if command -v brew >/dev/null 2>&1; then
   echo "found!"
else
   echo "not found ... installing"
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

FORMULA_BREW="
    herdr
    htop
    neovim
    nnn
    pi-coding-agent
"
echo "### Checking HomeBrew packages ... "
for f in ${FORMULA_BREW}; do
   if brew list --formula "${f}" >/dev/null 2>&1; then
      echo "---> ${f} found. Skipping."
   else
      echo "---> ${f} not found. Installing."
      brew install ${f}
   fi   
done

CASK_BREW="
"
for f in ${CASK_BREW}; do
   if brew list --cask "${f}" >/dev/null 2>&1; then
      echo "---> ${f} already installed. Skipping."
   else
      echo "---> Installing ${f} ..."
      brew install --cask ${f}
   fi   
done


#
# Flatpak
# 
echo "### Checking Flatpak packages ... "
FLATPAK="
    com.yubico.yubioath
"
for p in ${FLATPAK}; do
   if flatpak --user list | grep -qF -- "${p}"; then
      echo "---> ${p} found. Skipping."
   else
      echo "---> ${p} not found. Installing."
      flatpak install --user flathub "${p}"
   fi
done

