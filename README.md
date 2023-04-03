# petalinux-stuff

# This repo contains some usefull how-to for petalinux and related stuff

## How to build docker :
docker build .

## How to run built docker container :
sudo docker run -v  /opt/Xilinx/:/opt/Xilinx/ -v $(pwd):/home/petalinux/Work/ -it --dns 8.8.8.8 plnx



# Kria 260 boards
## KV260, rootfs on NFS

1. Create project using proper BSP file
2. Export hardware using proper vivado project (Pay attention on units enabled for PSU (should match the ones defined in BSP), as in case it differs - build will fail)
3. Chose ROTTFS on NFS
4. Disable nfs-utils in rootfs config
5. Enable nfs-server support in kernel config
6. tbd
7. build project
8. copy images to tftpboot directory
9. create shared directory and unpack rootfs there using : tar -xvf rootfs.tar.gz -C <rootfs path> --same-owner
10. open /etc/fstab in unpacked rootfs, comment out line : "LABEL=boot        /boot   vfat    defaults    0   2" as it causes boot stuck
11. tbd

### Example u-boot cli :
* setenv bootargs "ip=192.168.0.111:192.168.0.100 root=/dev/nfs rootfstype=nfs nfsroot=192.168.0.100:/mnt/nfs_share/k26/,nfsvers=3,tcp rw";
* setenv serverip 192.168.0.100
* setenv ipaddr 192.168.0.111

### swith to JTAG boot mode
```
############################
# Switch to JTAG boot mode #
############################
targets -set -filter {name =~ "PSU"}
mwr 0xffca0010 0x0
mwr 0xff5e0200 0x0100
rst -system
```


