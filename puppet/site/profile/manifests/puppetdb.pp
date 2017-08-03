class profile::puppetdb {
  include ::puppetdb
  include ::puppetdb::master::config

  package { 'puppet-client-tools': }
}
