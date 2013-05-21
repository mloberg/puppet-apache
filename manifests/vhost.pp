define apache::vhost (
  $ensure  = present,
  $docroot = undef,
  $host    = undef,
) {
  include apache

  $vhost_docroot = $docroot ? {
    undef   => "${boxen::config::srcdir}/${name}",
    default => $docroot
  }

  $hostname = $host ? {
    undef   => "${name}.dev",
    default => $host
  }

  $_ensure = $ensure ? {
    present => file,
    default => $ensure
  }

  file { "${apache::config::sitesdir}/${name}.conf":
    ensure  => $_ensure,
    content => template('apache/config/vhost.conf.erb'),
    notify  => Service['org.apache.httpd'],
  }
}
