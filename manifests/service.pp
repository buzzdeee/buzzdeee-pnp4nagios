# This class takes care of the service
class pnp4nagios::service {
  $service_name = $::pnp4nagios::service_name
  $service_ensure = $::pnp4nagios::service_ensure

  service { $service_name:
    ensure => $service_ensure,
  }

}
