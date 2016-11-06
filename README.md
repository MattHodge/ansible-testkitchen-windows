# ansible-testkitchen-windows

## Install Gems
```
gem install kitchen-ansible
gem install kitchen-vagrant
gem install winrm
gem install winrm-fs
gem install kitchen-pester
```

## Run Test Kitchen
```
kitchen destroy && kitchen create && kitchen converge && kitchen verify
```
