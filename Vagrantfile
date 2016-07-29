# -*- mode: ruby -*-
# vi: set ft=ruby :
### THIS ENVIRONMENT IS JUST FOR TESTING PROUPOSES

Vagrant.configure(2) do |config|
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = 'Berksfile'
  config.vm.define 'prometheusserver' do |prometheusserver|
    prometheusserver.vm.box = 'ARTACK/debian-jessie'
    prometheusserver.vm.box_url = 'https://atlas.hashicorp.com/ARTACK/boxes/debian-jessie'
    prometheusserver.vm.hostname = 'prometheus-server'
    prometheusserver.vm.network 'private_network', ip: '192.168.50.2'
    prometheusserver.vbguest.auto_update = false
    prometheusserver.vm.network :forwarded_port, guest: 9090, host: 9090
    prometheusserver.vbguest.auto_update = false

    prometheusserver.vm.provision 'chef_zero' do |chef|
      chef.cookbooks_path = 'cookbooks'
      chef.data_bags_path = 'data_bags'
      chef.nodes_path = 'nodes'
      chef.roles_path = 'roles'
#      chef.add_recipe 'prometheus'
      chef.add_recipe 'custom_prometheus'
    end

    prometheusserver.vm.provider 'virtualbox' do |vb|
      vb.memory = '512'
    end
  end

  config.vm.define 'prometheusclient' do |prometheusclient|
    config.berkshelf.enabled = true
    prometheusclient.vm.box = 'ARTACK/debian-jessie'
    prometheusclient.vm.box_url = 'https://atlas.hashicorp.com/ARTACK/boxes/debian-jessie'
    prometheusclient.vm.hostname = 'prometheus-client'
    prometheusclient.vm.network 'private_network', ip: '192.168.50.3'
    prometheusclient.vm.network :forwarded_port, guest: 80, host: 8080
    prometheusclient.vbguest.auto_update = false
    prometheusclient.vm.provider 'virtualbox' do |vb|
      vb.memory = '512'
    end
  end
end
