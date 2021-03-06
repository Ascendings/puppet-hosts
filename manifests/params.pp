# See README.md for details.
class hosts::params {
  # Root user defaults
  $root_user               = $::osfamily ? {
    default => 'root',
  }
  # Root group defaults
  $root_group              = $::osfamily ? {
    'FreeBSD' => 'wheel',
    default   => 'root',
  }

  # IPv4 default parameter values
  $localhost        = true
  $localhost_names  = [ 'localhost', 'localhost.domain' ]
  $ip4_hosts        = false

  # IPv6 default parameter values
  $localhost6       = true
  $localhost6_names = [ 'localhost6', 'localhost6.domain' ]
  $ip6_hosts        = false

  # Parameters related to hosts file and configuration
  $hosts_file_path = $::osfamily ? {
    default   => '/etc/hosts',
  }

  $hosts_file_template = 'hosts/hosts.erb'
  $hosts_file_source   = false
  $hosts_file_owner    = $root_user
  $hosts_file_group    = $root_group
  $hosts_file_mode     = '0644'

  $hosts_flush = $::osfamily ? {
    'AIX'     => 'netcdctrl -t dns -e hosts -f',
    default   => false,
  }
}
