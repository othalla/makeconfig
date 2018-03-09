# == Class makeconfig::install
#
# This class is called from makeconfig for install.
#
class makeconfig::install {

  package { $::makeconfig::package_name:
    ensure => present,
  }
}
