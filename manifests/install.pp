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

  $directories = [ '/var/www/usr',
                   '/var/www/usr/local',
                   '/var/www/usr/local/lib',
                   '/var/www/usr/local/lib/kohana',
                   '/var/www/var',
                   '/var/www/var/www',
                   '/var/www/etc/pnp4nagios',
                   '/var/www/bin', ]

  file { $directories:
    ensure => 'directory',
    before => [ Exec['copy kohana system'], Exec['copy sh'], Exec['copy config.php'], ],
  }

  file { '/var/www/var/www/pnp4nagios':
    ensure => 'link',
    target => '../../pnp4nagios',
  }

  # Allow it to write session files here
  # maybe setting conf['tmp'] to some other value, and then granting _icinga user only access
  file { '/var/www/tmp':
    mode => '1777'
  }

  exec { 'copy kohana system':
    command => '/bin/cp -r /usr/local/lib/kohana/system /var/www/usr/local/lib/kohana/system',
    creates => '/var/www/usr/local/lib/kohana/system',
    require => Package[$package_name],
  }
  exec { 'copy sh':
    command => '/bin/cp /bin/sh /var/www/bin/sh',
    creates => '/var/www/bin/sh',
    require => Package[$package_name],
  }
  exec { 'copy config.php':
    command => '/bin/cp /etc/pnp4nagios/config.php /var/www/etc/pnp4nagios',
    creates => '/var/www/etc/pnp4nagios/config.php',
    require => Package[$package_name],
  }

}
