#!/bin/sh

cd /usr/src/linux

for i in $@
do
	if [[ $i == 'local' || $i == 'loc' || $i == 'l' ]]
	then
		make localmodconfig
	fi
done
make menuconfig


figlet WARNING
echo workload is gonna be insane, cpu might die. press ctrl+c to cancel
for i in {5..1}
do
	printf "$i "
	sleep 1
done
echo " \n "
nice -n 19 ionice -c 3 make -j$(nproc)
# todo : get number of cpu cores at runtime
make install
make modules_install
cd /boot/
dracut initrd-5.19.0-pf6-no-preempt 5.19.0-pf6-no-preempt --force
# todo : make an option for mkinitrd or whatever its called on human ish distros
grub-mkconfig -o /boot/grub/grub.cfg
