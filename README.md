#Hosts

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with hosts](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)

##Overview

The hosts module manages your system's host entries.

##Module Description

The hosts module sets host file entries across multiple operating systems and distributions.

##Setup

###Beginning with hosts

`include '::hosts'` will be enough to get you started. If you would like to specify names for localhost, simply do:

```puppet
class { '::hosts':
  localhost_names => [ 'localhost', 'other.localhost.name' ],
}
```

##Usage

All interaction with the hosts module can be done through the main hosts class. This means you can simply (and easily) mess with the options in `::hosts` to have full functionality of the module.

###I just want to manage hosts, what's the minimum I need?

```puppet
include '::hosts'
```

###I'd like to specify some custom names for localhost

```puppet
class { '::hosts':
  localhost_names => [ 'localhost', 'other.localhost.name' ],
}
```

###Solid! I'd like some other host entries now...

```puppet
class { '::hosts':
  localhost_names => [ 'localhost', 'other.localhost.name' ],
  ip4_hosts       => {
    '192.168.0.10' => [ 'subdomain.example.com', 'another.alias' ],
    '192.168.0.20' => [ 'subdomain2.example.com' ],
  }
}
```

###What about IPv6? I hear that that's some baller new technology.

```puppet
class { '::hosts':
  localhost_names  => [ 'localhost', 'other.localhost.name' ],
  ip4_hosts        => {
    '192.168.0.10' => [ 'subdomain.example.com', 'another.alias' ],
    '192.168.0.20' => [ 'subdomain2.example.com' ],
  }
  localhost6_names => [ 'localhost6', 'other.localhost6.name' ],
  ip6_hosts        => {
    '2001:db8::ff00:42:8329' => [ 'subdomain6.example.com', 'another.alias6' ],
  }
}
```

###Looks great!  But I'd like a different template; we need to do something unique here.

```puppet
class { '::hosts':
  localhost_names     => [ $fqdn, 'localhost' ],
  localhost6_names    => [ $fqdn, 'localhost6' ],
  hosts_file_template => 'different/module/custom.template.erb',
}
```

##Reference

###Classes

####Public Classes

* hosts: Main class, includes all other classes.

####Private Classes

* hosts::config: Handles the configuration file.
* hosts::exec: Handles flushing the DNS cache (if needed).

###Parameters

The following parameters are available in the `::hosts` class:



####`localhost`

Specifies whether you want a localhost (IPv4) entry. Default value: true

####`localhost_names`

An array of hostnames to apply to your localhost entry. Default value: [ 'localhost', 'localhost.domain' ]

####`ip4_hosts`

A hash of ip/hostname entries (IPv4). Set to false for none. Default value: false

####`localhost6`

Specifies whether you want a localhost (IPv6) entry. Default value: true

####`localhost6_names`

An array of hostnames to apply to your localhost entry (IPv6). Default value: [ 'localhost6', 'localhost6.domain' ]

####`ip6_hosts`

A hash of ip/hostname entries (IPv6). Set to false for none. Default value: false

####`hosts_file`

The path to the system's host file. Default value: varies based on OS

####`hosts_file_template`

Specify the path to your custom hosts file. Default value: hosts/hosts.erb

####`hosts_file_owner`

The owner of the hosts file. Default value: 'root'

####`hosts_file_group`

The group owner of the hosts file. Default value: 'root'

####`hosts_file_mode`

The mode (permissions) of the hosts file. Default value: '0644'

####`hosts_flush`

Command to flush DNS cache after hosts file is updated (not recommended unless required). Set to false for no flushing. Default value: varies based on OS


##Limitations

This module has been tested on Ubuntu, and no issues have been identified.


##License

This module is licensed under the Apache License 2.0

##Contact

brotherballantine@gmail.com

##Support

There's nothing official yet.
Just shoot me an email and I'll get to your request.
