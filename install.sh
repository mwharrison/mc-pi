#!/usr/bin/env bash

echo -e 'Install type? [basic[b]|kiosk[k]|plex[p]|logging[l]]'
read install_type
echo

if [[ $install_type == server || $install_type == s ]]
then
  sudo apt update && sudo apt full-upgrade
  sudo apt install vim git curl rsync htop -y

  echo -e 'Do you want to ZSH as your default shell or stick with default bash? [z/b]'
  read shell_choice
  echo

  if [[ $shell_choice == z || $shell_choice == Z ]]
  then
    sudo apt install zsh -y

    # install oh-my-zsh and configure plugins
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # change default shell to ZSH
    chsh -s $(which zsh)

    # install symlinks
    ln -sf "$(pwd)/.zshrc" $HOME/.zshrc
    ln -s "$(pwd)/.aliases" $HOME/.aliases
    ln -s "$(pwd)/.zprofile" $HOME/.zprofile
    ln -s "$(pwd)/.zlogout" $HOME/.zlogout
    ln -s "$(pwd)/.p10k.zsh" $HOME/.p10k.zsh


    # optional command line helpers - might work with bash.. but we don't have it the rc file yet
    echo -e 'Do you want to install command helpers (shows you helpful messages if command does not exist)? [y/n]'
    read command_helper_choice
    echo

    if [[ $command_helper_choice == y || $command_helper_choice == Y ]]
    then
      # nifty package that will tell you which package you need if you try to run a command for something not installed
      sudo apt install command-not-found
      sudo apt-file update
      sudo update-command-not-found
    fi

  else
    echo "Sticking to bash.. but adding a few things to make it a better experience!"

    # install oh-my-zsh and configure plugins
    ln -sf "$(pwd)/bash/.bashrc" $HOME/.bashrc
    ln -s "$(pwd)/bash/.bash_aliases" $HOME/.bash_aliases
    ln -s "$(pwd)/bash/.profile" $HOME/.profile # should this be bash_profile?
    ln -s "$(pwd)/bash/.bash_login" $HOME/.bash_login
    ln -s "$(pwd)/bash/.bash_logout" $HOME/.bash_logout
  fi

  if grep Raspberry /proc/cpuinfo; then
    #MOTD setup - I think this is only going to work on raspberry pi.. so we check
    sudo rm /etc/motd

    # nano /etc/ssh/sshd_config
    # PrintLastLog no
    # link the repo info motd to the proper place and make it executable

    sudo ln -sf "$(pwd)/etc/profile.d/motd.sh" /etc/profile.d/motd.sh

    ###
    ### Log2Ram Setup - Helps your poor little Pi SD card not get overwhelmed with logs
    ###
    wget https://github.com/azlux/log2ram/archive/master.tar.gz -O ~/log2ram.tar.gz
    tar xf ~/log2ram.tar.gz -C ~
    cd ~/log2ram-master; sudo ./install.sh; cd ~/mc-pi;
    rm -rf ~/log2ram-master; rm ~/log2ram.tar.gz;
  fi



  # link vimrc styling prefs
  ln -sf "$(pwd)/.vimrc" $HOME/.vimrc

  echo -e 'Do you want to install Github CLI? [y/n]'
  read github_cli_choice
  echo

  if [[ $github_cli_choice == y || $github_cli_choice == Y ]]
  then
    # install github CLI tools (needed to authenticate and push changes from this repo... at least)
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install gh -y
  fi

elif [[ $install_type == 'kiosk' ]]
then
  # install the very basics to get a full screen kiosk chromium browser
  sudo apt-get install --no-install-recommends xserver-xorg x11-xserver-utils xinit openbox -y
  sudo apt-get install --no-install-recommends chromium-browser unclutter -y


# elif [[ $install_type == 'logging' ]]
# then
#   apt install
fi
