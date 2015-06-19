# See README.md for details.
class hosts::exec inherits ::hosts {

  if $::hosts::hosts_flush != false {
    exec { 'hosts_flush':
      cmd => $::hosts::hosts_flush
    }
  }

}
