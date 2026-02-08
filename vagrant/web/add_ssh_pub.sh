#!/bin/sh

# Script der einen unter der Variable public_key definierten ssh public-key zum Einloggen
# ohne Passwort im authorized_keys File vom user Vagrant und dem root Account speichert

# hier den eigenen public-key eintragen
public_key='add here your public key'

# add public key for usr vagrant
echo $public_key >> /home/vagrant/.ssh/authorized_keys

# add public key for root
mkdir /root/.ssh && chmod 700 /root/.ssh
echo $public_key >> /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

