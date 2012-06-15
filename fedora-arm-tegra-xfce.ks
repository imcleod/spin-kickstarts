
%include fedora-arm-base.ks
%include fedora-xfce-base.ks



%packages
#for panda we only want to have the omap kernel installed
-kernel
-kernel-highbank
-kernel-imx
-kernel-omap
kernel-tegra

%end

%post

# setup boot.scr
cat >> /boot/boot.scr.in << EOF

setenv bootargs ro root=%ROOTFSID% rootwait rhgb quiet
ext2load mmc 0:1 4080000 /uImage
ext2load mmc 0:1 4400000 /uInitrd
bootm 4080000 4400000
EOF

sed -i -e "|%ROOTFSID%|$(grep ' / ' /etc/fstab |sed -e 's| .*$||g')|g" /boot/boot.scr.in

mkimage -A arm -O linux -a 0 -e 0 -T script -C none -n "Fedora Boot Script" -d /boot/boot.scr.in /boot/boot.scr

%end
