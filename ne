#!/bin/sh

# turns on Nvidia graphics and loads driver
# install nvidia driver from repos (i recommend v510)
# and bbswitch (or bbswitch-dkms)

echo ON > /proc/acpi/bbswitch
# sh /mnt/uwu/4C/zbin/ite | ite8291r3-ctl anim

cat /mnt/uwu/4C/zbin/ite/ite.nvidia.on | ite8291r3-ctl anim

modprobe nvidia
modprobe nvidia_modeset
# modprobe nvidia_drm modeset=1
modprobe nvidia_drm
modprobe nvidia_uvm

# nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"


if [[ $1 == 'n' ]]
then
    nvidia-smi
fi

if [[ "$(cat /proc/acpi/bbswitch | cut -c 15)" == 'F' ]]
then 
    cat /mnt/uwu/4C/zbin/ite/ite.nvidia.break | ite8291r3-ctl anim
    qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText 'nvidia' 'FAILED'
else
    qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText 'nvidia' 'enabled ON'

fi
