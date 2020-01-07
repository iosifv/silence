#!/usr/bin/env sh

echo ' => Writing files ~/.ssh directory'
cp ssh-vault/id_rsa ~/.ssh/id_rsa
cp ssh-vault/id_rsa.pub ~/.ssh/id_rsa.pub
cp ssh-vault/known_hosts ~/.ssh/known_hosts

echo ' => Done.'

