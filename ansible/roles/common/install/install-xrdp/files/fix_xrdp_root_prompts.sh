#!/bin/bash

## Enable new_cursors, fixes a common issue with cursors over RDP
sudo sed -e 's/^new_cursors=true/new_cursors=false/g' -i /etc/xrdp/xrdp.ini

## Restart xrdp service
sudo systemctl enable xrdp
sudo systemctl restart xrdp

## Set remote session to KDE Plasma
echo "/usr/bin/startplasma-x11" > "/home/{{ remote_host_user }}/.xsession"

## Set env vars to define paths where desktop files reside
export D=/usr/share/plasma:/usr/local/share:/usr/share:/var/lib/snapd/desktop
export C=/etc/xdg/xdg-plasma:/etc/xdg
export C=${C}:/usr/share/kubuntu-default-settings/kf5-settings

if ! grep -q "export XDG_SESSION_DESKTOP=KDE" "/home/{{ remote_host_user }}/.xsessionrc"; then
    echo "export XDG_SESSION_DESKTOP=KDE" >> ""/home/{{ remote_host_user }}/.xsessionrc""
fi

if ! grep -q "export XDG_DATA_DIRS=${D}" "/home/{{ remote_host_user }}/.xsessionrc"; then
    echo "export XDG_DATA_DIRS=${D}" >> "/home/{{ remote_host_user }}/.xsessionrc"
fi

if ! grep -q "export XDG_CONFIG_DIRS=${C}" "/home/{{ remote_host_user }}/.xsessionrc"; then
    echo "export XDG_CONFIG_DIRS=${C}" >> "/home/{{ remote_host_user }}/.xsessionrc"
fi

## Restart xrdp service
sudo systemctl restart xrdp
