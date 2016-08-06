#
# Cookbook Name:: custom_prometheus
# Recipe:: default
#

include_recipe 'grafana'
#grafana_datasource 'graphite-test' do
#  datasource(
#    type: 'prometheus',
#    url: 'http://192.168.50.2:9090',
#    access: 'direct'
#  )
#end
