# this class configures the service
class pnp4nagios::config {

  $sysconfdir = $::pnp4nagios::sysconfdir
  $chroot = $::pnp4nagios::chroot

  $user = $::pnp4nagios::user
  $group = $::pnp4nagios::group
  $log_type = $::pnp4nagios::log_type
  $log_file = $::pnp4nagios::log_file
  $max_logfile_size = $::pnp4nagios::max_logfile_size
  $log_level = $::pnp4nagios::log_level
  $perfdata_spool_dir = $::pnp4nagios::perfdata_spool_dir
  $perfdata_file_run_cmd = $::pnp4nagios::perfdata_file_run_cmd
  $perfdata_file_run_cmd_args = $::pnp4nagios::perfdata_file_run_cmd_args
  $identify_npcd = $::pnp4nagios::identify_npcd
  $npcd_max_threads = $::pnp4nagios::npcd_max_threads
  $sleep_time = $::pnp4nagios::sleep_time
  $load_threshold = $::pnp4nagios::load_threshold
  $pid_file = $::pnp4nagios::pid_file
  $perfdata_file = $::pnp4nagios::perfdata_file
  $perfdata_spool_filename = $::pnp4nagios::perfdata_spool_filename
  $perfdata_file_processing_interval = $::pnp4nagios::perfdata_file_processing_interval

  file { "${sysconfdir}/npcd.cfg":
    owner   => 'root',
    group   => '0',
    mode    => '0644',
    content => template('pnp4nagios/npcd.cfg.erb'),
  }

}
