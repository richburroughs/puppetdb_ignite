class profile::web {
  file { '/srv/web':
    ensure => directory,
  }
}
