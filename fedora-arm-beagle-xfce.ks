
part /boot/efi --fstype=efi --grow --maxsize=50 --size=20
%include fedora-arm-base-x.ks
%include fedora-xfce-base.ks



%packages
#for panda we only want to have the omap kernel installed
-kernel
-kernel-highbank
-kernel-imx
-kernel-tegra
kernel-omap
uboot-beagle

%end

%post
# install the moodloader bits into the vfat partition at the start of the disk
# MLO file must be the first thing written to the partition
cp /usr/share/uboot-beagle/MLO /boot/efi/MLO
sync
cp /usr/share/uboot-beagle/u-boot.img /boot/efi/u-boot.img

# setup uEnv.txt on efi  partition to load uEnv.txt on /boot
cat >> /boot/efi/uEnv.txt << EOF
bootenv=/uEnv.txt
loaduimage=ext2load mmc 0:2 ${loadaddr} ${bootenv}
mmcboot=echo Running script from mmc ...; source ${loadaddr}
EOF

# setup uEnv.txt on /boot to load kernel
echo >> /boot/uEnv.txt << EOF
bootfile=/uImage
bootinitrd=/uInitrd
boot=bootm
console=ttyO2,115200n8
address_image=0x80300000
address_initrd=0x81600000
mmcroot=LABEL=%ROOTFSID% ro
mmcargs=setenv bootargs console=${console} root=${mmcroot} quiet rootwait rhgb
loaduimage=run xyz_mmcboot; run mmcargs; ${boot} ${address_image} ${address_initrd}
xyz_load_image=ext2load mmc 0:2 ${address_image} ${bootfile}
xyz_load_initrd=ext2load mmc 0:2 ${address_initrd} ${bootinitrd}
xyz_mmcboot=run xyz_load_image; run xyz_load_initrd; echo Booting from mmc ...
EOF

sed -i -e "|%ROOTFSID%|$(grep ' / ' /etc/fstab |sed -e 's| .*$||g')|g" /boot/uEnv.txt

%end
