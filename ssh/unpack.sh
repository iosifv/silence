#!/usr/bin/env sh

echo ' => Decrypting vault...'
gpg ssh-vault.tar.gz.gpg

echo ' => Unarchiving to folder'
rm -rf ssh-vault 
mkdir ssh-vault 
cd ssh-vault 
tar xvzf ./../ssh-vault.tar.gz 
cd ..

echo ' => Removing archive'
rm ssh-vault.tar.gz

echo ' => Done.'