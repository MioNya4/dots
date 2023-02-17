#!/bin/sh

# disables Nvidia graphics card's power
# require bbswitch

cat /mnt/uwu/4C/zbin/ite/ite.nvidia.off | ite8291r3-ctl anim

modprobe bbswitch

rmmod nvidia_uvm
rmmod nvidia_drm
rmmod nvidia_modeset
rmmod nvidia
rmmod nouveau

echo OFF > /proc/acpi/bbswitch

if [[ "$(cat /proc/acpi/bbswitch | cut -c 15)" == 'N' ]]
then
    cat /mnt/uwu/4C/zbin/ite/ite.nvidia.break | ite8291r3-ctl anim
    qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText 'nvidia' 'FAILED'
else
    qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText 'nvidia' 'disabled OFF'
fi
