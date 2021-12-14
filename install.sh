

echo 'Install type? [kiosk|server|media]'

[//]: # (common installs)
apt update
apt install vim
apt install zsh
apt install git

# nifty package that will tell you which package you need if you try to run a command for something not installed
apt install command-not-found
apt-file update
update-command-not-found

[//]: # install oh-my-zsh and configure plugins
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

[//]: # change default shell to ZSH
chsh -s $(which zsh)

#MOTD setup
rm /etc/motd

# nano /etc/ssh/sshd_config
# PrintLastLog no
# link the repo info motd to the proper place and make it executable

ls -s /etc/profile.d/motd.sh /etc/profile.d/motd.sh
chmod +x /etc/profile.d/motd.sh


[//]: # install oh-my-zsh and configure plugins
ln -s .zshrc $HOME/.zshrc
ln -s .aliases $HOME/.zshrc
ln -s .zprofile $HOME/.zprofile
ln -s .zlogout $HOME/.zlogout

[//]: # (if kiosk)
apt-get --no-install-recommends install xserver-xorg xserver-xorg-video-fbdev xinit pciutils xinput xfonts-100dpi xfonts-75dpi xfonts-scalable chromium
