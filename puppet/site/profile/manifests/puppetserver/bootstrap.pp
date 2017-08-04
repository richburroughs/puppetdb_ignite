# This class is used via puppet apply when bootstrapping the master
class profile::puppetserver::bootstrap {
  include ::profile::base::bootstrap

  package { 'puppetserver': }

  file { '/etc/sysconfig/puppetserver':
    source  => 'puppet:///modules/profile/puppetserver/sysconfig.sh',
    require => Package['puppetserver'],
  }

  ini_setting { '/etc/puppetlabs/puppet/puppet.conf autosign':
    section => 'master',
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    setting => 'autosign',
    value   => 'true',
    require => Package['puppetserver'],
  }

  # The service doesn't exist during bootstrap.
  if defined(Service['puppetserver']) {
    Package['puppetserver']
      ~> Service['puppetserver']
    File['/etc/sysconfig/puppetserver']
      ~> Service['puppetserver']
    Ini_setting['/etc/puppetlabs/puppet/puppet.conf autosign']
      ~> Service['puppetserver']
  }
}
