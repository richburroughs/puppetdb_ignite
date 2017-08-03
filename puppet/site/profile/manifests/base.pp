class profile::base {
  include ::profile::base::sudo
  include ::profile::base::hosts

  # This is separate from the puppet5 repo
  class { ::puppet_agent:
    collection      => 'PC1',
    package_version => '5.0.0',
  }

  package { 'vim-enhanced': }

  file { '/srv':
    ensure => directory,
  }

  file { '/etc/motd':
    ensure  => file,
    content => "Configured as role::${lookup('role', String[1])}\n",
  }

  class { ::firewall:
    ensure => stopped,
  }
}
