#! /bin/bash

echo "Do you wish to generate a new GPG key?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) gpg --full-generate-key; break;;
        No ) break;;
    esac
done

echo 

# List keys
gpg --list-secret-keys --keyid-format=long

read -sp "GPG Secret Key ID: " keyid
git config --global user.signingkey $keyid
git config --global commit.gpgsign true

# Continue on GitHub
gpg --armor --export $keyid | pbcopy
open https://github.com/settings/gpg/new
