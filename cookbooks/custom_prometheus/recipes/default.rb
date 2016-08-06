#
# Cookbook Name:: custom_prometheus
# Recipe:: default
#

include_recipe 'prometheus'

template '/etc/init.d/prometheus' do
  source 'prometheus.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

prometheus_job 'rack-example' do
  scrape_interval   '15s'
  target            'http://192.168.50.3:5000'
  metrics_path  '/metrics'
end

prometheus_job 'rack-example-machine' do
  scrape_interval   '15s'
  target            'http://192.168.50.3:9100/metrics'
end
