# this class configures the service
class pnp4nagios::config {

  $sysconfdir = $::pnp4nagios::sysconfdir
  $chroot = $::pnp4nagios::chroot

}
