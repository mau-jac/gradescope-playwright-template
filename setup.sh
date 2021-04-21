#! /bin/bash

apt-get update -y
apt-get upgrade -y

# --- NodeJS Setup --- #

# Install Node binary from nodesource.
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash
apt-get install -y nodejs

# Install firefox dependencies
apt-get install firefox -y

cd /autograder/source

source ~/.bashrc
echo "Verifying version of installed NVM"
command -v npm
which npm

npm i