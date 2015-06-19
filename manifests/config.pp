# See README.md for details.
class hosts::config inherits ::hosts {

  file { $::hosts::hosts_file:
    ensure  => file,
    owner   => $::hosts::hosts_file_owner,
    group   => $::hosts::hosts_file_group,
    mode    => $::hosts::hosts_file_mode,
    content => template($::hosts::hosts_file_template),
    
  }

}
