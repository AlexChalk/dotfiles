Non-optimal alignment. parted wants sectors to start on even 1mbs of the hard disk. 


1mb is 1,048,576 bytes, so if your disk has 512 byte sectors, each partition should
start on 512 * 2048 (1048576) bytes, i.e. each partition should start on a sector
that is a multiple of 2048.

https://wiki.archlinux.org/index.php/Parted#Alignment

wifi didn't work for ages, using a raw psk in wpa_supplicant.conf and performing the
initial connection with NetworkManager then nmcli seemed to fix it.


sudo ln -s $(which bash) /bin/bash

git clone git@github.com:b0o/swaynagmode.git
cd bin-personal
ln -s $HOME/swaynagmode/swaynagmode .


re-add primary channel for user account so primary channel update for user
apps can be performed without sudo.
