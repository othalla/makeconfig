# Class: makeconfig
# ===========================
#
# Full description of class makeconfig here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class makeconfig (
  $package_name = $::makeconfig::params::package_name,
  $service_name = $::makeconfig::params::service_name,
) inherits ::makeconfig::params {

  # validate parameters here

  class { '::makeconfig::install': } ->
  class { '::makeconfig::config': } ~>
  class { '::makeconfig::service': } ->
  Class['::makeconfig']
}
