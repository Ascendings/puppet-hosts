# See README.md for details
class hosts (
  # IPv4 configuration
  $localhost           = $::hosts::params::localhost,
  $localhost_names     = $::hosts::params::localhost_names,
  $ip4_hosts           = $::hosts::params::ip4_hosts,
  
  # IPv6 configuration
  $localhost6          = $::hosts::params::localhost6,
  $localhost6_names    = $::hosts::params::localhost6_names,
  $ip6_hosts           = $::hosts::params::ip6_hosts,
  
  # Hosts config
  $hosts_file          = $::hosts::params::hosts_file,
  $hosts_file_template = $::hosts::params::hosts_file_template,
  $hosts_file_owner    = $::hosts::params::hosts_file_owner,
  $hosts_file_group    = $::hosts::params::hosts_file_group,
  $hosts_file_mode     = $::hosts::params::hosts_file_mode,
  $hosts_flush         = $::hosts::params::hosts_flush,
) inherits ::hosts::params {

  anchor { 'hosts::begin': } ->
  class { '::hosts::config': } ~>
  class { '::hosts::exec': } ->
  anchor { 'hosts::end': }

}
