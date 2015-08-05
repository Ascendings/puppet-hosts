# See README.md for details.
class hosts::config inherits ::hosts {

  unless $::hosts::hosts_file_source == false {
    file { $::hosts::hosts_file_path:
      ensure => file,
      owner  => $::hosts::hosts_file_owner,
      group  => $::hosts::hosts_file_group,
      mode   => $::hosts::hosts_file_mode,
      source => $::hosts::hosts_file_source,
  } else {
    file { $::hosts::hosts_file_path:
      ensure  => file,
      owner   => $::hosts::hosts_file_owner,
      group   => $::hosts::hosts_file_group,
      mode    => $::hosts::hosts_file_mode,
      content => template($::hosts::hosts_file_template),
    }
  }
}
