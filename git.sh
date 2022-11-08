#! /bin/bash

read -p "Git Username: " username
read -p "Git Email: " email

# GPG
brew install gnupg
brew install pinentry-mac
brew install diff-so-fancy

mkdir -p ~/.gnupg
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
chown -R $(whoami) ~/.gnupg/
chmod 600 ~/.gnupg/*
chmod 700 ~/.gnupg

# .gitignore
if [ -f ~/.gitignore ]; then
  rm ~/.gitignore
fi
cp .gitignore ~

if [ -f ~/.gitconfig ]; then
  rm ~/.gitconfig
fi
cat <<EOF > ~/.gitconfig
[user]
    email = $email
    name = $username
[color]
    ui = auto
[core]
    precomposeunicode = true
    quotepath = false
    excludesfile = ~/.gitignore
    editor = vim
	pager = diff-so-fancy | less --tabs=4 -RFX
[commit]
    gpgsign = true
[gpg]
    program = $(brew --prefix)/bin/gpg
EOF

# SSH Key
ssh-keygen -t ed25519 -C $email -f ~/.ssh/id_github

eval "$(ssh-agent -s)"

cat <<EOF > ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_github
EOF

ssh-add -K ~/.ssh/id_github

# Continue on GitHub
pbcopy < ~/.ssh/id_github.pub
open https://github.com/settings/ssh/new
