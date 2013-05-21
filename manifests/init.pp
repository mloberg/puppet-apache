# Install Apache
#
class apache {
  require apache::config
  include apache::homebrew::apache

  file { '/System/Library/LaunchDaemons/org.apache.httpd.plist':
    content => template('apache/org.apache.httpd.plist.erb'),
    owner   => 'root',
    group   => 'wheel',
    notify  => Service['org.apache.httpd'],
  }

  file { [
    $apache::config::configdir,
    $apache::config::logdir,
    $apache::config::sitesdir
  ]:
    ensure => directory,
    owner  => 'root',
    group  => 'wheel',
  }

  file { $apache::config::configfile:
    content => template('apache/config/httpd.conf.erb'),
    owner   => 'root',
    group   => 'wheel',
    notify  => Service['org.apache.httpd'],
  }

  file { "${boxen::config::envdir}/apache.sh":
    content => template('apache/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }

  service { 'org.apache.httpd':
    ensure  => running,
    require => File[$apache::config::configfile],
  }
}
