# == Class makeconfig::service
#
# This class is meant to be called from makeconfig.
# It ensure the service is running.
#
class makeconfig::service {

  service { $::makeconfig::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
