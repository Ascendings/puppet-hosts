# == Class: hosts
#
# Manages the system's hosts file
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# [*localhost*]
#   Whether or not (true or false) to have a localhost entry (IPv4)
#     default: true
#
# [*localhost_names*]
#   An array of hostnames to be used for localhost (IPv4)
#     default: [ 'localhost', 'localhost.domain' ]
#
# [*ip4_hosts*]
#   An hash of IP => hostnames (IPv4)
#     default: [ ]
#
# [*localhost6*]
#   Whether or not (true or false) to have a localhost entry (IPv6)
#     default: true
#
# [*localhost6_names*]
#   An array of hostnames to be used for localhost (IPv4)
#     default: [ 'localhost6', 'localhost6.domain' ]
#
# [*ip6_hosts*]
#   An hash of IP => hostnames (IPv6)
#     default: [ ]
#
# === Examples
#
#  class { 'hosts':
#    localhost        => true,
#    localhost_names  => [ $fqdn, 'localhost' ],
#    ip4_hosts        => [
#      '192.168.0.20' => 'subdomain.example.com',
#    ],
#    localhost6       => true,
#    localhost6_names => [ $fqdn, 'localhost6' ],
#  }
#
# === Authors
#
# Ascendings <brotherballantine@gmail.com>
#
# === Copyright
#
# Copyright 2015 Ascendings, unless otherwise noted.
#

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
