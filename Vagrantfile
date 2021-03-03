# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box         = 'tas50/windows_2019'
  config.vm.box_version = '202005.07.0'

  # connect with `vagrant rdp`
  # username: vagrant
  # password: vagrant
  # Files can be accessed at c:\vagrant
  config.vm.provider 'virtualbox' do |v|
    # v.gui    = true
    v.memory = 2048
    v.cpus   = 2
  end

  config.vm.provision 'shell', path: 'scripts/setup.ps1'
end
