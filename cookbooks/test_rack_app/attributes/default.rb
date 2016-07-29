node.default['rbenv']['user_installs'] = [
  { 'user'    => 'vagrant',
    'rubies'  => ['2.3.1'],
    'global'  => '2.3.1',
    'gems'    => {
      '2.3.1'    => [
        { 'name'    => 'bundler',
          'version' => '1.12.5'
        },
        { 'name'    => 'rake' }
      ]
    }
  }
]
