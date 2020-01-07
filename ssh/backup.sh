#!/usr/bin/env sh

echo ' => Creating archive of ~/.ssh'
tar cvzf ssh-vault.tar.gz -C ~/.ssh .

echo ' => Encrypting archive'
gpg -c ssh-vault.tar.gz 

echo ' => Removing archive file'
rm ssh-vault.tar.gz

echo ' => Done.'