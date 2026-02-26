#  ~/dotfiles/arch-linux-x86-64/masscan_entire_internet.sh :16 Oct at 07:59:50 AM
(masscan 0.0.0.0/0 -p80 --banner --exclude 255.255.255.255 --max-rate 100000|tee internet_ips_to_block_ranges.txt 2>&1 /dev/null); 1&> /dev/null
