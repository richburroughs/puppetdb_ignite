# This class is used via puppet apply when bootstrapping the master
class profile::puppetserver::bootstrap {
  package { 'puppetserver':
    notify  => Service['puppetserver'],
  }

  file { '/etc/sysconfig/puppetserver':
    source  => 'puppet:///modules/profile/puppetserver/sysconfig.sh',
    require => Package['puppetserver'],
    notify  => Service['puppetserver'],
  }

  file { '/etc/puppetlabs/code/environments/production':
    ensure  => link,
    target  => '/vagrant/puppet',
    force   => true,
    require => Package['puppetserver'],
  }

  ini_setting { '/etc/puppetlabs/puppet/puppet.conf autosign':
    section => 'master',
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    setting => 'autosign',
    value   => 'true',
    require => Package['puppetserver'],
    notify  => Service['puppetserver'],
  }

  service { 'puppetserver':
    ensure => running,
    enable => true,
  }
}
