#!/bin/bash
# Simple setup.sh for configuring Ubuntu 14.04 EC2 instance
# for headless setup.

# Install Git & Curl, Unzip
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y unzip

# Make binary directory
mkdir -p $HOME/bin/

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi

git clone https://github.com/sheaney/dotfiles.git
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
source $HOME/.bashrc

# Install Java
wget -P $HOME/bin/ --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz
tar xvf $HOME/bin/jdk-8u25-linux-x64.tar.gz -C $HOME/bin
ln -sb $HOME/bin/jdk1.8.0_25/bin/java $HOME/bin/java
ln -sb $HOME/bin/jdk1.8.0_25/bin/javac $HOME/bin/javac
chmod a+x $HOME/bin/java
chmod a+x $HOME/bin/javac

# Install activator
wget -P $HOME/bin http://downloads.typesafe.com/typesafe-activator/1.2.12/typesafe-activator-1.2.12.zip
unzip $HOME/bin/typesafe-activator-1.2.12.zip -d $HOME/bin
ln -sb $HOME/bin/activator-1.2.12/activator $HOME/bin/activator
chmod a+x $HOME/bin/activator

# Clean up
rm $HOME/bin/typesafe-activator-1.2.12.zip
rm $HOME/bin/jdk-8u25-linux-x64.tar.gz
