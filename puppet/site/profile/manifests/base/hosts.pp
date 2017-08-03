# avahi is not 100% reliable
class profile::base::hosts {
  puppetdb_query('inventory {}').each |$node| {
    if $node['certname'] == $trusted['certname'] {
      # This is the current host. Use 127.0.0.1.
      host { $node['certname']:
        ip           => '127.0.0.1',
        host_aliases => [
          $node['facts']['hostname'],
          'localhost',
          'localhost.localdomain',
          'localhost4',
          'localhost4.localdomain4',
        ],
      }
    } else {
      # A different host.
      host { $node['certname']:
        ip           => $node['facts']['ipaddress'],
        host_aliases => [
          $node['facts']['hostname'],
        ],
      }
    }
  }
}
