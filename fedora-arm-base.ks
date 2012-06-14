# fedora-arm-base.ks
#
# Defines the basics for all kickstarts in the fedora-arm branch
# Does not include package selection (other then mandatory)
# Does not include localization packages or configuration
#
# Does includes "default" language configuration (kickstarts including
# this template can override these settings)

lang en_US.UTF-8
keyboard us
timezone US/Eastern
auth --useshadow --enablemd5
selinux --enforcing
firewall --enabled --service=mdns,sshd
xconfig --startxonboot
part /boot --fstype=ext3  --size=256
part / --size 3072 --fstype ext4
services --enabled=NetworkManager,sshd

#repo --name=rawhide --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=rawhide&arch=$basearch
repo --name=fedora --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch
#repo --name=updates-testing --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-f$releasever&arch=$basearch

%packages
@base-x
@base
@core
@fonts
@input-methods
# use a small pinyin db for live
-ibus-pinyin-db-open-phrase
ibus-pinyin-db-android
@admin-tools
@dial-up
@hardware-support
@printing


uboot-tools

# fpaste is very useful for debugging and very small
fpaste

%end

