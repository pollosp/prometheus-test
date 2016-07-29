default['prometheus']['install_method']  = 'binary'

case node['platform_family']
when 'debian'
  if node['platform'] == 'ubuntu'
    default['prometheus']['init_style']                                                   = 'upstart'
  else
    default['prometheus']['init_style']                                                   = 'init'
  end
when 'rhel', 'fedora'
  if node['platform_version'].to_i >= 7
    default['prometheus']['init_style']                                                   = 'systemd'
  else
    default['prometheus']['init_style']                                                   = 'init'
  end
else
  default['prometheus']['init_style']                                                     = 'init'
end

