# This class defines the default values
class pnp4nagios::params {
  $package_name   = 'pnp4nagios'
  $package_ensure = 'installed'
  $service_name   = 'npcd'
  $service_ensure = 'running'

}
