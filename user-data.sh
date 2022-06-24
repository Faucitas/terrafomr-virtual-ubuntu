#!/bin/bash

apt update -y
apt upgrade -y
apt install python3-pip -y
apt install python3-venv -y


pip install django
pip install djangorestframework
