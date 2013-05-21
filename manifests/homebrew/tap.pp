# Tap formulas into homebrew
#
# Examples
#
#   apache::homebrew::tap { 'homebrew/apache': }
#   apache::homebrew::tap { 'tap/name':
#     ensure => absent,
#   }
#
define apache::homebrew::tap (
  $ensure = present,
) {
  $find = "brew tap | grep ${name}"
  if $ensure == 'present' {
    exec { "homebrew_tap_${name}":
      command => "brew tap ${name}",
      unless  => $find,
    }
  } else {
    exec { "homebrew_untap_${name}":
      command => "brew untap ${name}",
      onlyif  => $find,
    }
  }
}
