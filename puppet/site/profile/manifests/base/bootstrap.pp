# This class is used via puppet apply when bootstrapping agents
class profile::base::bootstrap {
  ini_setting { '/etc/puppetlabs/puppet/puppet.conf server':
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'server',
    value   => 'puppet-master.local',
  }

  # The service doesn't exist during bootstrap; we don't want puppet running
  # quite that early.
  if defined(Service['puppet-agent']) {
    Ini_setting['/etc/puppetlabs/puppet/puppet.conf server']
      ~> Service['puppet-agent']
  }
}
