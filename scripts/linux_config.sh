#!/bin/bash

# This script is used to config the linux and does things like installing necessary softwares and making soft links

# Softwares
# git
if (distribution_is Fedora)
then
	yum install git-core
elif (distribution_is Ubuntu)
then
	sudo apt-get install git-core  git-doc
fi
ssh-keygen -t rsa -c "jeromeyjj@gmail.com"
echo "Add SSH key to GitHub and complete the installation of Git"
read ok

# git config
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

# nautilus-open-terminal
if (distribution_is Fedora)
then
	yum install nautilus-open-terminal
elif (distribution_is Ubuntu)
then
	sudo apt-get install nautilus-open-terminal
fi

# shutter(screen capture)
if (distribution_is Fedora)
then
    yum install shutter
elif (distribution_is Ubuntu)
then
    sudo apt-get install shutter
fi

# chrome
if (distribution_is Fedora)
then
	wget https://dl-ssl.google.com/linux/google-repo-setup.sh -P /tmp
	sudo sh /tmp/google-repo-setup.sh
	yum install google-chrome-stable
elif (distribution_is Ubuntn)
then
	wget https://dl-ssl.google.com/linux/linux_signing_key.pub -P /tmp
	sudo apt-key add /tmp/linux_signing_key.pub
	echo 'deb http://dl.google.com/linux/deb/stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
	sudo apt-get update
	sudo apt-get install google-chrome-stable
fi

# ctags
if (distribution_is Fedora)
then
	yum install exuberant-ctags
elif (distribution_is Ubuntu)
then
	sudo apt-get install exuberant-ctags
fi

# 


# Soft Links
if (distribution_is Fedora)
then
	ln -s gnome-terminal cmd
fi

# Vim Plugins From vim-scripts on GitHub
# neocomplcache
git clone https://github.com/vim-scripts/neocomplcache.git /usr/share/vim/plugins/neocomplcache
# cd /usr/share/vim/plugins/neocomplcache; git pull


function distribution_is
{
	return `cat /etc/issue | grep "$1" > /dev/null 2>&1`
}
