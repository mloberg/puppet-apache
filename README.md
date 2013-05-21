# Apache Puppet Module for Boxen

[![Build Status](https://travis-ci.org/mloberg/puppet-apache.png?branch=master)](https://travis-ci.org/mloberg/puppet-apache)

Manage Apache.

## Usage

```puppet
include apache

apache::vhost { 'site-name':
    docroot => "/path/to/site", # Default: ${boxen::config::src}/${name}
    host    => "hostname", # Default: ${name}.dev
}
```

## Required Puppet Modules

* `boxen`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
