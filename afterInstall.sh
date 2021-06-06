#!/usr/bin/env bash
echo "enter the command you wold like to use to install packedges. EG: apt-get. :"
read commandToInstallPackadge

installApp(){
    sudo $commandToInstallPackadge install $1
}

update(){
    sudo $commandToInstallPackadge update
}

#apps
echo "------------------------------UPDATING SYSTEM------------------------------"
update

echo "------------------------------INSTALLING APPS-------------------------------"
installApp gnome-tweak-tool
installApp tilda
installApp python3-pip
installApp code

echo "--------------------INSTALLING GNOME SHELL EXTENSIONS-----------------------"
installApp gnome-shell-extension-gsconnect
installApp gnome-shell-extension-hide-activities

#flutter (code from: https://flutter.dev/docs/get-started/install/linux#additional-linux-requirements)
read -p "install flutter? Y/n: " installingFlutter
if installingFlutter == "Y" {
    sudo snap install flutter --classic
    installApp clang cmake ninja-build pkg-config libgtk-3-dev
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