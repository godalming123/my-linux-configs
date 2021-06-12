#!/usr/bin/env bash
clear
read -p "pacadge manager: " packadgeManager

runIfBool(){
    read -p "$1 y/N: " response
    if [ $response == "y" ]; then $2; fi
}

installApp(){
    runIfBool "install $1?" "sudo $packadgeManager install $1"
}

update(){
    sudo $packadgeManager update
}

#apps
echo "==============================UPDATING SYSTEM=============================="
update

echo "==============================INSTALLING APPS=============================="
installApp gnome-tweak-tool
installApp tilda
installApp python3-pip
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
installApp codium

echo "====================INSTALLING GNOME SHELL EXTENSIONS======================"
installApp gnome-shell-extension-gsconnect

#flutter (code from: https://flutter.dev/docs/get-started/install/linux#additional-linux-requirements)
runIfBool "install flutter?" '
  sudo snap install flutter --classic
  installApp "clang cmake ninja-build pkg-config libgtk-3-dev"
'

#thing
bitarray>codeToInstallThemes = (
    ["Zorin"] = '
        git clone https://github.com/ZorinOS/zorin-desktop-themes.git
        sudo cp -r zorin-desktop-themes/Z\* /usr/share/themes
    '
]
bitarray>select themeToInstall in !codeToInstallThemes[*]
do
    codeToInstallThemes["$themeToInstall"]
done
