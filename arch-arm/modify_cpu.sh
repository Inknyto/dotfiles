# https://stackoverflow.com/questions/20221680/android-how-to-force-cpu-core-offlineshut-down-cores
#
# echo 0 > /sys/devices/system/cpu/cpuhotplug/enable
echo 0 > /sys/power/cpuhotplug/enable

echo 1 > /sys/devices/system/cpu/cpu4/online # et cetera


