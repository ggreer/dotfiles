#!/bin/bash
#set -x
#set -e

# Disable the NMI watchdog
echo '0' > '/proc/sys/kernel/nmi_watchdog';

# Runtime power management for I2C devices
for i in /sys/bus/i2c/devices/*/device/power/control ; do
    echo auto > ${i}
done

# Runtime power-management for PCI devices
for i in /sys/bus/pci/devices/*/power/control ; do
    echo auto > ${i}
done

# Runtime power-management for USB devices
for i in /sys/bus/usb/devices/*/power/control ; do
    echo auto > ${i}
done

# Low power SATA
for i in /sys/class/scsi_host/*/link_power_management_policy ; do
    echo min_power > ${i}
done

# Disable Wake-on-LAN on ethernet port
ethtool -s wlan0 wol d;
ethtool -s eth0 wol d

#Enable Audio codec power management
echo '1' > '/sys/module/snd_hda_intel/parameters/power_save';

# Higher writeback timeout
#echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs'

# Low power wireless
iw dev wlan0 set power_save on
