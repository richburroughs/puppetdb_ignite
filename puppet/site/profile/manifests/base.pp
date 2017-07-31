class profile::base {
  include ::profile::base::sudo

  package { 'vim-enhanced': }

  file { '/srv':
    ensure => directory,
  }

  file { '/etc/motd':
    ensure  => file,
    content => "Configured as role::${lookup('role', String[1])}\n",
  }
}
