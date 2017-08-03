class role::puppetmaster {
  include ::profile::base
  include ::profile::puppetserver
  include ::profile::puppetdb
}
