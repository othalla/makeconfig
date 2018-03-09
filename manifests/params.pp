# == Class makeconfig::params
#
# This class is meant to be called from makeconfig.
# It sets variables according to platform.
#
class makeconfig::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'makeconfig'
      $service_name = 'makeconfig'
    }
    'RedHat', 'Amazon': {
      $package_name = 'makeconfig'
      $service_name = 'makeconfig'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
