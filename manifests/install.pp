# This class takes care of installation
class pnp4nagios::install {
  $package_name = $::pnp4nagios::package_name
  $package_ensure = $::pnp4nagios::package_ensure

  package { $package_name:
    ensure => $package_ensure,
  }

}
