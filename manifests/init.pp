# == Class: pnp4nagios
#
# Full description of class pnp4nagios here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'pnp4nagios':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class pnp4nagios (
  $package_name = $::pnp4nagios::params::package_name,
  $package_cgi_name = $::pnp4nagios::params::package_cgi_name,
  $package_ensure = $::pnp4nagios::params::package_ensure,
  $service_name = $::pnp4nagios::params::service_name,
  $service_ensure = $::pnp4nagios::params::service_ensure,

  $sysconfdir = $::pnp4nagios::params::sysconfdir,
  $chroot     = $::pnp4nagios::params::chroot,

  $user       = $::pnp4nagios::params::user,
  $group      = $::pnp4nagios::params::group,
  $log_type   = $::pnp4nagios::params::log_type,
  $log_file   = $::pnp4nagios::params::log_file,
  $max_logfile_size = $::pnp4nagios::params::max_logfile_size,
  $log_level  = $::pnp4nagios::params::log_level,
  $perfdata_spool_dir = $::pnp4nagios::params::perfdata_spool_dir,
  $perfdata_file_run_cmd = $::pnp4nagios::params::perfdata_file_run_cmd,
  $perfdata_file_run_cmd_args = $::pnp4nagios::params::perfdata_file_run_cmd_args,
  $identify_npcd              = $::pnp4nagios::params::identify_npcd,
  $npcd_max_threads           = $::pnp4nagios::params::npcd_max_threads,
  $sleep_time                 = $::pnp4nagios::params::sleep_time,
  $load_threshold             = $::pnp4nagios::params::load_threshold,
  $pid_file                   = $::pnp4nagios::params::pid_file,
  $perfdata_file              = $::pnp4nagios::params::perfdata_file,
  $perfdata_spool_filename    = $::pnp4nagios::params::perfdata_spool_filename,
  $perfdata_file_processing_interval = $::pnp4nagios::params::perfdata_file_processing_interval,
  $rrdtool_to_chroot_command         = $::pnp4nagios::params::rrdtool_to_chroot_command,
) inherits pnp4nagios::params {

  include pnp4nagios::install
  include pnp4nagios::config
  include pnp4nagios::service

  Class[pnp4nagios::install] ->
  Class[pnp4nagios::config] ~>
  Class[pnp4nagios::service]

}
