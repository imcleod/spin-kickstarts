# fedora-livecd-xfce.ks
#
# Description:
# - Fedora Live Spin with the light-weight XFCE Desktop Environment
#
# Maintainer(s):
# - Rahul Sundaram    <sundaram@fedoraproject.org>
# - Christoph Wickert <cwickert@fedoraproject.org>
# - Kevin Fenzi       <kevin@tummy.com>
# - Adam Miller       <maxamillion@fedoraproject.org>


%packages

# Office
abiword
gnumeric

# Graphics
epdfview

# Development
geany

# Internet
firefox
# Add the midori browser as a lighter alternative
midori
claws-mail
claws-mail-plugins-archive
claws-mail-plugins-att-remover
claws-mail-plugins-attachwarner
claws-mail-plugins-bogofilter
claws-mail-plugins-fetchinfo
claws-mail-plugins-mailmbox
claws-mail-plugins-newmail
claws-mail-plugins-notification
claws-mail-plugins-pgp
claws-mail-plugins-rssyl
claws-mail-plugins-smime
claws-mail-plugins-spam-report
claws-mail-plugins-tnef
claws-mail-plugins-vcalendar
liferea
pidgin
remmina
remmina-plugins-rdp
remmina-plugins-vnc
transmission

# Sound & Video
alsa-plugins-pulseaudio
asunder
cheese
pavucontrol
parole
pragha
xfburn

# System
gparted
-gnome-disk-utility
gigolo
setroubleshoot

# Accessories
catfish
galculator
seahorse
ConsoleKit-x11

# More Desktop stuff
# java plugin
icedtea-web
NetworkManager-vpnc
NetworkManager-openvpn
NetworkManager-pptp
gnome-bluetooth
xscreensaver
xdg-user-dirs-gtk

# FIXME: work around #746693
metacity

# default artwork
fedora-icon-theme
adwaita-cursor-theme
adwaita-gtk2-theme
adwaita-gtk3-theme

# command line
irssi
mutt
ntfs-3g
powertop
rtorrent
vim-enhanced
wget
yum-utils

# Xfce packages
@xfce-desktop
ristretto
thunar-media-tags-plugin
xfce4-battery-plugin
xfce4-cellmodem-plugin
xfce4-clipman-plugin
xfce4-cpugraph-plugin
xfce4-datetime-plugin
xfce4-dict-plugin
xfce4-diskperf-plugin
xfce4-eyes-plugin
xfce4-fsguard-plugin
xfce4-genmon-plugin
xfce4-mailwatch-plugin
xfce4-mount-plugin
xfce4-netload-plugin
xfce4-notes-plugin
xfce4-places-plugin
xfce4-quicklauncher-plugin
xfce4-screenshooter-plugin
xfce4-sensors-plugin
xfce4-smartbookmark-plugin
xfce4-systemload-plugin
xfce4-taskmanager
xfce4-time-out-plugin
xfce4-timer-plugin
xfce4-verve-plugin
# we already have nm-applet
#xfce4-wavelan-plugin
xfce4-weather-plugin
xfce4-websearch-plugin
xfce4-xfswitch-plugin
xfce4-xkb-plugin
# system-config-printer does printer management better
#xfprint
xfwm4-themes

%end

