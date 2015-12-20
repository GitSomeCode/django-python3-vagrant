#!/bin/bash

# Install git for version control, pip for install python packages
echo 'Installing git, Python 3, and pip...'
sudo apt-get -qq install git python3 python3-pip > /dev/null 2>&1

# Install virtualenv / virtualenvwrapper
echo 'Installing and configuring virtualenv and virtualenvwrapper...'
sudo pip3 install --quiet virtualenvwrapper==4.7.0
mkdir ~vagrant/.virtualenvs
chown vagrant:vagrant ~vagrant/.virtualenvs
printf "\n\n# Virtualenv settings\n" >> ~vagrant/.bashrc
printf "export PYTHONPATH=/usr/lib/python3.4" >> ~vagrant/.bashrc
printf "export WORKON_HOME=~vagrant/.virtualenvs\n" >> ~vagrant/.bashrc
printf "export PROJECT_HOME=/vagrant\n" >> ~vagrant/.bashrc
printf "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.4\n" >> ~vagrant/.bashrc
printf "source /usr/local/bin/virtualenvwrapper.sh\n" >> ~vagrant/.bashrc

# Some useful aliases for getting started, MotD
echo 'Setting up message of the day, and some aliases...'
cp /vagrant/examples/motd.txt /etc/motd
printf "alias menu='cat /etc/motd'\n" >> ~vagrant/.bashrc
printf "alias runserver='python manage.py runserver 0.0.0.0:8000'\n" >> ~vagrant/.bashrc

# Complete
echo ""
echo "Vagrant install complete."
echo "Now try logging in:"
echo "    $ vagrant ssh"

