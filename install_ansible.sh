#!/usr/bin/env bash
set -e

sudo -E apt update
sudo -E apt install --yes software-properties-common
sudo -E apt-add-repository --yes --update ppa:ansible/ansible
sudo -E apt install --yes ansible
