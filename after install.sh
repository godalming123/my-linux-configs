
#apps
sudo apt-update

sudo apt-get install gnome-tweak-tool
sudo apt-get install tilda
sudo apt install python3-pip
sudo apt install code

#flutter (code from: https://flutter.dev/docs/get-started/install/linux#additional-linux-requirements)
sudo snap install flutter --classic
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev
flutter config --enable-linux-desktop

#theming
git clone https://github.com/ZorinOS/zorin-desktop-themes.git
sudo cp -r zorin-desktop-themes/Z\* /usr/share/themes