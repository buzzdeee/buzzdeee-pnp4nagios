# This class defines the default values
class pnp4nagios::params {
  $package_name   = 'pnp4nagios'
  $package_ensure = 'installed'
  $service_name   = 'npcd'
  $service_ensure = 'running'

  $sysconfdir = '/etc/pnp4nagios'
  $chroot     = '/var/www'

  $rrdtool_to_chroot_command = '/usr/local/share/examples/rrdtool/rrdtool-chroot enable'

  $user = '_icinga'
  $group = '_icinga'
  $log_type = 'syslog'      # or maybe file
  $log_file = '/var/pnp4nagios/npcd.log'    # only used if log_type = 'file'
  $max_logfile_size = '10485760'
  $log_level = '0'		# may also be 1, 2, or -1 (DEBUG)
  $perfdata_spool_dir = '/var/spool/icinga'
  $perfdata_file_run_cmd = '/usr/local/libexec/nagios/process_perfdata.pl'
  $perfdata_file_run_cmd_args = '--bulk'
  $identify_npcd = '1'
  $npcd_max_threads = '5'
  $sleep_time = '15'
  $load_threshold = '0.0'
  $pid_file = '/var/run/npcd.pid'
  $perfdata_file = '/var/pnp4nagios/perfdata.dump'
  $perfdata_spool_filename = 'perfdata'
  $perfdata_file_processing_interval = '15'



}
