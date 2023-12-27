#!/bin/bash

mkdir $HOME/.config/pip/
echo "[global]" >> $HOME/.config/pip/pip.conf
echo "break-system-packages = true" >> $HOME/.config/pip/pip.conf
