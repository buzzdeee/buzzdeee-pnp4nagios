# This class takes care of installation
class pnp4nagios::install {
  $package_name = $::pnp4nagios::package_name
  $package_cgi_name = $::pnp4nagios::package_cgi_name
  $package_ensure = $::pnp4nagios::package_ensure
  $rrdtool_to_chroot_command = $::pnp4nagios::rrdtool_to_chroot_command

  package { [ $package_name, $package_cgi_name ]:
    ensure => $package_ensure,
  }

  exec { 'chroot rrdtool':
    command => $rrdtool_to_chroot_command,
    creates => '/var/www/usr/local/bin/rrdtool',
    require => Package[$package_name],
  }

}
