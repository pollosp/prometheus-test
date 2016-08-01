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
      chef.add_recipe 'custom_prometheus'
    end

    prometheusserver.vm.provider 'virtualbox' do |vb|
      vb.memory = '512'
    end
  end

  config.vm.define 'prometheusclient' do |prometheusclient|
    config.berkshelf.enabled = true
    config.berkshelf.berksfile_path = 'Berksfile-client'
    prometheusclient.vm.box = 'ARTACK/debian-jessie'
    prometheusclient.vm.box_url = 'https://atlas.hashicorp.com/ARTACK/boxes/debian-jessie'
    prometheusclient.vm.hostname = 'prometheus-client'
    prometheusclient.vm.network 'private_network', ip: '192.168.50.3'
    prometheusclient.vm.network :forwarded_port, guest: 80, host: 8080
    prometheusclient.vbguest.auto_update = false

    prometheusclient.vm.provision 'chef_zero' do |chef|
      chef.cookbooks_path = 'cookbooks'
      chef.data_bags_path = 'data_bags'
      chef.nodes_path = 'nodes'
      chef.roles_path = 'roles'
      chef.add_recipe 'test_rack_app'
    end
    prometheusclient.vm.provider 'virtualbox' do |vb|
      vb.memory = '512'
    end
  end

  config.vm.define 'grafana' do |grafana|
    config.berkshelf.enabled = true
    config.berkshelf.berksfile_path = 'Berksfile-grafana'
    grafana.vm.box = 'ARTACK/debian-jessie'
    grafana.vm.box_url = 'https://atlas.hashicorp.com/ARTACK/boxes/debian-jessie'
    grafana.vm.hostname = 'prometheus-client'
    grafana.vm.network 'private_network', ip: '192.168.50.4'
    grafana.vm.network :forwarded_port, guest: 3000, host: 8081
    grafana.vbguest.auto_update = false

    grafana.vm.provision 'chef_zero' do |chef|
      chef.cookbooks_path = 'cookbooks'
      chef.data_bags_path = 'data_bags'
      chef.nodes_path = 'nodes'
      chef.roles_path = 'roles'
      chef.add_recipe 'grafana'
        chef.json = {
      'custom_grafana' => {
        'webserver' => '',
        'version' => 'latest'
      }
    }
    end
    grafana.vm.provider 'virtualbox' do |vb|
      vb.memory = '512'
    end
  end
end
