
@include fedora-arm-base.ks
xconfig --startxonboot


%packages
@base-x
@fonts
@input-methods
ibus-pinyin-db-open-phrase

%end
