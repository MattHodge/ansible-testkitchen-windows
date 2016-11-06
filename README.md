# Ansible / Test-Kitchen / Windows / Pester

This repo is an example of how you can test Ansible roles meant for Windows machines using test-kitchen.

The process will build an Ansible server as part of a test-kitchen run, apply configuration to a Windows node and then tests via Pester.

<!-- TOC depthFrom:2 -->

- [Setup your workstation](#setup-your-workstation)
- [Install required Ruby gems](#install-required-ruby-gems)
- [Run test-kitchen](#run-test-kitchen)
- [Resources](#resources)

<!-- /TOC -->

## Setup your workstation

I HIGHLY recommend using **chefdk** and its version of Ruby, especially on Windows platforms.

Install the following:
* ChefDK
* Vagrant
* VirtualBox

## Install required Ruby gems

Before starting we need to install some Ruby gems.

```bash
# enter the kitchen directory
cd kitchen

# use bundler to install the gems
chef exec bundle install
```

## Run test-kitchen

With everything installed we can start using **test-kitchen**.

```bash
# enter the kitchen directory
cd kitchen

# create the vms
# on windows you may get a UAC prompt when virtualbox initially configures networking 
kitchen create

# apply the ansible role to the windows server
kitchen converge

# run the tests against the windows server
kitchen verify

# delete the vms
kitchen destroy
```

## Resources
* [https://github.com/neillturner/kitchen-ansible/](https://github.com/neillturner/kitchen-ansible/)
* [https://github.com/neillturner/kitchen-ansible/blob/master/provisioner_options.md](https://github.com/neillturner/kitchen-ansible/blob/master/provisioner_options.md)
* [https://github.com/neillturner/ansible_windows_repo](https://github.com/neillturner/ansible_windows_repo)
