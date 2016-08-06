#
# Cookbook Name:: custom_prometheus
# Recipe:: default
#
#include_recipe 'ruby_build'

#include_recipe 'ruby_rbenv::user'
package ['ruby','bundler','git']

git '/home/vagrant/rack_app' do
  repository 'https://github.com/prometheus/client_ruby.git'
   revision 'master'
   action :checkout
   user 'vagrant'
   group 'vagrant'
end

directory '/home/vagrant/Prometheus' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

remote_file '/home/vagrant/Prometheus/node_export.tgz' do
  source 'https://github.com/prometheus/node_exporter/releases/download/0.11.0/node_exporter-0.11.0.linux-amd64.tar.gz'
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end
