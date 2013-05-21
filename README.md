# Apache Puppet Module for Boxen

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
