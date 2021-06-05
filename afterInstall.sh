#!/usr/bin/env bash

#apps
echo "------------------------------UPDATING SYSTEM------------------------------"
sudo apt update

echo "------------------------------INSTALLING APPS-------------------------------"
sudo apt-get install gnome-tweak-tool
sudo apt-get install tilda
sudo apt install python3-pip
sudo apt install code

echo "--------------------INSTALLING GNOME SHELL EXTENSIONS-----------------------"
sudo apt-get install gnome-shell-extension-gsconnect
sudo apt-get install gnome-shell-extension-hide-activities

#flutter (code from: https://flutter.dev/docs/get-started/install/linux#additional-linux-requirements)
read -p "install flutter? Y/n: " installingFlutter
if installingFlutter == "Y" {
sudo snap install flutter --classic
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev
flutter config --enable-linux-desktop}

#thing

codeToInstallThemes = $[
    () => {        
        git clone https://github.com/ZorinOS/zorin-desktop-themes.git
        sudo cp -r zorin-desktop-themes/Z\* /usr/share/themes
    }
]

read -p "select theme \n 0. zorin theme \n" themeNumber
codeToInstallThemes[int themeNumber]()