# See README.md for details.
class hosts::params {
  # IPv4 default parameter values
  $localhost        = true
  $localhost_names  = [ 'localhost', 'localhost.domain' ]
  $ip4_hosts        = false
  
  # IPv6 default parameter values
  $localhost6       = true
  $localhost6_names = [ 'localhost6', 'localhost6.domain' ]
  $ip6_hosts        = false
  
  # Parameters related to hosts file and configuration
  $hosts_file = $::osfamily ? {
    default   => '/etc/hosts',
  }
  
  $hosts_file_template = 'hosts/hosts.erb'
  $hosts_file_owner    = 'root'
  $hosts_file_group    = 'root'
  $hosts_file_mode     = '0644'
  
  $hosts_flush = $::osfamily ? {
    'AIX'     => 'netcdctrl -t dns -e hosts -f',
    default   => false,
  }
}
