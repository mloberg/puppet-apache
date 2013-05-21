class apache::homebrew::apache {
  apache::homebrew::tap { 'homebrew/apache': }

  file { "/Applications/Xcode.app/Contents/Developer/Toolchains/OSX${::macosx_productversion_major}.xctoolchain":
    ensure => 'link',
    source => '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain',
    owner  => 'root',
    group  => 'wheel'
  }
}
