#  ~/dotfiles/arch-linux-x86-64/generate_mac_address.sh :16 Oct at 08:01:02 AM
od -An -N6 -tx1 /dev/urandom |sed -e 's/^ *//' -e 's/ */:/g' -e 's/:$//' -e 's/^\(.\)[13579bdf]/\10/'
