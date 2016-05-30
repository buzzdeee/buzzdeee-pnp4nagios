# the parameters that steer the module
class pnp4nagios::params {
  $chrooted = true
  $chroot_root = '/var/www'
  $rrdtool_chroot_cmd = '/usr/local/share/examples/rrdtool/rrdtool-chroot enable'
  
  $chrooted_fpm_socket = '/run/php-fpm-pnp4nagios.sock'

  $kohana_system = '/usr/local/lib/kohana/system'
}
