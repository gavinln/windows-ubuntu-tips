# Ubuntu 24.04 setup

Upgrade to Ubuntu 24.04 from Ubuntu 22.04

## Update 22.04

Update the system and reboot

```
sudo apt update
sudo apt upgrade
sudo reboot now
```

## Upgrade form 22.04 to 24.04

```
sudo apt install ubuntu-release-upgrader-core
sudo do-release-upgrade -d
```

## Verify the new version

```
cat /etc/os-release
lsb_release -a
uname -mrs
```

## Install Ubuntu desktop

```
sudo apt install ubuntu-desktop
```

## Install Chrome

1. Download the Chrome deb file

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

2. Install the deb file

```
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

## Links

[Install Chrome][1000]

[1000]: https://www.xda-developers.com/how-install-chrome-ubuntu/

[Things to do][1010] after installing Ubuntu 24.04

[1010]: https://jumpcloud.com/blog/things-to-do-after-installing-ubuntu-24-04

https://www.cyberciti.biz/faq/how-to-upgrade-from-ubuntu-22-04-lts-to-ubuntu-24-04-lts/

https://www.cherryservers.com/blog/upgrade-from-ubuntu-2204-to-ubuntu-2404-lts

https://linuxconfig.org/ubuntu-upgrade-to-24-04-noble-numbat-a-step-by-step-howto-guide

https://jumpcloud.com/blog/how-to-upgrade-ubuntu-22-04-to-ubuntu-24-04
