class profile::base::sudo {
  include ::sudo

  $path = [
    '/usr/local/bin',
    '/usr/local/sbin',
    '/sbin',
    '/bin',
    '/usr/sbin',
    '/usr/bin',
    '/opt/puppetlabs/bin'
  ].join(':')

  sudo::conf {
    default:
      priority => 100,
    ;
    '%wheel':
      content => '%wheel ALL=(ALL) ALL',
    ;
    '%vagrant':
      content => '%vagrant ALL=(ALL) NOPASSWD: ALL',
    ;
  }
}
