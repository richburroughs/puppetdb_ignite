# This class is used via puppet apply when bootstrapping the master
class profile::puppetserver::bootstrap2 {
  include ::puppetdb
  include ::puppetdb::master::config

  file { '/etc/puppetlabs/code/environments/production':
    ensure  => link,
    target  => '/vagrant/puppet',
    force   => true,
    require => Package['puppetserver'],
  }

  # Order is important since Service['puppetserver'] has to be defined before
  # resources that notify it only if it already exists.
  include ::profile::puppetserver::bootstrap
}
